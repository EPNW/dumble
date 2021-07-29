import 'package:dumble/dumble.dart';
import 'package:meta/meta.dart';

import 'audio/audio_client.dart';
import 'model/channel.dart';
import 'model/user.dart';
import 'model/audio.dart';
import 'model/text_message.dart';
import 'model/ban.dart';
import 'model/permission.dart';
import 'model/registered_user.dart';
import 'model/user_stats.dart';

mixin MumbleClientListener {
  /// Invoked every time a user joins the server.
  void onUserAdded(User user);

  /// Invoked evers time a new channel is created.
  void onChannelAdded(Channel channel);

  /// Invoked when a text message is received.
  void onTextMessage(IncomingTextMessage message);

  /// Invoked with the ban list after querying it using [MumbleClient.queryBans].
  void onBanListReceived(List<BanEntry> bans);

  /// Invoked if an error occurs.
  ///
  /// The [MumbleClient] will have been closed before `onError` is called, meaning
  /// that no further callbacks will be invoked (not even [onDone]).
  /// You should not attempt to use the object any more and instead
  /// create a new [MumbleClient].
  void onError(Object error, [StackTrace? stackTrace]);

  /// Invoked if the connection is closed greacefully by the mumble server.
  ///
  /// The [MumbleClient] will have been closed before `onDone` is called, meaning
  /// that no further callbacks will be invoked. You should not attempt to use the
  /// object any more and instead create a new [MumbleClient].
  ///
  /// This callback will only be called if the connection was terminated greacefully
  /// by the mumble server, so it will not be called if you closed the connection using
  /// [MumbleClient.close]. Gracefull termination by the mumlbe server will almost never
  /// happen (exception see below), so this callback will also most likly not be called at all.
  /// Instead, [onError] will be used if the connection was not terminated gracefully.
  ///
  /// If the server kicks or bans this client, it is considered gracefull and `onDone` will be
  /// called instead of [onError]. Before `onDone` will be called, [UserListener.onUserRemoved]
  /// will have been called with [MumbleClient.self] (given that a [UserListener] was registered
  /// for [MumbleClient.self] first).
  void onDone();

  /// Invoked if the permissions for an action were denied by the mumble server.
  ///
  /// This should not be treated as an error and the client can still be used
  /// after this occures to do other things.
  void onPermissionDenied(PermissionDeniedException e);

  /// Informs, that the crypt state was changed. No actions have to be taken as this was already handled internally.
  void onCryptStateChanged();

  /// Tells the client do drop all cached channel permissions (if you cached them).
  void onDropAllChannelPermissions();

  /// Invoked with user ids mapped to their names after querying it using
  /// [MumbleClient.queryUsersByNames] or [MumbleClient.queryUsersByIds].
  void onQueryUsersResult(Map<int, String> idToName);

  /// Invoked with all registered users after requesting it
  /// using [MumbleClient.listUsers].
  void onUserListReceived(List<RegisteredUser> users);
}

mixin UserListener {
  /// Invoked when a `user` changes (e.g. channel, comment).
  ///
  /// What changed can be seen in `changes`.
  /// `actor` is responsible for this change and can be the user herself,
  /// but also a superuser or moderator, etc.
  void onUserChanged(User user, User? actor, UserChanges changes);

  /// Called when a `user` leaves the server or is removed from it.
  ///
  /// If the `actor` responsible for this remove is either `null` or
  /// the `user` itself, the `user` simply left.
  ///
  /// If this is NOT the case, the `user` was either kicked of `ban`ned
  /// from the server by `actor`, so there might be a non-null `reason`.
  ///
  /// If the user of this client (self) is kicked or banned, this will be invoked
  /// prior to [MumlbeClientListener.onDone].
  void onUserRemoved(User user, User? actor, String? reason, bool? ban);

  /// Called when user stats are received.
  ///
  /// This usually only happens if they were requested using
  /// [MumbleClient.requestUserStats].
  void onUserStats(User user, UserStats stats);
}

mixin ChannelListener {
  /// Invoked when a channel is removed
  void onChannelRemoved(Channel channel);

  /// Invoked when a channel changes (e.g. name, links, comment).
  ///
  /// What changed can be seen in `changes`.
  void onChannelChanged(Channel channel, ChannelChanges changes);

  /// Called when this users permissions for a channel are received.
  void onChannelPermissionsReceived(Channel channel, Permission permission);
}

mixin AudioListener {
  /// Invoked with a stream of [AudioFrame]s containing voice data.
  ///
  /// The frames are encoded using `codec` and originate from `speaker`.
  /// The `talkMode` denotes if this transmission is received as part of normal conversation in channels or due to whispering.
  ///
  /// The `voiceData` stream is closed if the mumble server properly ends the current transmission (if `speaker` stops speaking),
  /// or if there are no data for this transmission during a duration of [AudioClient.incomingAudioStreamTimeout].
  /// The later usually happens if a mumble user is forcefully muted by the mumble server while still speaking.
  /// The mumble server will then not send further voice packets to the other users, but will also not send a proper
  /// end frame, so this timeout is needed to decide whether to close the stream.
  void onAudioReceived(Stream<AudioFrame> voiceData, AudioCodec codec,
      User? speaker, TalkMode talkMode);
}

mixin Notifier<T> {
  List<T> _listeners = <T>[];

  void add(T listener) {
    _listeners.add(listener);
  }

  void remove(T listener) {
    _listeners.remove(listener);
  }

  bool get hasListeners => _listeners.isNotEmpty;

  @protected
  Iterable<T> get listeners sync* {
    yield* _listeners;
  }
}
