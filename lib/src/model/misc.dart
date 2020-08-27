import 'dart:typed_data';
import 'dart:io' show InternetAddress;

import 'package:meta/meta.dart';
import '../generated/Mumble.pb.dart' as Proto;

import '../utils.dart' show JsonString, ByteAddress;
import 'user.dart';
import 'channel.dart';

class NonceOutOfSyncException implements Exception {}

class CryptState with JsonString {
  final Uint8List key;
  Uint8List get clientNonce => _clientNonce;
  Uint8List get serverNonce => _serverNonce;

  Uint8List _clientNonce;
  Uint8List _serverNonce;

  CryptState(
      {@required this.key,
      @required Uint8List clientNonce,
      @required Uint8List serverNonce})
      : this._serverNonce = serverNonce,
        this._clientNonce = clientNonce;

  void increaseClientNonce() {
    _passOn(_clientNonce, 0);
  }

  void updateServerNonce(int uint8Lsb) {
    int difference = uint8Lsb - serverNonce[0];
    if (difference != 1) {
      //packets were received out of order
      if (difference > 30) {
        //30 seems to be arbitrary; it's used in the official client source, so I use it here
        //we wrapped around back to zero, they are still on high numbers
        //solution: we copy their lsb and undo the wraping
        serverNonce[0] = uint8Lsb;
        _passBack(serverNonce, 1);
      } else if (difference < -30) {
        //they wrapped around back to zero, we are still on high numbers
        //solution: we copy their lsb and wrap too
        serverNonce[0] = uint8Lsb;
        _passOn(serverNonce, 1);
      } else if (difference == 0) {
        // we either missed some multiple of exactly 255 packets, or they sent two packets with the same nonce
        // this should pretty much never happen unless the server screws up, or the network is REALLY bad
        throw new NonceOutOfSyncException();
      } else {
        //messages might be out of order here but its not so bad that we need wraping
        //solution: just copy their lsb and hope thats enough...
        serverNonce[0] = uint8Lsb;
      }
    } else {
      //no wrapping here, all messages in order, just copy their lsb
      serverNonce[0] = uint8Lsb;
    }
  }

  ///Increases the byte at offset by one.
  ///If it overflows (greater than 255) it sets it to 0 and increases the byte at offset+1 by one, and so on.
  ///If the last byte also overflowes true is returned, false otherwise.
  bool _passOn(Uint8List target, int offset) {
    for (int i = offset; i < target.length; i++) {
      int j = target[i] + 1;
      if (j <= 255) {
        target[i] = j;
        return false;
      } else {
        target[i] = 0;
      }
    }
    //Overflow
    return true;
  }

  ///Decreases the byte at offset by one.
  ///If it underflows (smaller than 0) it sets it to 255 and decreases the byte at offset+1 by one, and so on.
  ///If the last byte also underflows true is returned, false otherwise.
  bool _passBack(Uint8List target, int offset) {
    for (int i = offset; i < target.length; i++) {
      int j = target[i] - 1;
      if (j >= 0) {
        target[i] = j;
        return false;
      } else {
        target[i] = 255;
      }
    }
    //Underflow
    return true;
  }

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['key'] = key
    ..['clientNonce'] = clientNonce
    ..['serverNonce'] = serverNonce;
}

class BanEntry with JsonString {
  final InternetAddress address;
  final int mask;
  final String name;
  final String hash;
  final String reason;
  final DateTime start;

  ///Duration of null or 0 seconds or less means infinite
  final Duration duration;

  String get _startString =>
      start == null ? null : start.toIso8601String().split('.').first + 'Z';

  BanEntry(
      {@required this.address,
      @required this.mask,
      this.name,
      this.hash,
      this.reason,
      DateTime start,
      this.duration})
      : this.start = start?.toUtc();

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['address'] = address.toString()
    ..['mask'] = mask
    ..['name'] = name
    ..['hash'] = hash
    ..['reason'] = reason
    ..['start'] = _startString
    ..['duration'] = duration?.inSeconds;
}

class TextMessage with JsonString {
  final User actor;
  final List<User> clients;
  final List<Channel> channels;
  final List<Channel> trees;
  final String message;

  const TextMessage.outgoing(
      {this.clients, this.channels, this.trees, @required this.message})
      : this.actor = null;
  const TextMessage.incoming(
      {@required this.actor,
      this.clients,
      this.channels,
      this.trees,
      @required this.message});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['actor'] = actor?.session
    ..['channels'] = channels?.map((Channel channel) => channel.channelId)
    ..['trees'] = trees?.map((Channel channel) => channel.channelId)
    ..['message'] = message;
}

class Permission with JsonString {
  static const int _write = 0x1,
      _traverse = 0x2,
      _enter = 0x4,
      _speak = 0x8,
      _muteDeafen = 0x10,
      _move = 0x20,
      _makeChannel = 0x40,
      _linkChannel = 0x80,
      _whisper = 0x100,
      _textMessage = 0x200,
      _makeTempChannel = 0x400,
      // Root channel only
      _kick = 0x10000,
      _ban = 0x20000,
      _register = 0x40000,
      _selfRegister = 0x80000,
      _cached = 0x8000000;

  final bool write;
  final bool traverse;
  final bool enter;
  final bool speak;
  final bool muteDeafen;
  final bool move;
  final bool makeChannel;
  final bool linkChannel;
  final bool whisper;
  final bool textMessage;
  final bool makeTempChannel;
  //root channel only
  final bool kick;
  final bool ban;
  final bool register;
  final bool selfRegister;

  final int intValue;

  const Permission.fromInt(int value)
      : this.intValue = value,
        this.write = (value & _write) != 0,
        this.traverse = (value & _traverse) != 0,
        this.enter = (value & _enter) != 0,
        this.speak = (value & _speak) != 0,
        this.muteDeafen = (value & _muteDeafen) != 0,
        this.move = (value & _move) != 0,
        this.makeChannel = (value & _makeChannel) != 0,
        this.linkChannel = (value & _linkChannel) != 0,
        this.whisper = (value & _whisper) != 0,
        this.textMessage = (value & _textMessage) != 0,
        this.makeTempChannel = (value & _makeTempChannel) != 0,
        this.kick = (value & _kick) != 0,
        this.ban = (value & _ban) != 0,
        this.register = (value & _register) != 0,
        this.selfRegister = (value & _selfRegister) != 0;

  const Permission(
      {bool write: false,
      bool traverse: false,
      bool enter: false,
      bool speak: false,
      bool muteDeafen: false,
      bool move: false,
      bool makeChannel: false,
      bool linkChannel: false,
      bool whisper: false,
      bool textMessage: false,
      bool makeTempChannel: false,
      bool kick: false,
      bool ban: false,
      bool register: false,
      bool selfRegister: false})
      : this.write = write,
        this.traverse = traverse,
        this.enter = enter,
        this.speak = speak,
        this.muteDeafen = muteDeafen,
        this.move = move,
        this.makeChannel = makeChannel,
        this.linkChannel = linkChannel,
        this.whisper = whisper,
        this.textMessage = textMessage,
        this.makeTempChannel = makeTempChannel,
        this.kick = kick,
        this.ban = ban,
        this.register = register,
        this.selfRegister = selfRegister,
        this.intValue = (write ? _write : 0) |
            (traverse ? _traverse : 0) |
            (enter ? _enter : 0) |
            (speak ? _speak : 0) |
            (muteDeafen ? _muteDeafen : 0) |
            (move ? _move : 0) |
            (makeChannel ? _makeChannel : 0) |
            (linkChannel ? _linkChannel : 0) |
            (whisper ? _whisper : 0) |
            (textMessage ? _textMessage : 0) |
            (makeTempChannel ? _makeTempChannel : 0) |
            (kick ? _kick : 0) |
            (ban ? _ban : 0) |
            (register ? _register : 0) |
            (selfRegister ? _selfRegister : 0);

  @override
  int get hashCode => intValue;

  @override
  bool operator ==(dynamic other) {
    if (other != null && other is Permission) {
      return (intValue | _cached) == (other.intValue | _cached);
    } else {
      return false;
    }
  }

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['write'] = write
    ..['traverse'] = traverse
    ..['enter'] = enter
    ..['speak'] = speak
    ..['muteDeafen'] = muteDeafen
    ..['move'] = move
    ..['makeChannel'] = makeChannel
    ..['linkChannel'] = linkChannel
    ..['whisper'] = whisper
    ..['textMessage'] = textMessage
    ..['makeTempChannel'] = makeTempChannel
    ..['kick'] = kick
    ..['ban'] = ban
    ..['register'] = register
    ..['selfRegister'] = selfRegister;
}

class VoiceTarget with JsonString {
  final List<User> _users;
  final List<Channel> _channels;
  final List<bool> _channelLinks;
  final List<bool> _channelRecursive;
  final List<String> _aclGroups;
  final int id;

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    map['users'] = _users.map((User user) => user.session);
    map['aclGroups'] = _aclGroups;
    map['id'] = id;
    List<Map<String, Object>> channels = new List<Map<String, Object>>();
    for (int i = 0; i < _channels.length; i++) {
      Map<String, Object> channel = new Map<String, Object>();
      channel['channelId'] = _channels[i].channelId;
      channel['followLinks'] = _channelLinks[i];
      channel['recursive'] = _channelRecursive[i];
    }
    map['channels'] = channels;
    return map;
  }

  VoiceTarget({@required int id})
      : this.id = _assertInRange(id),
        this._users = new List<User>(),
        this._channels = new List<Channel>(),
        this._channelLinks = new List<bool>(),
        this._channelRecursive = new List<bool>(),
        this._aclGroups = new List<String>();

  void withUser({@required User user}) {
    _users.add(user);
  }

  void withChannel(
      {@required Channel channel,
      bool followLinks: false,
      bool recursive: false}) {
    _channels.add(channel);
    _channelLinks.add(followLinks);
    _channelRecursive.add(recursive);
  }

  void withAclGroup({@required String aclGroup}) {
    _aclGroups.add(aclGroup);
  }

  static int _assertInRange(int id) {
    if (id < 1 || id > 30) {
      throw new RangeError.range(id, 1, 30);
    } else {
      return id;
    }
  }
}

class PacketStats with JsonString {
  final int goodPacketCount;
  final int latePacketCount;
  final int lostPacketCount;
  final int resync;

  const PacketStats(
      {@required this.goodPacketCount,
      @required this.latePacketCount,
      @required this.lostPacketCount,
      @required this.resync});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['goodPacketCount'] = goodPacketCount
    ..['latePacketCount'] = latePacketCount
    ..['lostPacketCount'] = lostPacketCount
    ..['resync'] = resync;
}

class PingStats with JsonString {
  final double udpPingAverage;
  final double udpPingVariance;
  final double tcpPingAverage;
  final double tcpPingVariance;

  const PingStats(
      {@required this.tcpPingAverage,
      @required this.tcpPingVariance,
      @required this.udpPingAverage,
      @required this.udpPingVariance});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['udpPingAverage'] = udpPingAverage
    ..['udpPingVariance'] = udpPingVariance
    ..['tcpPingAverage'] = tcpPingAverage
    ..['tcpPingVariance'] = tcpPingAverage;
}

class VersionInformation with JsonString {
  final int version;
  final String release;
  final String os;
  final String osVersion;

  const VersionInformation(
      {this.version, this.release, this.os, this.osVersion})
      : super();

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['version'] = version
    ..['release'] = release
    ..['os'] = os
    ..['osVersion'] = osVersion;
}

@protected
Proto.VoiceTarget serializeVoiceTarget(VoiceTarget voiceTarget) {
  Proto.VoiceTarget target = new Proto.VoiceTarget()..id = voiceTarget.id;
  target.targets.add(new Proto.VoiceTarget_Target()
    ..session.addAll(voiceTarget._users.map((User u) => u.session)));
  for (int i = 0; i < voiceTarget._channels.length; i++) {
    target.targets.add(new Proto.VoiceTarget_Target()
      ..channelId = voiceTarget._channels[i].channelId
      ..children = voiceTarget._channelLinks[i]
      ..children = voiceTarget._channelRecursive[i]);
  }
  for (String aclGroup in voiceTarget._aclGroups) {
    target.targets.add(new Proto.VoiceTarget_Target()..group = aclGroup);
  }
  return target;
}

@protected
Proto.BanList_BanEntry serializeBanEntry(BanEntry banEntry) {
  Proto.BanList_BanEntry proto = new Proto.BanList_BanEntry();
  proto.address = banEntry.address.asIPv6().rawAddress;
  proto.mask = banEntry.mask + (banEntry.address.isIPv6() ? 0 : 96);
  if (banEntry.hash != null) {
    proto.hash = banEntry.hash;
  }
  if (banEntry.duration != null) {
    proto.duration = banEntry.duration.inSeconds;
  }
  if (banEntry.name != null) {
    proto.name = banEntry.name;
  }
  if (banEntry.reason != null) {
    proto.reason = banEntry.reason;
  }
  if (banEntry.start != null) {
    proto.start = banEntry._startString;
  }
  return proto;
}

@protected
BanEntry banEntryFromProto(Proto.BanList_BanEntry entry) {
  InternetAddress address = ByteAddress.fromBytes(
      new Uint8List.fromList(entry.address),
      asIPv4IfPossible: true);
  return new BanEntry(
      address: address,
      mask: entry.mask - (address.isIPv6() ? 0 : 96),
      duration: entry.hasDuration() != null && entry.duration > 0
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
