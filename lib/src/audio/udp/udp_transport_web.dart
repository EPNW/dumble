import 'package:dumble/src/audio/audio_packet.dart';

import 'udp_transport.dart';
import '../../client.dart' show CryptStateProvider;
import '../../platform/platform_options.dart';

const String _notOnWeb = 'This operation is not supported on web platforms!';

class UdpTransportImp extends UdpTransport {
  static Future<UdpTransport?> withRemoteHostLookup(
      {required PlatformOptions platformOptions,
      required CryptStateProvider cryptStateProvider,
      Duration? pingIntervall,
      Duration? timeout}) async {
    return null;
  }

  @override
  Stream<IncomingAudioPacket> get audio =>
      throw new UnsupportedError(_notOnWeb);

  @override
  void close() => throw new UnsupportedError(_notOnWeb);

  @override
  Duration? get latency => throw new UnsupportedError(_notOnWeb);

  @override
  Object? get localBindAddress => throw new UnsupportedError(_notOnWeb);

  @override
  int get localPort => throw new UnsupportedError(_notOnWeb);

  @override
  Duration get pingIntervall => throw new UnsupportedError(_notOnWeb);

  @override
  bool get pingingSuccessfull => throw new UnsupportedError(_notOnWeb);

  @override
  String get remoteHost => throw new UnsupportedError(_notOnWeb);

  @override
  int get remotePort => throw new UnsupportedError(_notOnWeb);

  @override
  Duration get timeout => throw new UnsupportedError(_notOnWeb);

  @override
  Stream<bool> useUdp({ResyncRequestHandler? onResyncRequest}) =>
      throw new UnsupportedError(_notOnWeb);
  @override
  void writePacket(AudioPacket packet) => throw new UnsupportedError(_notOnWeb);
}
