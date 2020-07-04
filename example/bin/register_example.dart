import 'dart:io';

import 'package:dumble/dumble.dart';

Future<void> main() async {
// Connect a Mumble server with a user certificate.
// If you connect with certificate, you can register your self.
// Instead of passwords, Mumble uses certificates to identify users.
  SecurityContext context = new SecurityContext(withTrustedRoots: true)
    ..usePrivateKey('dumble_key.pem')
    ..useCertificateChain('dumble_cert.pem');
  ConnectionOptions options = new ConnectionOptions.withSecurityContext(
      host: 'localhost', port: 64738, name: 'DumbleTest', context: context);
  MumbleClient client = new MumbleClient(options: options);
  await client.connect(onBadCertificate: (X509Certificate certificate) {
    //Accept every certificate
    return true;
  });
  client.selfe.add(new SelfeCallback());
  client.selfe.registerUser();
}

class SelfeCallback with UserListener {
  @override
  void onUserChanged(User user, User actor, UserChanges changes) {
    if (user.name == 'DumbleTest' && changes.userId) {
      // We are the changed user and our id chagned
      // What means that we are now registered
      print('Registered with id ${user.userId}');
    }
  }

  @override
  void onUserRemoved(User user, User actor, String reason, bool ban) {}

  @override
  void onUserStats(User user, UserStats stats) {}
}
