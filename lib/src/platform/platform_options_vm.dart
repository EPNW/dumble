import 'dart:io' show SecurityContext, X509Certificate;

import 'platform_options.dart';

/// Return `true` to trust the certificate or `false` to consider it bad.
typedef bool OnBadCertificate(X509Certificate certificate);

class PlatformOptionsVM extends PlatformOptions {
  /// The connections security context containing this users certificate (see the constructor).
  final SecurityContext? context;

  final OnBadCertificate? onBadCertificate;

  /// The Mumble server.
  final String host;

  /// The port of the Mumble server.
  final int port;

  final bool udpEnabled;
  final Object? udpLocalBindAddress;
  final int udpLocalBindPort;

  /// Every Mumble server provides a ssl certificate. If your local runtime does not trust this certificate,
  /// (e.g. self signed certificates) `onBadCertificate` is invoked with it. There you can decide, how to procceed.
  ///
  /// On default, it is tried to use udp for audio transmitting. You can disable this using `useUdp`.
  /// If using udp you can use `localUdpBindAddress` and `localUdpBindPort` to speficy how the clients
  /// udp peer should be created. Leave this `null` to listen on all interfaces and
  /// set localUdpBindPort to 0 to use an ephemeral port.
  PlatformOptionsVM(
      {required this.host,
      required this.port,
      this.context,
      this.udpEnabled = true,
      this.udpLocalBindPort = 0,
      this.udpLocalBindAddress,
      this.onBadCertificate});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()
      ..['host'] = host
      ..['port'] = port
      ..['udpEnabled'] = udpEnabled
      ..['udpLocalBindPort'] = udpLocalBindPort;
    if (udpLocalBindAddress != null) {
      map['udpLocalBindAddress'] = udpLocalBindAddress!.toString();
    }
    return map;
  }
}
