import 'dart:io' show Platform, SecurityContext;

import 'utils.dart' show JsonString, encodeVersion;

int get clientVersion => encodeVersion(1, 4, 0);

String get clientName => 'Dumble';
String get os => 'Dart VM';

String get osVersion => Platform.version;

class ConnectionOptions with JsonString {
  /// The Mumble server.
  final String host;

  /// The port of the Mumble server.
  final int port;

  /// The users name.
  final String name;

  /// A password, if this user is the superuser.
  final String? password;

  /// The connections security context containing this users certificate (see the constructor).
  final SecurityContext? context;

  /// The channel access tokens know on connect.
  final List<String> tokens;

  /// The supported celt versions.
  final List<int> celtVersions;

  /// True if this client supports opus.
  final bool opus;

  /// Configures [ConnectionOptions].
  ///
  /// See the matching field documentation for more information about the parameters.
  ConnectionOptions(
      {required this.host,
      required this.port,
      required this.name,
      this.context,
      this.password,
      this.opus: true,
      this.tokens = const <String>[],
      this.celtVersions = const <int>[]});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()
      ..['host'] = host
      ..['port'] = port
      ..['name'] = name
      ..['tokens'] = tokens
      ..['celtVersions'] = celtVersions
      ..['opus'] = opus;
    if (password != null) {
      map['password'] = password!;
    }
    return map;
  }
}
