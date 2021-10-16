import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

import 'connection.dart';
import '../platform/platform_options.dart';
import '../platform/platform_options_web.dart';

class ConnectionImpl extends Connection {
  final WebSocketSink _webSocket;

  ConnectionImpl(final WebSocketSink sink, Stream<List<int>> receive)
      : this._webSocket = sink,
        super(
            send: new StreamController<List<int>>(sync: true)
              ..stream.cast<dynamic>().pipe(sink),
            receive: receive);

  static Future<Connection> connect({required PlatformOptions options}) async {
    PlatformOptionsWeb platformOptions = options as PlatformOptionsWeb;
    WebSocketChannel socket =
        new WebSocketChannel.connect(Uri.parse(platformOptions.uri));
    Stream<List<int>> receive = socket.stream.map<List<int>>((dynamic event) {
      if (event is List<int>) {
        return event;
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
