import 'dart:async';
import 'dart:typed_data';

import 'package:web_socket_channel/web_socket_channel.dart';

import 'connection.dart';
import '../platform/platform_options.dart';
import '../platform/platform_options_web.dart';

class ConnectionImpl extends Connection {
  final WebSocketSink _webSocket;

  ConnectionImpl(final WebSocketSink sink, Stream<Uint8List> receive)
      : this._webSocket = sink,
        super(
            send: new StreamController<List<int>>(sync: true)
              ..stream.cast<dynamic>().pipe(sink),
            receive: receive);

  static Future<Connection> connect({required PlatformOptions options}) async {
    PlatformOptionsWeb platformOptions = options as PlatformOptionsWeb;
    WebSocketChannel socket =
        new WebSocketChannel.connect(Uri.parse(platformOptions.uri));
    Stream<Uint8List> receive = socket.stream.map<Uint8List>((dynamic event) {
      if (event is Uint8List) {
        return event;
      } else if (event is ByteBuffer) {
        return event.asUint8List(0, event.lengthInBytes);
      } else if (event is TypedData) {
        return event.buffer
            .asUint8List(event.offsetInBytes, event.lengthInBytes);
      } else if (event is List<int>) {
        return new Uint8List.fromList(event);
      } else {
        throw new Exception(
            'Recevived unkown event of type ${event.runtimeType}: $event');
      }
    });
    return new ConnectionImpl(socket.sink, receive);
  }

  @override
  void destroy() {
    _webSocket.close();
  }
}
