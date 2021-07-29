import 'dart:async';
import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../utils/var_int.dart';
import '../messages.dart' as Messages;
import '../streams/protobuf_packet.dart';
import '../utils/utils.dart' show JsonString;
import '../model/audio.dart';
import '../exceptions.dart';

class AudioTunnelPacket extends ProtobufPacket {
  static final Uint8List _empty = new Uint8List(0);

  final AudioPacket packet;

  @override
  int get length => packet.lengthInBytes;

  @override
  void writeTo(StreamSink<List<int>> sink) {
    packet.writeTo(sink);
  }

  AudioTunnelPacket({required this.packet})
      : super(type: Messages.udpTunnel, data: _empty);
}

class PingPacket extends AudioPacket {
  final bool incoming;
  final int pingTimestamp;

  factory PingPacket.outgoing({required int pingTimestamp}) {
    return new PingPacket._(
        pingTimestamp: pingTimestamp,
        lengthInBytes: 1 + varIntSize(pingTimestamp),
        incoming: false);
  }

  const PingPacket._(
      {required this.pingTimestamp,
      required int lengthInBytes,
      required this.incoming})
      : super(lengthInBytes: lengthInBytes);

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    map['pingTimestamp'] = pingTimestamp;
    map['incoming'] = incoming;
    return map;
  }
}

class IncomingAudioPacket extends AudioPacket {
  final AudioCodec codec;
  final int target, sequenceNumber;
  final List<Uint8List> frames;
  final bool endOfTransmission;
  final PositionalInformation? positionalInformation;
  final int sessionId;

  const IncomingAudioPacket._(
      {required this.codec,
      required this.target,
      required this.sequenceNumber,
      required this.frames,
      required this.endOfTransmission,
      required this.sessionId,
      this.positionalInformation,
      required int lengthInBytes})
      : super(lengthInBytes: lengthInBytes);

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    map['codec'] = codec.toString();
    map['target'] = target;
    map['sessionId'] = sessionId;
    map['sequenceNumber'] = sequenceNumber;
    map['endOfTransmission'] = endOfTransmission;
    if (positionalInformation != null) {
      map['positionalInformation'] = positionalInformation.toString();
    }
    map['frameCount'] = frames.length;
    map['totalFramesSize'] = frames.fold<int>(
        0, (int size, Uint8List frame) => size + frame.lengthInBytes);
    return map;
  }
}

/// Returns either a [IncomingAudioPacket] or a [PingPacket].
@protected
AudioPacket decodeIncoming({required Uint8List data}) {
  ByteData bytes =
      data.buffer.asByteData(data.offsetInBytes, data.lengthInBytes);
  int msb = bytes.getUint8(0);
  int codecInt = (msb & 0xE0) >> 5;
  AudioCodec codec;
  if (0 <= codecInt && codecInt < AudioCodec.values.length) {
    codec = AudioCodec.values[codecInt];
  } else {
    throw new ProtocolException(
        'Bad data! Value $codecInt from msb (${msb.toRadixString(16)}) does not represent a valid codec!');
  }
  if (codec == AudioCodec.ping) {
    return new PingPacket._(
        pingTimestamp: bytes.getVarInt(1).value,
        lengthInBytes: bytes.lengthInBytes,
        incoming: true);
  } else {
    int target = msb & 0x1F;
    VarIntResult sessionId = bytes.getVarInt(1);
    VarIntResult sequenceNumber = bytes.getVarInt(1 + sessionId.lengthInBytes);
    int index = 1 + sessionId.lengthInBytes + sequenceNumber.lengthInBytes;
    bool eot = false;
    List<Uint8List> frames = <Uint8List>[];
    if (codec == AudioCodec.opus) {
      VarIntResult header = bytes.getVarInt(index);
      index += header.lengthInBytes;
      eot = (header.value & 0x2000) == 0x2000;
      int length = header.value & 0x1FFF;
      frames.add(bytes.buffer.asUint8List(bytes.offsetInBytes + index, length));
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
    PositionalInformation? pos;
    if (index < bytes.lengthInBytes) {
      pos = new PositionalInformation(
          x: bytes.getFloat32(index),
          y: bytes.getFloat32(index + 4),
          z: bytes.getFloat32(index + 8));
      index += 12;
    }
    return new IncomingAudioPacket._(
        codec: codec,
        target: target,
        sequenceNumber: sequenceNumber.value,
        frames: frames,
        endOfTransmission: eot,
        positionalInformation: pos,
        sessionId: sessionId.value,
        lengthInBytes: bytes.lengthInBytes);
  }
}

class OutgoingAudioPacket extends AudioPacket {
  final AudioCodec codec;
  final int target, sequenceNumber;
  final List<Uint8List> frames;
  final bool endOfTransmission;
  final PositionalInformation? positionalInformation;

  OutgoingAudioPacket(
      {required AudioCodec codec,
      int voiceTarget: normalTalking,
      required int sequenceNumber,
      required List<Uint8List> frames,
      required bool endOfTransmission,
      PositionalInformation? positionalInformation})
      : this.codec = assertNotPing(codec),
        this.target = voiceTarget,
        this.sequenceNumber = sequenceNumber,
        this.frames = frames,
        this.endOfTransmission = endOfTransmission,
        this.positionalInformation = positionalInformation,
        super(
            lengthInBytes: _calculateLength(codec, sequenceNumber, frames,
                endOfTransmission, positionalInformation));

  static int _calculateLength(
      AudioCodec codec,
      int sequenceNumber,
      List<Uint8List> frames,
      bool endOfTransmission,
      PositionalInformation? positionalInformation) {
    int lengthInBytes = 1 +
        varIntSize(sequenceNumber) +
        (positionalInformation == null ? 0 : 12);
    if (codec == AudioCodec.opus) {
      lengthInBytes += varIntSize(AudioPacket._opusHeader(
          endOfTransmission, frames.isNotEmpty ? frames.first : null));
      lengthInBytes += frames.isNotEmpty ? frames.first.lengthInBytes : 0;
    } else {
      lengthInBytes += (endOfTransmission ? 1 : 0);
      for (Uint8List frame in frames) {
        lengthInBytes = lengthInBytes + 1 + frame.lengthInBytes;
      }
    }
    return lengthInBytes;
  }

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    map['codec'] = codec.toString();
    map['target'] = target;
    map['sequenceNumber'] = sequenceNumber;
    map['endOfTransmission'] = endOfTransmission;
    if (positionalInformation != null) {
      map['positionalInformation'] = positionalInformation.toString();
    }
    map['frameCount'] = frames.length;
    map['totalFramesSize'] = frames.fold<int>(
        0, (int size, Uint8List frame) => size + frame.lengthInBytes);
    return map;
  }
}

//https://mumble-protocol.readthedocs.io/en/latest/voice_data.html
//https://web.cs.ucdavis.edu/~rogaway/ocb/ocb-faq.htm
//https://tools.ietf.org/html/rfc7253
abstract class AudioPacket with JsonString {
  final int lengthInBytes;

  const AudioPacket({required this.lengthInBytes});

  void writeTo(StreamSink<List<int>> sink) {
    int bytesWritten = _writeTo(sink, this);
    assert(bytesWritten == lengthInBytes);
  }

  static int _writeTo(StreamSink<List<int>> sink, AudioPacket packet) {
    int header;
    if (packet is PingPacket) {
      header = 0x20;
      ByteData bytes = new ByteData(packet.lengthInBytes);
      bytes.setUint8(0, header);
      bytes.setVarInt(1, packet.pingTimestamp);
      sink.add(bytes.buffer.asUint8List());
      return bytes.lengthInBytes;
    } else {
      AudioCodec codec;
      int target;
      bool incoming;
      int? sessionId; //only incomming
      int sequenceNumber;
      List<Uint8List> frames;
      bool endOfTransmission;
      PositionalInformation? positionalInformation;
      if (packet is OutgoingAudioPacket) {
        incoming = false;
        codec = packet.codec;
        target = packet.target;
        sequenceNumber = packet.sequenceNumber;
        frames = packet.frames;
        endOfTransmission = packet.endOfTransmission;
        positionalInformation = packet.positionalInformation;
      } else if (packet is IncomingAudioPacket) {
        incoming = true;
        sessionId = packet.sessionId;
        codec = packet.codec;
        target = packet.target;
        sequenceNumber = packet.sequenceNumber;
        frames = packet.frames;
        endOfTransmission = packet.endOfTransmission;
        positionalInformation = packet.positionalInformation;
      } else {
        throw new ProtocolException(
            'packet is not a OutgoingAudioPacket, IncomingAudioPacket or PingPacket!');
      }

      int bytesWritten = 0;
      if (codec == AudioCodec.celtAlpha) {
        header = 0x0;
      } else if (codec == AudioCodec.celtBeta) {
        header = 0x60;
      } else if (codec == AudioCodec.speex) {
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
      if (sessionId != null) {
        index += preFrames.setVarInt(index, sessionId);
      }
      index += preFrames.setVarInt(index, sequenceNumber);
      bytesWritten += index;
      sink.add(preFrames.buffer.asUint8List(0, index));
      bytesWritten += _writeAudioFrames(sink, codec, frames, endOfTransmission);
      if (positionalInformation != null) {
        ByteData posBuffer = new ByteData(12);
        posBuffer.setFloat32(0, positionalInformation.x);
        posBuffer.setFloat32(4, positionalInformation.y);
        posBuffer.setFloat32(8, positionalInformation.z);
        sink.add(posBuffer.buffer.asUint8List());
        bytesWritten += 12;
      }
      return bytesWritten;
    }
  }

  static int _opusHeader(bool endOfTransmission, Uint8List? frame) =>
      (endOfTransmission ? 0x2000 : 0) | ((frame?.lengthInBytes) ?? 0);

  static int _writeAudioFrames(StreamSink<List<int>> sink, AudioCodec codec,
      List<Uint8List> frames, bool endOfTransmission) {
    int bytesWritten = 0;
    if (codec == AudioCodec.opus) {
      int header = _opusHeader(
          endOfTransmission, frames.isNotEmpty ? frames.first : null);
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
