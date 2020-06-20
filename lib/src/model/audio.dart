import 'package:meta/meta.dart';

const int normalTalking = 0;

enum AudioCodec { celtAlpha, celtBeta, speex, opus }

enum TalkMode { normal, whisperToChannel, whisperToUser }

class PositionalInformation {
  final double x, y, z;

  const PositionalInformation(
      {@required this.x, @required this.y, @required this.z});

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
