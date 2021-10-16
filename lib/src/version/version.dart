import '../utils/utils.dart' show encodeVersion;

export 'version_web.dart'
    if (dart.library.io) 'version_vm.dart'; // dart:io implementation

int get clientVersion => encodeVersion(1, 4, 0);
String get clientName => 'Dumble';
