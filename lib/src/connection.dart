import 'dart:async';
import 'dart:io' show SecureSocket, Socket, X509Certificate, SecurityContext;

import 'package:protobuf/protobuf.dart';

import 'audio/audio_packet.dart';
import 'messages.dart' as Messages;
import 'streams/protobuf_header_prepender.dart';
import 'streams/protobuf_stream_transformer.dart';
import 'streams/protobuf_packet.dart';

/// Return `true` to trust the certificate or `false` to consider it bad.
typedef bool OnBadCertificate(X509Certificate certificate);

class Connection extends StreamView<ProtobufPacket> {
  final ProtobufHeaderPrepender _out;

  Connection._(this._out, Stream<ProtobufPacket> base) : super(base);

  static Future<Connection> connect(
      {required String host,
      required int port,
      SecurityContext? context,
      OnBadCertificate? onBadCertificate}) async {
    Socket socket = await SecureSocket.connect(host, port,
        onBadCertificate: onBadCertificate, context: context);
    return new Connection._(new ProtobufHeaderPrepender(socket),
        socket.transform(new ProtobufStreamTransformer()));
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
