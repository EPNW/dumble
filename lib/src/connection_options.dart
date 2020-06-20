import 'dart:io' show Platform, SecurityContext;

import 'package:meta/meta.dart';
import 'utils.dart' show JsonString, encodeVersion;

int get clientVersion => encodeVersion(1, 3, 0);

String get clientName => 'Dumble';
String get os => 'Dart VM';

String get osVersion => Platform.version;

class ConnectionOptions with JsonString {
  final String host;
  final int port;
  final String name;
  final String password;
  final SecurityContext context;
  final List<String> _tokens;
  final List<int> _celtVersions;
  final bool opus;
  List<int> get celtVersions => _celtVersions ?? new List<int>();
  List<String> get tokens => _tokens ?? new List<String>();

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
