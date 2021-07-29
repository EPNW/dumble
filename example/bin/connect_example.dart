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
  print('Listing channels...');
  print(client.getChannels());
  print('Listing users...');
  print(client.getUsers());
  // Watch all users that are already on the server
  // New users will reported to the callback (because of line 14) and we will
  // watch these new users in onUserAdded below
  client.getUsers().values.forEach((User element) => element.add(callback));
  // Also, watch self
  client.self.add(callback);
  // Set a comment for us
  client.self.setComment(comment: 'I\'m a bot!');
// Create a channel. If the channel is succesfully created, our callback is invoked.
  client.createChannel(name: 'Dumble Test Channel');
  //await new Future.delayed(const Duration(seconds: 30));
  //await client.close();
  //print('Bye!');
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
  void onDone() {
    print('onDone');
  }

  @override
  void onDropAllChannelPermissions() {}

  @override
  void onError(error, [StackTrace? stackTrace]) {
    print('An error occured!');
    print(error);
    if (stackTrace != null) {
      print(stackTrace);
    }
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
    print('User $user changed $changes');
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
    // If the removed user is the actor that is responsible for this, the
    // user simply left the server. Same is ture if the actor is null.
    if (actor == null || user == actor) {
      print('${user.name} left the server');
    } else if (ban ?? false) {
      // The user was baned from the server
      print('${user.name} was banned by ${actor.name}, reason $reason.');
    } else {
      // The user was kicked from the server
      print('${user.name} was kicked by ${actor.name}, reason $reason.');
    }
  }

  @override
  void onUserStats(User user, UserStats stats) {}

  @override
  void onPermissionDenied(PermissionDeniedException e) {
    print('Permission denied!');
    print(
        'This will occur if this example is run a second time, since it will try to create a channel that already exists!');
    print('The concrete exception was: $e');
  }
}
