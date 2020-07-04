import 'dart:io' show Platform, SecurityContext;

import 'package:meta/meta.dart';
import 'utils.dart' show JsonString, encodeVersion;

int get clientVersion => encodeVersion(1, 3, 0);

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
  final String password;

  /// The connections security context containing this users certificate (see the constructor).
  final SecurityContext context;
  
  final List<String> _tokens;
  final List<int> _celtVersions;

  /// True if this client supports opus.
  final bool opus;

  /// The supported celt versions.
  List<int> get celtVersions => _celtVersions ?? new List<int>();
  List<String> get tokens => _tokens ?? new List<String>();

  /// Configures [ConnectionOptions] with a manially initalized [SecurityContext].
  ///
  /// See the matching field documentation for more information about the parameters.
  const ConnectionOptions.withSecurityContext(
      {@required this.host,
      @required this.port,
      @required this.name,
      @required this.context,
      this.password,
      this.opus: true,
      List<String> tokens,
      List<int> celtVersions})
      : this._tokens = tokens,
        this._celtVersions = celtVersions;

  /// Like [ConnectionOptions.withSecurityContext] but initalizes a [SecurityContext].
  ///
  /// The [SecurityContext] trusts this runtimes root certificates.
  /// The users certificate set to `clientCertificate` which must be in p12 or pem format
  /// and contain the users certificate (chain) and the private key. If the private key is encrypted,
  /// `clientCertificateStorePassword` must be given.
  ConnectionOptions(
      {@required String host,
      @required int port,
      @required String name,
      List<int>
          clientCertificate, //p12 or pem containing the certificate chain and the private key
      String clientCertificateStorePassword,
      String password,
      bool opus: true,
      List<String> tokens,
      List<int> celtVersions})
      : this.withSecurityContext(
            context: clientCertificate == null
                ? null
                : (new SecurityContext(withTrustedRoots: true)
                  ..useCertificateChainBytes(clientCertificate,
                      password: clientCertificateStorePassword)
                  ..usePrivateKeyBytes(clientCertificate,
                      password: clientCertificateStorePassword)),
            host: host,
            port: port,
            name: name,
            password: password,
            opus: opus,
            tokens: tokens,
            celtVersions: celtVersions);

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['host'] = host
    ..['port'] = port
    ..['name'] = name
    ..['password'] = password
    ..['tokens'] = tokens
    ..['celtVersions'] = celtVersions
    ..['opus'] = opus;
}
