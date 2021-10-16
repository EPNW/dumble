import '../audio_packet.dart';
import '../../client.dart' show CryptStateProvider;

import '../../platform/platform_options.dart';

import 'udp_transport_web.dart'
    if (dart.library.io) 'udp_transport_vm.dart'; // dart:io implementation

class UdpPingException implements Exception {
  @override
  String toString() =>
      'UdpPingException: Pinging not successfull. This means that the udp transport is too unreliable at the moment. This may change when pinging is succesfull again.';
}

typedef void ResyncRequestHandler();

abstract class UdpTransport {
  String get remoteHost;
  Object? get localBindAddress;
  int get localPort;
  int get remotePort;
  Duration get pingIntervall;
  Duration get timeout;
  bool get pingingSuccessfull;
  Stream<IncomingAudioPacket> get audio;
  Duration? get latency;

  void writePacket(AudioPacket packet);
  Stream<bool> useUdp({ResyncRequestHandler? onResyncRequest});
  void close();

  static Future<UdpTransport?> withRemoteHostLookup(
          {required PlatformOptions platformOptions,
          required CryptStateProvider cryptStateProvider,
          Duration? pingIntervall,
          Duration? timeout}) =>
      UdpTransportImpl.withRemoteHostLookup(
          platformOptions: platformOptions,
          cryptStateProvider: cryptStateProvider,
          pingIntervall: pingIntervall,
          timeout: timeout);
}
