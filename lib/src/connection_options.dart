import 'utils/utils.dart' show JsonString;

class ConnectionOptions with JsonString {
  /// The users name.
  final String name;

  /// A password, if this user is the superuser.
  final String? password;

  /// The channel access tokens know on connect.
  final List<String> tokens;

  /// The supported celt versions.
  final List<int> celtVersions;

  /// True if this client supports opus.
  final bool opus;

  /// See [AudioClient.incomingAudioStreamTimeout].
  final Duration? incomingAudioStreamTimeout;

  /// If a ping message from this client to the mubmle server is not
  /// answered within this duration, the connection to the mumble
  /// server is considered dead.
  ///
  /// The [MumbleClient] will invoke [MumbleClientListener.onError] with a [TimeoutException].
  final Duration pingTimeout;

  /// Configures [ConnectionOptions].
  ///
  /// See the matching field documentation for more information about the parameters.
  ConnectionOptions(
      {required this.name,
      this.password,
      this.opus: true,
      this.tokens = const <String>[],
      this.celtVersions = const <int>[],
      this.incomingAudioStreamTimeout = const Duration(milliseconds: 500),
      this.pingTimeout = const Duration(seconds: 30)});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()
      ..['name'] = name
      ..['tokens'] = tokens
      ..['celtVersions'] = celtVersions
      ..['opus'] = opus;
    if (password != null) {
      map['password'] = password!;
    }
    if (incomingAudioStreamTimeout != null) {
      map['incomingAudioStreamTimeout'] = incomingAudioStreamTimeout!;
    }
    return map;
  }
}
