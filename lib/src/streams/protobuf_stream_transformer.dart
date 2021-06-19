import 'dart:async';
import 'dart:typed_data';
import 'protobuf_packet.dart';

class ProtobufStreamTransformer
    extends StreamTransformerBase<Uint8List, ProtobufPacket> {
  @override
  Stream<ProtobufPacket> bind(Stream<Uint8List> stream) async* {
    int index = 0;
    Uint8List? out;
    int? outLength;
    ByteData header = new ByteData(6);
    int headerIndex = 0;
    int? currentType;
    await for (Uint8List bytes in stream) {
      int bytesIndex = 0;
      int bytesLeft = bytes.length;
      while (bytesLeft > 0) {
        if (headerIndex != 6) {
          int needed = 6 - headerIndex;
          int add = bytesLeft > needed ? needed : bytesLeft;
          for (int i = 0; i < add; i++) {
            header.setUint8(headerIndex, bytes[i + bytesIndex]);
            headerIndex++;
          }
          bytesIndex += add;
          bytesLeft -= add;
          if (headerIndex == 6) {
            currentType = header.getUint16(0);
            outLength = header.getUint32(2);
          }
        }
        if (bytesLeft > 0 && outLength != null) {
          if ((outLength <= bytesLeft) && out == null) {
            Uint8List data = new Uint8List.view(
                bytes.buffer, bytesIndex + bytes.offsetInBytes, outLength);
            yield new ProtobufPacket(type: currentType!, data: data);
            bytesIndex += outLength;
            bytesLeft -= outLength;
            outLength = null;
            headerIndex = 0;
          } else {
            if (out == null) {
              out = new Uint8List(outLength);
              index = 0;
            }
            int needed = outLength - index;
            int add = bytesLeft > needed ? needed : bytesLeft;
            out.setRange(index, index + add, bytes, bytesIndex);
            bytesIndex += add;
            bytesLeft -= add;
            index += add;
            if (outLength == index) {
              yield new ProtobufPacket(type: currentType!, data: out);
              out = null;
              outLength = null;
              headerIndex = 0;
            }
          }
        }
      }
    }
    if (headerIndex != 0) {
      throw new DataLeftException();
    }
  }
}

class DataLeftException implements Exception {
  @override
  String toString() {
    return 'The stream bound to this transformer was closed or contains no more elements, but there is an unfinished message still in construction.';
  }
}
