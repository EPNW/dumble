import 'dart:typed_data';
import 'dart:convert' show base64;
import '../client_base.dart';
import '../listeners.dart';
import 'package:meta/meta.dart';
import '../generated/Mumble.pb.dart' as Proto;
import 'channel.dart';
import 'misc.dart';
import '../utils.dart' show JsonString, ByteAddress;
import 'dart:io' show InternetAddress;

@protected
User createNewUser({@required MumbleClientBase client}) {
  return new User._(client);
}

@protected
UserStats createUserStats({@required Proto.UserStats stats}) {
  InternetAddress address;
  if (stats.hasAddress() &&
      stats.address != null &&
      (stats.address.length == 4 || stats.address.length == 16)) {
    address = ByteAddress.fromBytes(stats.address, asIPv4IfPossible: true);
  }

  VersionInformation info;
  Proto.Version version = stats.hasVersion() ? stats.version : null;
  if (version != null) {
    info = new VersionInformation(
        os: version.os,
        osVersion: version.osVersion,
        release: version.release,
        version: version.version);
  }

  PacketStats fromServer;
  if (stats.hasFromServer() && stats.fromServer != null) {
    fromServer = new PacketStats(
        goodPacketCount: stats.fromServer.good,
        latePacketCount: stats.fromServer.late,
        lostPacketCount: stats.fromServer.lost,
        resync: stats.fromServer.resync);
  }

  PacketStats fromClient;
  if (stats.hasFromClient() && stats.fromClient != null) {
    fromClient = new PacketStats(
        goodPacketCount: stats.fromClient.good,
        latePacketCount: stats.fromClient.late,
        lostPacketCount: stats.fromClient.lost,
        resync: stats.fromClient.resync);
  }

  PingStats pingStats = new PingStats(
      tcpPingAverage: stats.tcpPingAvg,
      tcpPingVariance: stats.tcpPingVar,
      udpPingAverage: stats.udpPingAvg,
      udpPingVariance: stats.udpPingVar);

  List<Uint8List> certificates = new List<Uint8List>();
  for (List<int> cert in stats.certificates) {
    certificates.add(new Uint8List.fromList(cert));
  }

  return new UserStats(
      certificates: certificates.isNotEmpty ? certificates : null,
      pingStats: pingStats,
      fromClient: fromClient,
      fromServer: fromServer,
      clientVersion: info,
      strongCertificate: stats.strongCertificate,
      celtVersions: stats.celtVersions,
      bandwidth: stats.bandwidth,
      udpPacketCount: stats.udpPackets,
      tcpPacketCount: stats.tcpPackets,
      opus: stats.opus,
      address: address,
      onlineTime: (stats.hasOnlinesecs() && stats.onlinesecs != null)
          ? new Duration(seconds: stats.onlinesecs)
          : null,
      idleTime: (stats.hasIdlesecs() && stats.idlesecs != null)
          ? new Duration(seconds: stats.idlesecs)
          : null);
}

@protected
Selfe asSelfe({@required User user}) {
  Selfe selfe = new Selfe._(user._client);
  _copy(to: selfe, from: user);
  return selfe;
}

void _copy({@required User to, @required User from}) {
  to._session = from.session;
  to._name = from.name;
  to._userId = from.userId;
  to._channel = from.channel;
  to._mute = from.mute;
  to._deaf = from.deaf;
  to._suppress = from.suppress;
  to._selfMute = from.selfMute;
  to._selfDeaf = from.selfDeaf;
  to._texture = from.texture;
  to._comment = from.comment;
  to._hash = from.hash;
  to._commentHash = from.commentHash;
  to._textureHash = from.textureHash;
  to._prioritySpeaker = from.prioritySpeaker;
  to._recording = from.recording;
}

@protected
UserChanges updateUser({@required User user, Channel channel, @required Proto.UserState state}) {
  if (state.hasSession()) user._session = state.session;
  if (state.hasName()) user._name = state.name;
  if (state.hasUserId()) user._userId = state.userId;
  if (channel != null) user._channel = channel;
  if (state.hasMute()) user._mute = state.mute;
  if (state.hasDeaf()) user._deaf = state.deaf;
  if (state.hasSuppress()) user._suppress = state.suppress;
  if (state.hasSelfMute()) user._selfMute = state.selfMute;
  if (state.hasSelfDeaf()) user._selfDeaf = state.selfDeaf;
  if (state.hasTexture()) user._texture = new Uint8List.fromList(state.texture);
  if (state.hasComment()) user._comment = state.comment;
  if (state.hasHash()) user._hash = state.hash;
  if (state.hasCommentHash()) user._commentHash = new Uint8List.fromList(state.commentHash);
  if (state.hasTextureHash()) user._textureHash = new Uint8List.fromList(state.textureHash);
  if (state.hasPrioritySpeaker()) user._prioritySpeaker = state.prioritySpeaker;
  if (state.hasRecording()) user._recording = state.recording;
  return new UserChanges._(
      name: state.hasName(),
      userId: state.hasUserId(),
      channel: channel != null,
      mute: state.hasMute(),
      deaf: state.hasDeaf(),
      supress: state.hasSuppress(),
      selfMute: state.hasSelfMute(),
      selfDeaf: state.hasSelfDeaf(),
      texture: state.hasTexture(),
      comment: state.hasComment(),
      hash: state.hasHash(),
      commentHash: state.hasCommentHash(),
      textureHash: state.hasTextureHash(),
      prioritySpeaker: state.hasPrioritySpeaker(),
      recording: state.hasRecording());
}

@protected
void notifyUserUpdate({@required User user, @required User actor, @required UserChanges changes}) {
  user._notifyUserUpdate(actor: actor, changes: changes);
}

@protected
void notifyUserRemoved({@required User user, @required User actor, String reason, bool ban}) {
  user._notifyUserRemoved(actor: actor, reason: reason, ban: ban);
}

@protected
void reportUserStats({@required User user, @required UserStats stats}) {
  user._reportUserStats(stats: stats);
}

class UserChanges with JsonString {
  final bool name,
      userId,
      channel,
      mute,
      deaf,
      supress,
      selfMute,
      selfDeaf,
      texture,
      comment,
      hash,
      commentHash,
      textureHash,
      prioritySpeaker,
      recording;
  const UserChanges._(
      {@required this.name,
      @required this.userId,
      @required this.channel,
      @required this.mute,
      @required this.deaf,
      @required this.supress,
      @required this.selfMute,
      @required this.selfDeaf,
      @required this.texture,
      @required this.comment,
      @required this.hash,
      @required this.commentHash,
      @required this.textureHash,
      @required this.prioritySpeaker,
      @required this.recording});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['name'] = name
    ..['userId'] = userId
    ..['channel'] = channel
    ..['mute'] = mute
    ..['deaf'] = deaf
    ..['supress'] = supress
    ..['selfMute'] = selfMute
    ..['selfDeaf'] = selfDeaf
    ..['texture'] = texture
    ..['comment'] = comment
    ..['hash'] = hash
    ..['commentHash'] = commentHash
    ..['textureHash'] = textureHash
    ..['prioritySpeaker'] = prioritySpeaker
    ..['recording'] = recording;
}

class Selfe extends User {
  Selfe._(MumbleClientBase _client) : super._(_client);

  void setComment({@required String comment}) =>
      _client.writeMessage(new Proto.UserState()..comment = comment ?? '');

  void setTexture({@required Uint8List texture}) {
    Proto.UserState state = new Proto.UserState();
    if (texture != null) {
      state.texture = texture;
    }
    _client.writeMessage(state);
  }

  void setSelfMute({@required bool mute}) =>
      _client.writeMessage(new Proto.UserState()..selfMute = mute);

  void setSelfDeaf({@required bool deaf}) =>
      _client.writeMessage(new Proto.UserState()..selfDeaf = deaf);

  void setChannel({@required int channelId}) => _client.writeMessage(new Proto.UserState()
    ..actor = session
    ..session = session
    ..channelId = channelId);

  void setListeningChannelAdd({@required int channelId}) =>
      _client.writeMessage(new Proto.UserState()..listeningChannelAdd.add(channelId));

  void setListeningChannelRemove({@required int channelId}) =>
      _client.writeMessage(new Proto.UserState()..listeningChannelRemove.add(channelId));
}

class User with Notifier<UserListener>, JsonString {
  final MumbleClientBase _client;
  int _session;
  String _name;
  int _userId;
  Channel _channel;
  bool _mute;
  bool _deaf;
  bool _suppress;
  bool _selfMute;
  bool _selfDeaf;
  Uint8List _texture;
  String _comment;
  String _hash;
  Uint8List _commentHash;
  Uint8List _textureHash;
  bool _prioritySpeaker;
  bool _recording;

  int get session => _session;
  String get name => _name;
  int get userId => _userId;
  Channel get channel => _channel ?? _client.rootChannel;
  bool get mute => _mute;
  bool get deaf => _deaf;
  bool get suppress => _suppress;
  bool get selfMute => _selfMute;
  bool get selfDeaf => _selfDeaf;
  Uint8List get texture => _texture;
  String get comment => _comment;
  String get hash => _hash;
  Uint8List get commentHash => _commentHash;
  Uint8List get textureHash => _textureHash;
  bool get prioritySpeaker => _prioritySpeaker;
  bool get recording => _recording;

  User._(this._client);

  @override
  Map<String, Object> jsonMap({bool serializeChannel: false}) => new Map<String, Object>()
    ..['session'] = session
    ..['name'] = name
    ..['userId'] = userId
    ..['channel'] = (serializeChannel ? channel?.jsonMap() : channel?.channelId)
    ..['mute'] = mute
    ..['deaf'] = deaf
    ..['suppress'] = suppress
    ..['selfMute'] = selfMute
    ..['selfDeaf'] = selfDeaf
    ..['texture'] = texture
    ..['comment'] = comment
    ..['hash'] = hash
    ..['commentHash'] = commentHash
    ..['textureHash'] = textureHash
    ..['prioritySpeaker'] = prioritySpeaker
    ..['recording'] = recording;

  void _notifyUserUpdate({@required User actor, @required UserChanges changes}) {
    listeners.forEach((UserListener listener) => listener.onUserChanged(this, actor, changes));
  }

  void _notifyUserRemoved({@required User actor, String reason, bool ban}) {
    listeners.forEach((UserListener listener) => listener.onUserRemoved(this, actor, reason, ban));
  }

  void _reportUserStats({@required UserStats stats}) {
    listeners.forEach((UserListener listener) => listener.onUserStats(this, stats));
  }

  void setPrioritySpeaker({@required bool prioritySpeaker}) =>
      _client.writeMessage(new Proto.UserState()..prioritySpeaker = prioritySpeaker);

  void setSuppress({@required bool suppress}) =>
      _client.writeMessage(new Proto.UserState()..suppress = suppress);

  void setMute({@required bool mute}) => _client.writeMessage(new Proto.UserState()..mute = mute);

  void setDeaf({@required bool deaf}) => _client.writeMessage(new Proto.UserState()..deaf = deaf);

  void kickUser({String reason}) => _client.writeMessage(new Proto.UserRemove()
    ..reason = reason
    ..ban = false
    ..session = session);

  void banUser({String reason}) => _client.writeMessage(new Proto.UserRemove()
    ..reason = reason
    ..ban = true
    ..session = session);

  void requestUserStats({bool statsOnly: false}) => _client.writeMessage(new Proto.UserStats()
    ..session = session
    ..statsOnly = statsOnly);

  void requestUserTexture() =>
      _client.writeMessage(new Proto.RequestBlob()..sessionTexture.add(session));

  void requestUserComment() =>
      _client.writeMessage(new Proto.RequestBlob()..sessionComment.add(session));

  void sendMessageToUser({@required String message}) => _client.sendMessage(
      message: new TextMessage.outgoing(message: message, clients: <User>[this]));

  void registerAsVoiceTarget({@required int id}) =>
      _client.registerVoiceTarget(target: new VoiceTarget(id: id)..withUser(user: this));

  void moveToChannel({@required Channel channel}) =>
      _client.writeMessage(new Proto.UserState()..channelId = channel.channelId);

  void registerUser() => _client.writeMessage(new Proto.UserState()
    ..userId = 0
    ..session = session);
}

class UserStats with JsonString {
  final List<Uint8List> certificates;
  final PacketStats fromClient;
  final PacketStats fromServer;
  final int udpPacketCount;
  final int tcpPacketCount;
  final PingStats pingStats;
  final VersionInformation clientVersion;
  final List<int> celtVersions;
  final InternetAddress address;
  final int bandwidth;
  final Duration onlineTime;
  final Duration idleTime;
  final bool strongCertificate;
  final bool opus;

  const UserStats(
      {this.certificates,
      this.fromClient,
      this.fromServer,
      this.udpPacketCount,
      this.tcpPacketCount,
      this.pingStats,
      this.clientVersion,
      this.celtVersions,
      this.address,
      this.bandwidth,
      this.onlineTime,
      this.idleTime,
      this.strongCertificate,
      this.opus});

  ///If withCertificates is true and the stats contain certificates, they are printed in binary.
  ///If withCertificates is false and the stats contain certificates, their count is printed.
  @override
  Map<String, Object> jsonMap({bool withCertificates: false}) => new Map<String, Object>()
    ..['certificates'] = (withCertificates
        ? certificates?.map((Uint8List bytes) => base64.encode)
        : certificates?.length)
    ..['fromClient'] = fromClient?.jsonMap()
    ..['fromServer'] = fromServer?.jsonMap()
    ..['udpPacketCount'] = udpPacketCount
    ..['tcpPacketCount'] = tcpPacketCount
    ..['pingStats'] = pingStats?.jsonMap()
    ..['clientVersion'] = clientVersion?.jsonMap()
    ..['celtVersions'] = celtVersions
    ..['address'] = address?.toString()
    ..['bandwidth'] = bandwidth
    ..['onlineTime'] = onlineTime?.toString()
    ..['idleTime'] = idleTime?.toString()
    ..['strongCertificate'] = strongCertificate
    ..['opus'] = opus;
}

@protected
RegisteredUser createRegisteredUser(Proto.UserList_User user, Channel channel) {
  return new RegisteredUser._(
      userId: user.userId,
      name: user.name,
      lastSeen:
          user.hasLastSeen() && user.lastSeen.isNotEmpty ? DateTime.parse(user.lastSeen) : null,
      lastChannel: channel);
}

class RegisteredUser with JsonString {
  final int userId;
  final String name;
  final DateTime lastSeen;
  final Channel lastChannel;

  const RegisteredUser._(
      {@required this.userId,
      @required this.name,
      @required this.lastSeen,
      @required this.lastChannel});

  @override
  Map<String, Object> jsonMap({bool serializeChannel: false}) => new Map<String, Object>()
    ..['lastSeen'] = lastSeen.toIso8601String()
    ..['name'] = name
    ..['userId'] = userId
    ..['channel'] = (serializeChannel ? lastChannel?.jsonMap() : lastChannel?.channelId);
}
