import 'dart:async';
import 'dart:ffi';
import 'package:dumble/dumble.dart';
import 'dart:io';
import 'package:opus_dart/opus_dart.dart';
import 'dart:typed_data';
import 'audio.dart';

Future<void> main() async {
  DynamicLibrary dyn;
  if (Platform.isWindows) {
    dyn = new DynamicLibrary.open('C:/Users/Eric/Desktop/opus/libopus_x64.dll');
  } else {
    dyn = new DynamicLibrary.open('libopus.so');
  }
  initOpus(dyn);
  print(getOpusVersion());
  await send(recordAudio(channels: 1, rate: 48000), 48000, 1,
      'mumble.linux-power.de', 64754);
}

Future<void> send(Stream<List<int>> input, int sampleRate, int channels,
    String host, int port) async {
  ConnectionOptions options =
      new ConnectionOptions(host: host, port: port, name: 'Sender');
  MumbleClient client = new MumbleClient(options: options);
  await client.connect(onBadCertificate: (X509Certificate cert) => true);
  print('Sender connected to mumble');
  AudioFrameSink mumbleSink = client.audio.sendAudio(codec: AudioCodec.opus);
  StreamOpusEncoder encoder = new StreamOpusEncoder.bytes(
      sampleRate: sampleRate,
      channels: channels,
      frameTime: FrameTime.ms20,
      floatInput: false,
      application: Application.audio,
      fillUpLastFrame: true);
  input
      .cast<List<num>>()
      .transform(encoder)
      .map<AudioFrame>((Uint8List opus) => new AudioFrame(frame: opus))
      .pipe(mumbleSink);
}
