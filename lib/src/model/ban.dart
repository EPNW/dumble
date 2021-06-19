import 'dart:typed_data';
import 'dart:io' show InternetAddress;

import 'package:meta/meta.dart';
import '../utils.dart' show ByteAddress, JsonString;
import '../generated/Mumble.pb.dart' as Proto;

// Comment: According to the proto file, everything is optional but address and mask
class BanEntry with JsonString {
  final InternetAddress address;
  final int mask;
  final String? name;
  final String? hash;
  final String? reason;
  final DateTime? start;

  ///Duration of null or 0 seconds or less means infinite
  final Duration? duration;

  String? get _startString =>
      start == null ? null : start!.toIso8601String().split('.').first + 'Z';

  BanEntry._(
      {required this.address,
      required this.mask,
      this.name,
      this.hash,
      this.reason,
      DateTime? start,
      this.duration})
      : this.start = start?.toUtc();

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()
      ..['address'] = address.toString()
      ..['mask'] = mask;

    if (name != null) {
      map['name'] = name!;
    }
    if (hash != null) {
      map['hash'] = hash!;
    }
    if (hash != null) {
      map['reason'] = reason!;
    }
    String? startString = _startString;
    if (startString != null) {
      map['start'] = startString;
    }
    if (duration != null) {
      map['duration'] = duration!.inSeconds;
    }
    return map;
  }
}

@protected
Proto.BanList_BanEntry serializeBanEntry(BanEntry banEntry) {
  Proto.BanList_BanEntry proto = new Proto.BanList_BanEntry();
  proto.address = banEntry.address.asIPv6().rawAddress;
  proto.mask = banEntry.mask + (banEntry.address.isIPv6() ? 0 : 96);
  if (banEntry.hash != null) {
    proto.hash = banEntry.hash!;
  }
  if (banEntry.duration != null) {
    proto.duration = banEntry.duration!.inSeconds;
  }
  if (banEntry.name != null) {
    proto.name = banEntry.name!;
  }
  if (banEntry.reason != null) {
    proto.reason = banEntry.reason!;
  }
  String? startString = banEntry._startString;
  if (startString != null) {
    proto.start = startString;
  }
  return proto;
}

@protected
BanEntry banEntryFromProto(Proto.BanList_BanEntry entry) {
  InternetAddress address = ByteAddress.fromBytes(
      new Uint8List.fromList(entry.address),
      asIPv4IfPossible: true);
  return new BanEntry._(
      address: address,
      mask: entry.mask - (address.isIPv6() ? 0 : 96),
      duration: entry.hasDuration() && entry.duration > 0
          ? new Duration(seconds: entry.duration)
          : null,
      name: (entry.hasName() && entry.name.isNotEmpty) ? entry.name : null,
      hash: (entry.hasHash() && entry.hash.isNotEmpty) ? entry.hash : null,
      reason:
          (entry.hasReason() && entry.reason.isNotEmpty) ? entry.reason : null,
      start: (entry.hasStart() && entry.start.isNotEmpty)
          ? DateTime.parse(entry.start)
          : null);
}
