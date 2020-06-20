import 'dart:async';

import 'package:protobuf/protobuf.dart';
import 'streams/protobuf_stream_transformer.dart';
import 'streams/protobuf_header_prepender.dart';
import 'streams/protobuf_packet.dart';
import 'dart:io' show SecureSocket, Socket, X509Certificate, SecurityContext;
import 'package:meta/meta.dart';
import 'audio_packet.dart';
import 'messages.dart' as Messages;

typedef bool OnBadCertificate(X509Certificate certificate);

class Connection {
  ProtobufHeaderPrepender _out;

  final String host;
  final int port;
  final SecurityContext context;

  Connection({@required this.host, @required this.port, this.context});

  Future<Stream<ProtobufPacket>> connect(
      {OnBadCertificate onBadCertificate}) async {
    Socket socket = await SecureSocket.connect(host, port,
        onBadCertificate: onBadCertificate, context: context);
    _out = new ProtobufHeaderPrepender(socket);
    return socket.transform(new ProtobufStreamTransformer());
  }

  Future<void> close() async {
    await _out.close();
  }

  void writeMessage<T extends GeneratedMessage>(T message) {
    _out.add(Messages.encode(message));
  }

  Future<void> flush() async {
    await _out.flush();
  }

  void tunnelAudioPacket(AudioPacket packet) {
    _out.add(new AudioTunnelPacket(packet: packet));
  }
}
