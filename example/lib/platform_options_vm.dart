import 'dart:io';

import 'package:dumble/dumble.dart';
import 'package:dumble/vm.dart';

final PlatformOptions defaultPlatformOptions = new PlatformOptionsVM(
  host: 'epnw.eu',
  port: 64738,
);

/// Connect a Mumble server with a user certificate.
/// If you connect with certificate, you can register your self.
/// Instead of passwords, Mumble uses certificates to identify users.
final PlatformOptions defaultPlatformOptionsWithClientCertificate =
    new PlatformOptionsVM(
        host: 'epnw.eu',
        port: 64738,
        onBadCertificate: (X509Certificate certificate) {
          //Accept every certificate
          return true;
        },
        context: new SecurityContext(withTrustedRoots: true)
          ..usePrivateKey('./assets/dumble_key.pem')
          ..useCertificateChain('./assets/dumble_cert.pem'));
