import 'dart:async';
import 'dart:typed_data';
import 'protobuf_packet.dart';

class ProtobufHeaderPrepender implements StreamSink<ProtobufPacket> {
  final StreamSink<List<int>> _wrapped;
  StreamSink<List<int>> get wrapped => _wrapped;
  ProtobufHeaderPrepender(this._wrapped);

  Future<dynamic> flush() async {
    try {
      return await (_wrapped as dynamic).flush();
    } on NoSuchMethodError {
      //Ignore
    }
  }

  @override
  void add(ProtobufPacket event) {
    ByteData header = new ByteData(6);
    header.setUint16(0, event.type);
    header.setUint32(2, event.length);
    _wrapped.add(Uint8List.view(header.buffer));
    event.writeTo(_wrapped);
  }

  @override
  Future get done {
    return _wrapped.done;
  }

  @override
  Future close() {
    return _wrapped.close();
  }

  @override
  Future addStream(Stream<ProtobufPacket> stream) async {
    await for (ProtobufPacket event in stream) {
      add(event);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _wrapped.addError(error, stackTrace);
  }
}
