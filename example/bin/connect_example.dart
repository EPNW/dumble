import 'dart:io';

import 'package:dumble/dumble.dart';
import 'package:dumble_examples/connection_options.dart';

Future<void> main() async {
  MumbleClient client = await MumbleClient.connect(
      options: defaulConnectionOptions,
      onBadCertificate: (X509Certificate certificate) {
        //Accept every certificate
        return true;
      });
  client.add(new MumbleExampleCallback(client));
  print('Client synced with server!');
  print('Listing channels...');
  print(client.getChannels());
  print('Listing users...');
  print(client.getUsers());
  // Set a comment for us
  client.self.setComment(comment: 'I\'m a bot!');
// Create a channel. If the channel is succesfully created, our callback is invoked.
  client.createChannel(name: 'Dumble Test Channel');
}

class MumbleExampleCallback with MumbleClientListener, UserListener {
  final MumbleClient client;

  const MumbleExampleCallback(this.client);

  @override
  void onBanListReceived(List<BanEntry> bans) {}

  @override
  void onChannelAdded(Channel channel) {
    if (channel.name == 'Dumble Test Channel') {
      // This is our channel
      // join it
      client.self.moveToChannel(channel: channel);
    }
  }

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
  void onTextMessage(IncomingTextMessage message) {
    print('[${new DateTime.now()}] ${message.actor?.name}: ${message.message}');
  }

  @override
  void onUserAdded(User user) {
    //Keep an eye on the user
    user.add(this);
  }

  @override
  void onUserListReceived(List<RegisteredUser> users) {}

  @override
  void onUserChanged(User? user, User? actor, UserChanges changes) {
    // The user changed
    if (changes.channel) {
      // ...his channel
      if (user?.channel == client.self.channel) {
        // ... to our channel
        // So greet him
        client.self.channel
            .sendMessageToChannel(message: 'Hello ${user?.name}!');
      }
    }
  }

  @override
  void onUserRemoved(User user, User? actor, String? reason, bool? ban) {
    if (user == actor) {
      //The user left the server
    } else if (ban ?? false) {
      // The user was baned from the server
    } else {
      // The user was kicked from the server
    }
  }

  @override
  void onUserStats(User user, UserStats stats) {}
}
