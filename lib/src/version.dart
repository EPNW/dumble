import 'dart:io' show Platform;

import 'utils/utils.dart' show encodeVersion;

int get clientVersion => encodeVersion(1, 4, 0);

String get clientName => 'Dumble';
String get os => 'Dart VM';

String get osVersion => Platform.version;
