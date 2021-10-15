import 'package:dumble/dumble.dart';
import 'package:dumble_examples/connection_options.dart';
// Explicitly import the VM version, see below!
import 'package:dumble_examples/platform_options_vm.dart';

/// This example only works on the vm (NOT on the web), since we can't set
/// client certificates on the web!
Future<void> main() async {
  MumbleClient client = await MumbleClient.connect(
      options: defaultConnectionOptions,
      platformOptions: defaultPlatformOptionsWithClientCertificate);
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
