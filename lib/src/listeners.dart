import 'package:meta/meta.dart';

import 'audio_client.dart';
import 'model/channel.dart';
import 'model/misc.dart';
import 'model/user.dart';
import 'model/audio.dart';

mixin MumbleClientListener {
  void onUserAdded(User user);
  void onChannelAdded(Channel channel);
  void onTextMessage(TextMessage message);
  void onBanListReceived(List<BanEntry> bans);
  void onSynced();
  void onError(dynamic error, [StackTrace stackTrace]);
  void onDone();
  void onCryptStateChanged();
  void onDropAllChannelPermissions();
  void onQueryUsersResult(Map<int,String> idToName);
  void onUserListReceived(List<RegisteredUser> users);
}

mixin UserListener {
  void onUserChanged(User user, User actor, UserChanges changes);
  void onUserRemoved(User user, User actor, String reason, bool ban);
  void onUserStats(User user, UserStats stats);
}

mixin ChannelListener {
  void onChannelRemoved(Channel channel);
  void onChannelChanged(Channel channel, ChannelChanges changes);
  void onChannelPermissionsReceived(Channel channel, Permission permission);
}

mixin AudioListener {
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
