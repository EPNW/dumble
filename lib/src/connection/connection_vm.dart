import 'dart:io';

import 'connection.dart';
import '../platform/platform_options.dart';
import '../platform/platform_options_vm.dart';

class ConnectionImpl extends Connection {
  final Socket _socket;
  ConnectionImpl._(Socket socket)
      : this._socket = socket,
        super(receive: socket, send: socket);

  static Future<Connection> connect({required PlatformOptions options}) async {
    PlatformOptionsVM platformOptions = options as PlatformOptionsVM;
    Socket socket = await SecureSocket.connect(
        platformOptions.host, platformOptions.port,
        context: platformOptions.context,
        onBadCertificate: platformOptions.onBadCertificate);
    return new ConnectionImpl._(socket);
  }

  @override
  void destroy() => _socket.destroy();
}
