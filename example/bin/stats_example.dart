import 'dart:io';

import 'package:dumble/dumble.dart';
import 'package:dumble_examples/connection_options.dart';

Future<void> main() async {
  MumbleClient client = await MumbleClient.connect(
      options: defaulConnectionOptionsWithCertificate,
      onBadCertificate: (X509Certificate certificate) {
        //Accept every certificate
        return true;
      });
  MumbleExampleCallback callback = new MumbleExampleCallback(client);
  client.add(callback);
  print('Client synced with server!');
  // Watch self
  client.self.add(callback);
  while (true) {
    print(client.serverInfo.connectionStats);
    client.self.requestUserStats(statsOnly: true);
    await new Future.delayed(const Duration(seconds: 3));
  }
}

class MumbleExampleCallback with MumbleClientListener, UserListener {
  final MumbleClient client;

  const MumbleExampleCallback(this.client);

  @override
  void onBanListReceived(List<BanEntry> bans) {}

  @override
  void onChannelAdded(Channel channel) {}

  @override
  void onCryptStateChanged() {}

  @override
  void onDone() {}

  @override
  void onDropAllChannelPermissions() {}

  @override
  void onError(error, [StackTrace? stackTrace]) {
    throw error;
  }

  @override
  void onQueryUsersResult(Map<int, String> idToName) {}

  @override
  void onTextMessage(IncomingTextMessage message) {}

  @override
  void onUserAdded(User user) {}

  @override
  void onUserListReceived(List<RegisteredUser> users) {}

  @override
  void onUserChanged(User? user, User? actor, UserChanges changes) {}

  @override
  void onUserRemoved(User user, User? actor, String? reason, bool? ban) {}

  @override
  void onUserStats(User user, UserStats stats) {
    print('Stats for ${user.name}: $stats');
  }
}
