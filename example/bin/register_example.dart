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
  client.self.add(new SelfCallback(client.self.session));
  client.self.registerUser();
}

class SelfCallback with UserListener {
  final int session;

  SelfCallback(this.session);

  @override
  void onUserChanged(User user, User? actor, UserChanges changes) {
    if (user.session == session && changes.userId) {
      // We are the changed user and our id changed
      // What means that we are now registered
      print('Registered with id ${user.userId}');
    }
  }

  @override
  void onUserRemoved(User user, User? actor, String? reason, bool? ban) {}

  @override
  void onUserStats(User user, UserStats stats) {}
}
