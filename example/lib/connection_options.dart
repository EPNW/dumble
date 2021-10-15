import 'package:dumble/dumble.dart';

export 'platform_options_web.dart'
    if (dart.library.io) 'platform_options_vm.dart' show defaultPlatformOptions;

final ConnectionOptions defaultConnectionOptions = new ConnectionOptions(
    name: 'Dumble2',
    password: 'Pandela',
    pingTimeout: const Duration(seconds: 5));
