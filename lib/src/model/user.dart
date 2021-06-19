import 'dart:typed_data';
import '../client_base.dart';
import '../listeners.dart';
import 'package:meta/meta.dart';
import '../generated/Mumble.pb.dart' as Proto;
import 'channel.dart';
import 'voice_target.dart';
import '../utils.dart' show JsonString;
import 'user_stats.dart';
import 'text_message.dart';

@protected
User createNewUser(
    {required int sessionId,
    required MumbleClientBase client,
    required Channel channel}) {
  return new User._(sessionId, client, channel);
}

@protected
Self asSelf({required User user}) {
  Self self = new Self._(user.session, user._client, user.channel);
  _copy(to: self, from: user);
  return self;
}

void _copy({required User to, required User from}) {
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
UserChanges updateUser(
    {required User user, Channel? channel, required Proto.UserState state}) {
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
  if (state.hasCommentHash())
    user._commentHash = new Uint8List.fromList(state.commentHash);
  if (state.hasTextureHash())
    user._textureHash = new Uint8List.fromList(state.textureHash);
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
void notifyUserUpdate(
    {required User user, User? actor, required UserChanges changes}) {
  user._notifyUserUpdate(actor: actor, changes: changes);
}

@protected
void notifyUserRemoved(
    {required User user, User? actor, String? reason, bool? ban}) {
  user._notifyUserRemoved(actor: actor, reason: reason, ban: ban);
}

@protected
void reportUserStats({required User user, required UserStats stats}) {
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
      {required this.name,
      required this.userId,
      required this.channel,
      required this.mute,
      required this.deaf,
      required this.supress,
      required this.selfMute,
      required this.selfDeaf,
      required this.texture,
      required this.comment,
      required this.hash,
      required this.commentHash,
      required this.textureHash,
      required this.prioritySpeaker,
      required this.recording});

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

class Self extends User {
  Self._(int session, MumbleClientBase _client, Channel channel)
      : super._(session, _client, channel);

  void setComment({String? comment}) =>
      _client.writeMessage(new Proto.UserState()..comment = comment ?? '');

  void setTexture({Uint8List? texture}) {
    Proto.UserState state = new Proto.UserState();
    if (texture != null && texture.isNotEmpty) {
      state.texture = texture;
    }
    _client.writeMessage(state);
  }

  void setSelfMute({required bool mute}) =>
      _client.writeMessage(new Proto.UserState()..selfMute = mute);

  void setSelfDeaf({required bool deaf}) =>
      _client.writeMessage(new Proto.UserState()..selfDeaf = deaf);
}

class User with Notifier<UserListener>, JsonString {
  final MumbleClientBase _client;
  final int session;
  Channel _channel;
  String? _name;
  int? _userId;
  bool? _mute;
  bool? _deaf;
  bool? _suppress;
  bool? _selfMute;
  bool? _selfDeaf;
  Uint8List? _texture;
  String? _comment;
  String? _hash;
  Uint8List? _commentHash;
  Uint8List? _textureHash;
  bool? _prioritySpeaker;
  bool? _recording;

  String? get name => _name;
  int? get userId => _userId;
  Channel get channel => _channel;
  bool? get mute => _mute;
  bool? get deaf => _deaf;
  bool? get suppress => _suppress;
  bool? get selfMute => _selfMute;
  bool? get selfDeaf => _selfDeaf;
  Uint8List? get texture => _texture;
  String? get comment => _comment;
  String? get hash => _hash;
  Uint8List? get commentHash => _commentHash;
  Uint8List? get textureHash => _textureHash;
  bool? get prioritySpeaker => _prioritySpeaker;
  bool? get recording => _recording;

  User._(this.session, this._client, this._channel);

  @override
  Map<String, Object> jsonMap({bool serializeChannel: false}) {
    Map<String, Object> map = new Map<String, Object>()..['session'] = session;
    if (name != null) {
      map['name'] = name!;
    }
    if (userId != null) {
      map['userId'] = userId!;
    }
    map['channel'] = (serializeChannel ? channel.jsonMap() : channel.channelId);
    if (mute != null) {
      map['mute'] = mute!;
    }
    if (deaf != null) {
      map['deaf'] = deaf!;
    }
    if (suppress != null) {
      map['suppress'] = suppress!;
    }
    if (selfMute != null) {
      map['selfMute'] = selfMute!;
    }
    if (selfDeaf != null) {
      map['selfDeaf'] = selfDeaf!;
    }
    if (texture != null) {
      map['texture'] = texture!;
    }
    if (comment != null) {
      map['comment'] = comment!;
    }
    if (hash != null) {
      map['hash'] = hash!;
    }
    if (commentHash != null) {
      map['commentHash'] = commentHash!;
    }
    if (textureHash != null) {
      map['textureHash'] = textureHash!;
    }
    if (prioritySpeaker != null) {
      map['prioritySpeaker'] = prioritySpeaker!;
    }
    if (recording != null) {
      map['recording'] = recording!;
    }
    return map;
  }

  void _notifyUserUpdate({User? actor, required UserChanges changes}) {
    listeners.forEach((UserListener listener) =>
        listener.onUserChanged(this, actor, changes));
  }

  void _notifyUserRemoved({User? actor, String? reason, bool? ban}) {
    listeners.forEach((UserListener listener) =>
        listener.onUserRemoved(this, actor, reason, ban));
  }

  void _reportUserStats({required UserStats stats}) {
    listeners
        .forEach((UserListener listener) => listener.onUserStats(this, stats));
  }

  void setPrioritySpeaker({required bool prioritySpeaker}) => _client
      .writeMessage(new Proto.UserState()..prioritySpeaker = prioritySpeaker);

  void setSuppress({required bool suppress}) =>
      _client.writeMessage(new Proto.UserState()..suppress = suppress);

  void setMute({required bool mute}) =>
      _client.writeMessage(new Proto.UserState()..mute = mute);

  void setDeaf({required bool deaf}) =>
      _client.writeMessage(new Proto.UserState()..deaf = deaf);

  void kickUser({String? reason}) {
    Proto.UserRemove msg = new Proto.UserRemove()
      ..ban = false
      ..session = session;
    if (reason != null) {
      msg.reason = reason;
    }
    _client.writeMessage(msg);
  }

  void banUser({String? reason}) {
    Proto.UserRemove msg = new Proto.UserRemove()
      ..ban = true
      ..session = session;
    if (reason != null) {
      msg.reason = reason;
    }
    _client.writeMessage(msg);
  }

  void requestUserStats({bool statsOnly: false}) =>
      _client.writeMessage(new Proto.UserStats()
        ..session = session
        ..statsOnly = statsOnly);

  void requestUserTexture() => _client
      .writeMessage(new Proto.RequestBlob()..sessionTexture.add(session));

  void requestUserComment() => _client
      .writeMessage(new Proto.RequestBlob()..sessionComment.add(session));

  void sendMessageToUser({required String message}) => _client.sendMessage(
      message:
          new OutgoingTextMessage(message: message, clients: <User>[this]));

  void registerAsVoiceTarget({required int id}) => _client.registerVoiceTarget(
      target: new VoiceTarget(id: id)..withUser(user: this));

  void moveToChannel(
      {required Channel channel, List<String>? temporaryAccessTokens}) {
    Proto.UserState msg = new Proto.UserState();
    msg.channelId = channel.channelId;
    msg.session = session;
    if (temporaryAccessTokens != null) {
      msg.temporaryAccessTokens.addAll(temporaryAccessTokens);
    }
    _client.writeMessage(msg);
  }

  void addListeingChannels(
      {required List<Channel> channels, List<String>? temporaryAccessTokens}) {
    Proto.UserState msg = new Proto.UserState();
    msg.listeningChannelAdd.addAll(channels.map((Channel c) => c.channelId));
    msg.session = session;
    if (temporaryAccessTokens != null) {
      msg.temporaryAccessTokens.addAll(temporaryAccessTokens);
    }
    _client.writeMessage(msg);
  }

  void removeListeingChannels(
      {required List<Channel> channels, List<String>? temporaryAccessTokens}) {
    Proto.UserState msg = new Proto.UserState();
    msg.listeningChannelRemove.addAll(channels.map((Channel c) => c.channelId));
    msg.session = session;
    if (temporaryAccessTokens != null) {
      msg.temporaryAccessTokens.addAll(temporaryAccessTokens);
    }
    _client.writeMessage(msg);
  }

  void registerUser() => _client.writeMessage(new Proto.UserState()
    ..userId = 0
    ..session = session);
}
