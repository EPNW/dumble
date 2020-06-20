import 'dart:async';
import 'dart:typed_data';
import 'package:meta/meta.dart';

class ProtobufPacket {
  final int type;
  final Uint8List data;

  int get length => data.lengthInBytes;

  void writeTo(StreamSink<List<int>> sink){
    sink.add(data);
  }

  const ProtobufPacket({@required this.type, @required this.data});
}

