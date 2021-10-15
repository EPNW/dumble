import 'dart:async';
import 'dart:typed_data';
import 'dart:html' show WebSocket, Event, MessageEvent, CloseEvent;

import 'connection.dart';
import '../platform/platform_options.dart';
import '../platform/platform_options_web.dart';

class ConnectionImp extends Connection {
  final WebSocket _webSocket;

  ConnectionImp(
      this._webSocket, Stream<List<int>> receive, StreamSink<List<int>> send)
      : super(send: send, receive: receive);

  static Future<Connection> connect({required PlatformOptions options}) async {
    PlatformOptionsWeb platformOptions = options as PlatformOptionsWeb;
    WebSocket socket = new WebSocket(platformOptions.uri);
    Stream<List<int>> receive = await _asBinaryStream(socket);
    StreamSink<List<int>> send = new _WebSocketDataSink(socket);
    return new ConnectionImp(socket, receive, send);
  }

  /// It's on purpose that this is a Future<Stream<List<int>>> and not a
  /// Stream<List<int>>, so we can explicitly wait for the open event!
  static Future<Stream<List<int>>> _asBinaryStream(WebSocket socket) async {
    StreamController<List<int>> receive =
        new StreamController<List<int>>(sync: true);
    Completer<void> open = new Completer<void>();
    late final StreamSubscription sub;
    sub = socket.allEvents.listen(
        (Object event) {
          if (event is _OpenEvent) {
            if (!open.isCompleted) {
              open.complete();
            } else {
              receive.addError(new Exception('Received multiple open events!'));
              receive.close();
              sub.cancel();
            }
          } else if (event is CloseEvent) {
            if (!open.isCompleted) {
              open.completeError(event);
            } else {
              receive.close();
              sub.cancel();
            }
          } else if (event is MessageEvent) {
            dynamic data = event.data;
            if (data is List<int>) {
              receive.add(data);
            } else if (data is TypedData) {
              receive.add(data.buffer
                  .asUint8List(data.offsetInBytes, data.lengthInBytes));
            } else if (data is ByteBuffer) {
              receive.add(data.asUint8List(0, data.lengthInBytes));
            } else {
              receive.addError(
                  new Exception('Unrecognized data $data in message event!'));
              receive.close();
              sub.cancel();
            }
          } else {
            if (!open.isCompleted) {
              open.completeError(event);
            } else {
              receive.addError(event);
              receive.close();
              sub.cancel();
            }
          }
        },
        onDone: () {
          if (!open.isCompleted) {
            open.completeError(new Exception('onDone before onOpen!'));
          } else {
            receive.close();
          }
        },
        cancelOnError: true,
        onError: (Object error, StackTrace? trace) {
          if (!open.isCompleted) {
            open.completeError(error, trace);
          } else {
            receive.addError(error, trace);
            receive.close();
          }
        });
    await open.future;
    return receive.stream;
  }

  @override
  void destroy() {
    _webSocket.close();
  }
}

extension _AllStream on WebSocket {
  Stream<Object> get allEvents {
    List<StreamSubscription> subs = [];
    StreamController<Object> controller = new StreamController<Event>(
        sync: true,
        onCancel: () =>
            Future.wait(subs.map((StreamSubscription e) => e.cancel())));
    int notDone = 4;
    Function() onDone = () {
      notDone--;
      if (notDone == 0) {
        controller.close();
      }
    };
    subs.add(onClose.listen(controller.add,
        cancelOnError: true, onError: controller.addError, onDone: onDone));
    subs.add(onOpen.map((Event event) => new _OpenEvent(event)).listen(
        controller.add,
        cancelOnError: true,
        onError: controller.addError,
        onDone: onDone));
    subs.add(onError.listen(controller.add,
        cancelOnError: true, onError: controller.addError, onDone: onDone));
    subs.add(onMessage.listen(controller.add,
        cancelOnError: true, onError: controller.addError, onDone: onDone));
    return controller.stream;
  }
}

class _OpenEvent {
  final Event event;
  const _OpenEvent(this.event);
}

class _WebSocketDataSink extends StreamSink<List<int>> {
  final WebSocket _ws;
  final Completer<void> _done;

  _WebSocketDataSink(this._ws) : this._done = new Completer<void>();

  @override
  void add(List<int> event) {
    if (event is TypedData) {
      _ws.sendTypedData(event as TypedData);
    } else {
      _ws.sendTypedData(new Uint8List.fromList(event));
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _ws.close();
    throw new _WrappedException(error, stackTrace);
  }

  @override
  Future addStream(Stream<List<int>> stream) async {
    await for (List<int> data in stream) {
      add(data);
    }
  }

  @override
  Future close() async {
    _ws.close();
    _done.complete();
    return _done.future;
  }

  @override
  Future get done => _done.future;
}

class _WrappedException implements Exception {
  final Object error;
  final StackTrace? stackTrace;

  const _WrappedException(this.error, [this.stackTrace]);

  @override
  String toString() {
    return 'WrappedException: $error\r\n$stackTrace';
  }
}
