import 'package:meta/meta.dart';

import 'audio_client.dart';
import 'model/channel.dart';
import 'model/misc.dart';
import 'model/user.dart';
import 'model/audio.dart';

mixin MumbleClientListener {
  /// Invoked every time a user joins the server.
  /// Not called until syncronisation is done.
  void onUserAdded(User user);

  /// Invoked evers time a new channel is created.
  /// Not called until syncronisation is done.
  void onChannelAdded(Channel channel);

  /// Invoked when a text message is received.
  void onTextMessage(TextMessage message);

  /// Invoked with the ban list after querying it using [queryBans].
  void onBanListReceived(List<BanEntry> bans);

  /// Called once syncronisation is done.
  void onSynced();

  /// Invoked when an error occurs.
  void onError(dynamic error, [StackTrace stackTrace]);

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
  /// `actor` is responsible for this change and can be the user himselfe,
  /// but also a superuser or moderator, etc.
  void onUserChanged(User user, User actor, UserChanges changes);

  /// Called when a `user` leaves the server or is removed from it.
  /// If `actor` is not the same as `user` this was most likly a kick or even a `ban`, so there might be a `reason`.
  void onUserRemoved(User user, User actor, String reason, bool ban);

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
  /// The `voiceData` stream is closed if the `speaker` stops.
  /// The `talkMode` denotes if this transmission is received as part of normal conversation in channels or due to whispering.
  void onAudioReceived(Stream<AudioFrame> voiceData, AudioCodec codec,
      User speaker, TalkMode talkMode);
}

mixin Notifier<T> {
  List<T> _listeners = new List<T>();

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
