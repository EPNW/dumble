import 'dart:io';

import 'package:dumble/dumble.dart';
import 'package:dumble_examples/connection_options.dart';

Future<void> main() async {
// Connect a Mumble server with a user certificate.
// If you connect with certificate, you can register your self.
// Instead of passwords, Mumble uses certificates to identify users.
  SecurityContext context = new SecurityContext(withTrustedRoots: true)
    ..usePrivateKey('./assets/dumble_key.pem')
    ..useCertificateChain('./assets/dumble_cert.pem');
  ConnectionOptions optionsWithCertificate = new ConnectionOptions(
      host: defaulConnectionOptions.host,
      name: defaulConnectionOptions.name,
      port: defaulConnectionOptions.port,
      password: defaulConnectionOptions.password,
      context: context);
  MumbleClient client = await MumbleClient.connect(
      options: optionsWithCertificate,
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
      // We are the changed user and our id chagned
      // What means that we are now registered
      print('Registered with id ${user.userId}');
    }
  }

  @override
  void onUserRemoved(User user, User? actor, String? reason, bool? ban) {}

  @override
  void onUserStats(User user, UserStats stats) {}
}
