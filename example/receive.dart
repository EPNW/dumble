import 'dart:async';
import 'dart:ffi';
import 'package:dumble/dumble.dart';
import 'dart:io';
import 'package:opus_dart/opus_dart.dart';
import 'audio.dart';
import 'dart:typed_data';

Future<void> main() async {
  DynamicLibrary dyn;
  if (Platform.isWindows) {
    dyn = new DynamicLibrary.open('C:/Users/Eric/Desktop/opus/libopus_x64.dll');
  } else {
    dyn = new DynamicLibrary.open('libopus.so');
  }
  initOpus(dyn);
  print(getOpusVersion());
  await receive(48000, 1, 'mumble.linux-power.de', 64754);
}

Future<void> receive(int sampleRate, int channels, String host, int port) async {
  Future<IOSink> sink = warmUp(
      playRawStream(sampleRate, channels, Quantization.s16le),
      20,
      sampleRate,
      channels,
      Quantization.s16le);

  ConnectionOptions options =
      new ConnectionOptions(host: host, port: port, name: 'Receiver');
  MumbleClient client = new MumbleClient(options: options);
  await client.connect(
      onBadCertificate: (X509Certificate cert) => true);
  client.audio.add(new SimpleAudioListener(sampleRate, channels, await sink));
  print('Receiver connected to mumble');
}

Uint8List _emptyFrame(
    int sampleRate, int channels, Quantization quantization, int durationMs) {
  int samplesPerSecond =
      (sampleRate * channels * (quantization == Quantization.s16le ? 2 : 1));
  Uint8List frame = new Uint8List(samplesPerSecond ~/ 1000 * durationMs);
  frame[1] = 1;
  return frame;
}

Future<IOSink> warmUp(FutureOr<IOSink> sink, int expectedFrameTime,
    int sampleRate, int channels, Quantization quantization) async {
  IOSink io = await sink;
  Uint8List emptyFrame = _emptyFrame(sampleRate, channels, quantization, 20);
  for (int warmUp = 0; warmUp < 100; warmUp++) {
    io.add(emptyFrame);
    await io.flush();
  }
  return io;
}

class SimpleAudioListener with AudioListener {
  final int sampleRate;
  final int channels;

  final IOSink output;

  SimpleAudioListener(this.sampleRate, this.channels, this.output);

  @override
  Future<void> onAudioReceived(Stream<AudioFrame> voiceData, AudioCodec codec,
      User speaker, TalkMode talkMode) async {
    if (codec == AudioCodec.opus) {
      String mode = talkMode == TalkMode.normal
          ? 'talking'
          : ('whispering to' +
              (talkMode == TalkMode.whisperToChannel ? 'channel' : 'you'));
      print('${speaker.name} started $mode');
      Stream<List<int>> pcm = voiceData
          .map((AudioFrame frame) {
            return frame.frame;
          })
          .transform(new StreamOpusDecoder.bytes(
              floatOutput: false, sampleRate: sampleRate, channels: channels))
          .cast<List<int>>();
      await for (List<int> bytes in pcm) {
        output.add(bytes);
        await output.flush();
      }
      print('${speaker.name} stopped $mode');
    } else {
      print('Unsupported audio codec $codec');
    }
  }
}
