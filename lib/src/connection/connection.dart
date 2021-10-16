import 'dart:async';
import 'dart:typed_data';

import '../platform/platform_options.dart';

import 'package:protobuf/protobuf.dart';

import '../audio/audio_packet.dart';
import '../messages.dart' as Messages;
import '../streams/protobuf_header_prepender.dart';
import '../streams/protobuf_stream_transformer.dart';
import '../streams/protobuf_packet.dart';

import 'connection_web.dart'
    if (dart.library.io) 'connection_vm.dart'; // dart:io implementation

abstract class Connection extends StreamView<ProtobufPacket> {
  final ProtobufHeaderPrepender _out;

  Connection(
      {required StreamSink<List<int>> send, required Stream<Uint8List> receive})
      : this._out = new ProtobufHeaderPrepender(send),
        super(
            receive.transform<ProtobufPacket>(new ProtobufStreamTransformer()));

  static Future<Connection> connect({required PlatformOptions options}) =>
      ConnectionImpl.connect(options: options);

  void destroy();

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
