import 'dart:convert';
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
  String toString({bool tabIndent: true}) =>
      (tabIndent ? _tabIndent : json.encoder).convert(jsonMap());
}

/// Utils for dealing with ip addresses
abstract class IP {
  static Uint8List asIPv6Bytes(String address) {
    if (address.contains(':')) {
      // Try as IPv6 address
      return _asIPv6Bytes(address);
    } else if (address.contains('.')) {
      // Try as IPv4 address
      Uint8List asV6 = new Uint8List(16);
      asV6[10] = 255;
      asV6[11] = 255;
      asV6.setAll(12, _parseIPv4(address));
      return asV6;
    } else {
      throw new ArgumentError('Could not decide if IPv4 or IPv6!');
    }
  }

  /// returns true if the ipv6 could be expressed
  /// as IPv4
  static bool possibleAsIPv4(Uint8List ipv6) {
    if (ipv6.length == 16) {
      return ipv6[0] == 0 &&
          ipv6[1] == 0 &&
          ipv6[2] == 0 &&
          ipv6[3] == 0 &&
          ipv6[4] == 0 &&
          ipv6[5] == 0 &&
          ipv6[6] == 0 &&
          ipv6[7] == 0 &&
          ipv6[8] == 0 &&
          ipv6[9] == 0 &&
          ipv6[10] == 255 &&
          ipv6[11] == 255;
    } else {
      throw new ArgumentError('The parameter ipv6 must be 16 bytes long!');
    }
  }

  static String fromBytes(Uint8List bytes, {bool asIPv4IfPossible: false}) {
    if (bytes.length == 4) {
      return bytes.join('.');
    } else if (bytes.length == 16) {
      if (asIPv4IfPossible && possibleAsIPv4(bytes)) {
        return fromBytes(bytes.buffer.asUint8List(bytes.offsetInBytes + 12, 4));
      } else {
        String combined = '';
        for (int i = 0; i < 16; i++) {
          combined += _hex(bytes[i]);
          if (i % 2 == 1 && i != 15) {
            combined += ':';
          }
        }
        return combined;
      }
    } else {
      throw ArgumentError(
          'There must be either 4 bytes (for IPv4) or 16 bytes (for IPv6)!');
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

Uint8List _parseIPv4(String address) {
  List<String> parts = address.split('.');
  if (address.length <= 3 + 1 + 3 + 1 + 3 + 1 + 3 &&
      address.length >= 1 + 1 + 1 + 1 + 1 + 1 + 1 &&
      parts.length == 4) {
    Uint8List ipv4 = new Uint8List(4);
    ipv4[0] = int.parse(parts[0]);
    ipv4[1] = int.parse(parts[1]);
    ipv4[2] = int.parse(parts[2]);
    ipv4[3] = int.parse(parts[3]);
    return ipv4;
  } else {
    throw new ArgumentError('Invalid length for an IPv4!');
  }
}

// IPv6 representation rules according to rfc4291, section 2.2
// (see https://datatracker.ietf.org/doc/html/rfc4291#section-2.2):
// 2.2.  Text Representation of Addresses
//
//    There are three conventional forms for representing IPv6 addresses as
//    text strings:
//
//    1. The preferred form is x:x:x:x:x:x:x:x, where the 'x's are one to
//       four hexadecimal digits of the eight 16-bit pieces of the address.
//       Examples:
//
//          ABCD:EF01:2345:6789:ABCD:EF01:2345:6789
//
//          2001:DB8:0:0:8:800:200C:417A
//
//       Note that it is not necessary to write the leading zeros in an
//       individual field, but there must be at least one numeral in every
//       field (except for the case described in 2.).
//
//    2. Due to some methods of allocating certain styles of IPv6
//       addresses, it will be common for addresses to contain long strings
//       of zero bits.  In order to make writing addresses containing zero
//       bits easier, a special syntax is available to compress the zeros.
//       The use of "::" indicates one or more groups of 16 bits of zeros.
//       The "::" can only appear once in an address.  The "::" can also be
//       used to compress leading or trailing zeros in an address.
//
//       For example, the following addresses
//
//          2001:DB8:0:0:8:800:200C:417A   a unicast address
//          FF01:0:0:0:0:0:0:101           a multicast address
//          0:0:0:0:0:0:0:1                the loopback address
//          0:0:0:0:0:0:0:0                the unspecified address
//
//       may be represented as
//
//          2001:DB8::8:800:200C:417A      a unicast address
//          FF01::101                      a multicast address
//          ::1                            the loopback address
//          ::                             the unspecified address
//
//    3. An alternative form that is sometimes more convenient when dealing
//       with a mixed environment of IPv4 and IPv6 nodes is
//       x:x:x:x:x:x:d.d.d.d, where the 'x's are the hexadecimal values of
//       the six high-order 16-bit pieces of the address, and the 'd's are
//       the decimal values of the four low-order 8-bit pieces of the
//       address (standard IPv4 representation).  Examples:
//
//          0:0:0:0:0:0:13.1.68.3
//
//          0:0:0:0:0:FFFF:129.144.52.38
//
//       or in compressed form:
//
//          ::13.1.68.3
//
//          ::FFFF:129.144.52.38
Uint8List _asIPv6Bytes(String address) {
  String sequence = _asFullIPv6(address).replaceAll(':', '');
  Uint8List ip = new Uint8List(16);
  int j = 0;
  for (int i = 0; i <= 30; i = i + 2) {
    ip[j] = hex.decode(sequence.substring(i, i + 2))[0];
    j++;
  }
  return ip;
}

// Reconstructs all blocks from an ipv6
String _asFullIPv6(String address) {
  if (address == '::') {
    return '0000:0000:0000:0000:0000:0000:0000:0000';
  } else {
    if (address.startsWith('::') || address.endsWith('::')) {
      // Ensure that there is no more than one empty block
      address = address.replaceAll('::', ':');
    }

    List<String> blocks = address.split(':');
    bool containsIPv4Notation = blocks.last.contains('.');

    int emptyBlockValue = (8 - blocks.length);
    if (containsIPv4Notation) {
      emptyBlockValue -= 2;
    }

    List<String> blocksReconstructed = new List<String>.filled(8, '0000');
    int j = 0;
    for (int i = 0; i < blocks.length - 1; i++) {
      if (blocks[i].isEmpty) {
        j = j + emptyBlockValue + 1;
      } else {
        blocksReconstructed[j] = blocks[i].padLeft(4, '0');
        j++;
      }
    }
    if (containsIPv4Notation) {
      Uint8List last = _parseIPv4(blocks.last);
      blocksReconstructed[6] = _hex(last[0]) + _hex(last[1]);
      blocksReconstructed[7] = _hex(last[2]) + _hex(last[3]);
    } else {
      blocksReconstructed[j] = blocks.last.padLeft(4, '0');
    }
    return blocksReconstructed.join(':');
  }
}

String _hex(int v) => hex.encode(<int>[v]).padLeft(2, '0');
