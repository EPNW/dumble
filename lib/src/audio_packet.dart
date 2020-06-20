import 'dart:async';
import 'dart:typed_data';

import 'package:meta/meta.dart';

import 'var_int.dart';
import 'messages.dart' as Messages;
import 'streams/protobuf_packet.dart';
import 'utils.dart' show JsonString;
import 'model/audio.dart';

class AudioPacketType {
  static const AudioPacketType celtAlpha =
      const AudioPacketType._(0, AudioCodec.celtAlpha);
  static const AudioPacketType ping = const AudioPacketType._(1, null);
  static const AudioPacketType speex =
      const AudioPacketType._(2, AudioCodec.speex);
  static const AudioPacketType celtBeta =
      const AudioPacketType._(3, AudioCodec.celtBeta);
  static const AudioPacketType opus =
      const AudioPacketType._(4, AudioCodec.opus);

  static const List<AudioPacketType> _types = <AudioPacketType>[
    celtAlpha,
    ping,
    speex,
    celtBeta,
    opus
  ];
  static AudioPacketType of(int value) => _types[value];

  static AudioPacketType fromCodec(AudioCodec codec) {
    switch (codec) {
      case AudioCodec.celtAlpha:
        return celtAlpha;
      case AudioCodec.celtBeta:
        return celtBeta;
      case AudioCodec.speex:
        return speex;
      case AudioCodec.opus:
        return opus;
    }
    return null;
  }

  final AudioCodec codec;
  final int value;
  const AudioPacketType._(this.value, this.codec);

  @override
  bool operator ==(dynamic other) =>
      other is AudioPacketType && other.value == this.value;

  @override
  int get hashCode => value;

  @override
  String toString() {
    if (this == AudioPacketType.celtAlpha) {
      return 'AudioPacketType.celtAlpha';
    } else if (this == AudioPacketType.celtBeta) {
      return 'AudioPacketType.celtBeta';
    } else if (this == AudioPacketType.speex) {
      return 'AudioPacketType.speex';
    } else if (this == AudioPacketType.opus) {
      return 'AudioPacketType.opus';
    } else {
      return 'Invalid AudioPacketType!';
    }
  }
}

class AudioTunnelPacket extends ProtobufPacket {
  final AudioPacket packet;

  @override
  int get length => packet.lengthInBytes;

  @override
  void writeTo(StreamSink<List<int>> sink) {
    packet.writeTo(sink);
  }

  AudioTunnelPacket({@required this.packet})
      : super(type: Messages.udpTunnel, data: null);
}

//https://mumble-protocol.readthedocs.io/en/latest/voice_data.html
//https://web.cs.ucdavis.edu/~rogaway/ocb/ocb-faq.htm
//https://tools.ietf.org/html/rfc7253
class AudioPacket with JsonString {
  final AudioPacketType type;
  final int target, sequenceNumber;
  final List<Uint8List> frames;
  final bool endOfTransmission;
  final PositionalInformation positionalInformation;
  final int sessionId;
  final bool incoming;
  final int pingTimestamp;
  final int lengthInBytes;

  const AudioPacket._(
      {@required this.type,
      @required this.target,
      @required this.sequenceNumber,
      @required this.frames,
      @required this.endOfTransmission,
      @required this.positionalInformation,
      @required this.sessionId,
      @required this.incoming,
      @required this.pingTimestamp,
      @required this.lengthInBytes});

  factory AudioPacket.ping({@required int pingTimestamp}) {
    return new AudioPacket._ping(
        pingTimestamp: pingTimestamp,
        lengthInBytes: 1 + varIntSize(pingTimestamp),
        incoming: false);
  }

  const AudioPacket._ping(
      {@required this.pingTimestamp,
      @required this.lengthInBytes,
      @required this.incoming})
      : this.type = AudioPacketType.ping,
        this.target = null,
        this.sessionId = null,
        this.sequenceNumber = null,
        this.frames = null,
        this.endOfTransmission = null,
        this.positionalInformation = null;

  factory AudioPacket.incoming({@required Uint8List data}) {
    ByteData bytes =
        data.buffer.asByteData(data.offsetInBytes, data.lengthInBytes);
    int msb = bytes.getUint8(0);
    AudioPacketType type = AudioPacketType.of((msb & 0xE0) >> 5);
    if (type == AudioPacketType.ping) {
      return new AudioPacket._ping(
          pingTimestamp: bytes.getVarInt(1).value,
          lengthInBytes: bytes.lengthInBytes,
          incoming: true);
    } else {
      int target = msb & 0x1F;
      VarIntResult sessionId = bytes.getVarInt(1);
      VarIntResult sequenceNumber =
          bytes.getVarInt(1 + sessionId.lengthInBytes);
      int index = 1 + sessionId.lengthInBytes + sequenceNumber.lengthInBytes;
      bool eot = false;
      List<Uint8List> frames = new List<Uint8List>();
      if (type == AudioPacketType.opus) {
        VarIntResult header = bytes.getVarInt(index);
        index += header.lengthInBytes;
        eot = (header.value & 0x2000) == 0x2000;
        int length = header.value & 0x1FFF;
        frames
            .add(bytes.buffer.asUint8List(bytes.offsetInBytes + index, length));
        index += length;
      } else {
        bool hasNext = true;
        while (hasNext) {
          int header = bytes.getUint8(index);
          hasNext = (header & 0x80) == 0x80;
          index++;
          int length = header & 0x7F;
          if (length > 0) {
            frames.add(
                bytes.buffer.asUint8List(bytes.offsetInBytes + index, length));
            index += length;
          } else {
            eot = true;
          }
        }
      }
      PositionalInformation pos;
      if (index < bytes.lengthInBytes) {
        pos = new PositionalInformation(
            x: bytes.getFloat32(index),
            y: bytes.getFloat32(index + 4),
            z: bytes.getFloat32(index + 8));
        index += 12;
      }
      return new AudioPacket._(
          type: type,
          target: target,
          sequenceNumber: sequenceNumber.value,
          frames: frames,
          endOfTransmission: eot,
          positionalInformation: pos,
          sessionId: sessionId.value,
          incoming: true,
          pingTimestamp: null,
          lengthInBytes: bytes.lengthInBytes);
    }
  }

  factory AudioPacket.outgoing(
      {@required AudioPacketType type,
      int voiceTarget: normalTalking,
      @required int sequenceNumber,
      @required List<Uint8List> frames,
      @required bool endOfTransmission,
      PositionalInformation positionalInformation}) {
    int lengthInBytes = 1 +
        varIntSize(sequenceNumber) +
        (positionalInformation == null ? 0 : 12);
    if (type == AudioPacketType.opus) {
      lengthInBytes +=
          varIntSize(_opusHeader(endOfTransmission, frames.first)) +
              ((frames.first?.lengthInBytes) ?? 0);
    } else {
      lengthInBytes += (endOfTransmission ? 1 : 0);
      for (Uint8List frame in frames) {
        lengthInBytes = lengthInBytes + 1 + frame.lengthInBytes;
      }
    }
    return new AudioPacket._(
        type: type,
        target: voiceTarget,
        sequenceNumber: sequenceNumber,
        frames: frames,
        endOfTransmission: endOfTransmission,
        positionalInformation: positionalInformation,
        sessionId: null,
        incoming: false,
        pingTimestamp: null,
        lengthInBytes: lengthInBytes);
  }

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    map['type'] = type.toString();
    map['incoming'] = incoming;
    if (type == AudioPacketType.ping) {
      map['timestamp'] = pingTimestamp;
    } else {
      if (incoming) {
        map['sessionId'] = sessionId;
      }
      map['target'] = target;
      map['sequenceNumber'] = sequenceNumber;
      map['endOfTransmission'] = endOfTransmission;
      if (positionalInformation != null) {
        map['positionalInformation'] = positionalInformation.toString();
      }
      map['frameCount'] = frames.length;
      map['totalFramesSize'] = frames.fold<int>(
          0, (int size, Uint8List frame) => size + frame.lengthInBytes);
    }
    return map;
  }

  void writeTo(StreamSink<List<int>> sink) {
    int header;
    if (type == AudioPacketType.ping) {
      header = 0x20;
      ByteData bytes = new ByteData(lengthInBytes);
      bytes.setUint8(0, header);
      bytes.setVarInt(1, pingTimestamp);
      sink.add(bytes.buffer.asUint8List());
    } else {
      int bytesWritten = 0;
      if (type == AudioPacketType.celtAlpha) {
        header = 0x0;
      } else if (type == AudioPacketType.celtBeta) {
        header = 0x60;
      } else if (type == AudioPacketType.speex) {
        header = 0x40;
      } else {
        //opus
        header = 0x80;
      }
      header = header | target;
      int index = 0;
      ByteData preFrames =
          new ByteData(1 + maxVarIntSize + (incoming ? maxVarIntSize : 0));
      preFrames.setUint8(index, header);
      index++;
      if (incoming) {
        index += preFrames.setVarInt(index, sessionId);
      }
      index += preFrames.setVarInt(index, sequenceNumber);
      bytesWritten += index;
      sink.add(preFrames.buffer.asUint8List(0, index));
      bytesWritten += _writeAudioFrames(sink);
      if (positionalInformation != null) {
        ByteData posBuffer = new ByteData(12);
        posBuffer.setFloat32(0, positionalInformation.x);
        posBuffer.setFloat32(4, positionalInformation.y);
        posBuffer.setFloat32(8, positionalInformation.z);
        sink.add(posBuffer.buffer.asUint8List());
        bytesWritten += 12;
      }
      assert(bytesWritten == lengthInBytes);
    }
  }

  static int _opusHeader(bool endOfTransmission, Uint8List frame) =>
      (endOfTransmission ? 0x2000 : 0) | ((frame?.lengthInBytes) ?? 0);

  int _writeAudioFrames(StreamSink<List<int>> sink) {
    int bytesWritten = 0;
    if (type == AudioPacketType.opus) {
      int header = _opusHeader(endOfTransmission, frames.first);
      ByteData bytes = new ByteData(2);
      int len = bytes.setVarInt(0, header);
      sink.add(bytes.buffer.asUint8List(0, len));
      bytesWritten += len;
      if (frames.isNotEmpty) {
        sink.add(frames.first);
        bytesWritten += frames.first.lengthInBytes;
      }
    } else {
      for (int i = 0; i < frames.length; i++) {
        bool last = i == (frames.length - 1);
        Uint8List frame = frames[i];
        Uint8List header = new Uint8List(1);
        header[0] = (last ? 0x0 : 0x80) | frame.lengthInBytes;
        sink.add(header);
        sink.add(frame);
        bytesWritten = bytesWritten + 1 + frame.lengthInBytes;
      }
      if (endOfTransmission) {
        sink.add(new Uint8List(1));
        bytesWritten++;
      }
    }
    return bytesWritten;
  }
}
