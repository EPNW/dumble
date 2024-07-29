import 'dart:convert';
import 'dart:io' show InternetAddress, InternetAddressType;
import 'dart:typed_data';
import 'package:convert/convert.dart';

int encodeVersion(int major, int minor, int patch) {
  return ((major & 0xffff) << 16) | ((minor & 0xff) << 8) | (patch & 0xff);
}

const int defaultBitrate = 48000;

int adjustNetworkBandwidth(int? bitspersec) {
  if (bitspersec == null || bitspersec == 0) {
    return defaultBitrate;
  } else {
    int framesPerPacket = 1;
    int bitrate = defaultBitrate;

    if (getNetworkBandwidth(bitrate, framesPerPacket) > bitspersec) {
      while (bitrate > 8000 &&
          (getNetworkBandwidth(bitrate, framesPerPacket) > bitspersec)) {
        bitrate -= 1000;
      }
    }
    return bitrate;
  }
}

int getNetworkBandwidth(int bitrate, int frames) {
  int overhead = 20 + 8 + 4 + 1 + 2 + frames + 12;
  overhead *= (800 / frames).ceil();
  return overhead + bitrate;
}

const JsonEncoder _tabIndent = const JsonEncoder.withIndent('\t');

mixin JsonString {
  Map<String, Object> jsonMap();

  @override
  String toString({bool tabIndent = true}) =>
      (tabIndent ? _tabIndent : json.encoder).convert(jsonMap());
}

extension ByteAddress on InternetAddress {
  static InternetAddress fromBytes(Uint8List bytes,
      {bool asIPv4IfPossible = false}) {
    if (bytes.length == 4) {
      return new InternetAddress(bytes.join('.'));
    } else if (bytes.length == 16) {
      if (asIPv4IfPossible &&
          bytes[0] == 0 &&
          bytes[1] == 0 &&
          bytes[2] == 0 &&
          bytes[3] == 0 &&
          bytes[4] == 0 &&
          bytes[5] == 0 &&
          bytes[6] == 0 &&
          bytes[7] == 0 &&
          bytes[8] == 0 &&
          bytes[9] == 0 &&
          bytes[10] == 255 &&
          bytes[11] == 255) {
        return fromBytes(bytes.buffer.asUint8List(bytes.offsetInBytes + 12, 4));
      } else {
        String combined = '';
        for (int i = 0; i < 16; i++) {
          combined += hex.encode(<int>[bytes[i]]);
          if (i % 2 == 1 && i != 15) {
            combined += ':';
          }
        }
        return new InternetAddress(combined);
      }
    } else {
      throw ArgumentError(
          'There must be either 4 bytes (for IPv4) or 16 bytes (for IPv6)!');
    }
  }

  bool isIPv6() {
    return this.type == InternetAddressType.IPv6;
  }

  InternetAddress asIPv6() {
    if (!isIPv6()) {
      Uint8List bytes = new Uint8List(16);
      bytes[10] = 255;
      bytes[11] = 255;
      bytes.setRange(12, 16, this.rawAddress);
      return fromBytes(bytes);
    } else {
      return this;
    }
  }
}

extension FilterNullStream<T> on Stream<T?> {
  Stream<T> filterNull() => this.where((T? event) => event != null).cast<T>();
}

extension FilterNullList<T> on List<T?> {
  List<T> filterNull() {
    List<T?> copy = new List<T?>.from(this);
    copy.retainWhere((T? event) => event != null);
    return copy.cast<T>();
  }
}
