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
  /// Not called until syncronisation is done.
  void onUserAdded(User user);

  /// Invoked evers time a new channel is created.
  /// Not called until syncronisation is done.
  void onChannelAdded(Channel channel);

  /// Invoked when a text message is received.
  void onTextMessage(IncomingTextMessage message);

  /// Invoked with the ban list after querying it using [queryBans].
  void onBanListReceived(List<BanEntry> bans);

  /// Invoked when an error occurs.
  void onError(Object error, [StackTrace? stackTrace]);

  /// Invoked when the connection is closed:
  void onDone();

  /// Informs, that the crypt state was changed. No actions have to be taken as this was already handled internally.
  void onCryptStateChanged();

  /// Tells the client do drop all cached channel permissions (if you cached them).
  void onDropAllChannelPermissions();

  /// Invoked with user ids mapped to their names after querying it using [queryUsersByNames] or [queryUsersByIds].
  void onQueryUsersResult(Map<int, String> idToName);

  /// Invoked with all registered users after requesting it using [listUsers].
  void onUserListReceived(List<RegisteredUser> users);
}

mixin UserListener {
  /// Invoked when a `user` changes (e.g. channel, comment).
  /// What changed can be seen in `changes`.
  /// `actor` is responsible for this change and can be the user herself,
  /// but also a superuser or moderator, etc.
  void onUserChanged(User user, User? actor, UserChanges changes);

  /// Called when a `user` leaves the server or is removed from it.
  /// If `actor` is not the same as `user` this was most likly a kick or even a `ban`, so there might be a `reason`.
  void onUserRemoved(User user, User? actor, String? reason, bool? ban);

  /// Called when user stats are received (usually only if they were requested using [requestUserStats]).
  void onUserStats(User user, UserStats stats);
}

mixin ChannelListener {
  /// Invoked when a channel is removed
  void onChannelRemoved(Channel channel);

  /// Invoked when a channel changes (e.g. name, links, comment).
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

  @protected
  Iterable<T> get listeners sync* {
    yield* _listeners;
  }
}
