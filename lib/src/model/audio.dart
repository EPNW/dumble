const int normalTalking = 0;

enum AudioCodec { celtAlpha, ping, speex, celtBeta, opus }

AudioCodec assertNotPing(AudioCodec codec) {
  if (codec == AudioCodec.ping) {
    throw new ArgumentError('A real AudioCodec is expected at this point, which AudioCodec.ping is not!');
  } else {
    return codec;
  }
}

enum TalkMode { normal, whisperToChannel, whisperToUser, proxyListen }

class PositionalInformation {
  final double x, y, z;

  const PositionalInformation({required this.x, required this.y, required this.z});

  operator [](int index) {
    switch (index) {
      case 1:
        return x;
      case 2:
        return y;
      case 3:
        return z;
      default:
        throw new IndexError(index, this, null, null, 3);
    }
  }

  @override
  String toString() {
    return 'PositionalInformation ($x, $y, $z)';
  }
}
