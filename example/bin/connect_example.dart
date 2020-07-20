import 'dart:io';

import 'package:dumble/dumble.dart';

Future<void> main() async {
  ConnectionOptions options =
      new ConnectionOptions(host: 'localhost', port: 64738, name: 'Dumble');
  MumbleClient client = new MumbleClient(options: options);
  // Add a callback to the client
  client.add(new MumbleCallback(client));
  await client.connect(onBadCertificate: (X509Certificate certificate) {
    //Accept every certificate
    return true;
  });
  // Set a comment for us
  client.selfe.setComment(comment: 'I\'m a bot!');
// Create a channel. If the channel is succesfully created, our callback is invoked.
  client.createChannel(name: 'Dumble Test Channel');
}

class MumbleCallback with MumbleClientListener, UserListener {
  final MumbleClient client;

  const MumbleCallback(this.client);

  @override
  void onBanListReceived(List<BanEntry> bans) {}

  @override
  void onChannelAdded(Channel channel) {
    if (channel.name == 'Dumble Test Channel') {
      // This is our channel
      // join it
      client.selfe.moveToChannel(channel: channel);
    }
  }

  @override
  void onCryptStateChanged() {}

  @override
  void onDone() {}

  @override
  void onDropAllChannelPermissions() {}

  @override
  void onError(error, [StackTrace stackTrace]) {
    throw error;
  }

  @override
  void onQueryUsersResult(Map<int, String> idToName) {}

  @override
  void onSynced() {
    print('Client synced with server!');
    print('Listing channels...');
    print(client.getChannels());
    print('Listing users...');
    print(client.getUsers());
  }

  @override
  void onTextMessage(TextMessage message) {
    print('[${new DateTime.now()}] ${message.actor.name}: ${message.message}');
  }

  @override
  void onUserAdded(User user) {
    //Keep an eye on the user
    user.add(this);
  }

  @override
  void onUserListReceived(List<RegisteredUser> users) {}

  @override
  void onUserChanged(User user, User actor, UserChanges changes) {
    // The user changed
    if (changes.channel) {
      // ...his channel
      if (user.channel == client.selfe.channel) {
        // ... to our channel
        // So greet him
        client.selfe.channel
            .sendMessageToChannel(message: 'Hello ${user.name}!');
      }
    }
  }

  @override
  void onUserRemoved(User user, User actor, String reason, bool ban) {
    if (user == actor) {
      //The user left the server
    } else if (ban) {
      // The user was baned from the server
    } else {
      // The user was kicked from the server
    }
  }

  @override
  void onUserStats(User user, UserStats stats) {}
}
