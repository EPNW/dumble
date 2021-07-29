import 'dart:io';

import 'package:dumble/dumble.dart';

final ConnectionOptions defaulConnectionOptions = new ConnectionOptions(
    host: 'epnw.eu',
    port: 64738,
    name: 'Dumble2',
    password: 'Pandela',
    pingTimeout: const Duration(seconds: 5));

/// Connect a Mumble server with a user certificate.
/// If you connect with certificate, you can register your self.
/// Instead of passwords, Mumble uses certificates to identify users.
final ConnectionOptions defaulConnectionOptionsWithCertificate =
    new ConnectionOptions(
        host: defaulConnectionOptions.host,
        name: defaulConnectionOptions.name,
        port: defaulConnectionOptions.port,
        password: defaulConnectionOptions.password,
        pingTimeout: defaulConnectionOptions.pingTimeout,
        incomingAudioStreamTimeout:
            defaulConnectionOptions.incomingAudioStreamTimeout,
        context: new SecurityContext(withTrustedRoots: true)
          ..usePrivateKey('./assets/dumble_key.pem')
          ..useCertificateChain('./assets/dumble_cert.pem'));
