import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:dumble/dumble.dart';
import 'package:dumble_examples/connection_options.dart';
import 'package:opus_dart/opus_dart.dart';

Future<void> main() async {
  // We are going to use opus_dart so init it
  // Put in your own opus path here
  // Quick note on casting to dynamic: since opus_dart supports web as of version
  // 3.0.0, this cast may be necessary if your IDE analyzer gives a warning.
  // At runtime, types will match.
  initOpus(new DynamicLibrary.open('libopus_x64.dll') as dynamic);
  //Connect to a mumble server
  MumbleClient client = await MumbleClient.connect(
      options: defaultConnectionOptions,
      platformOptions: defaultPlatformOptions);
  client.audio.add(new SaveToFileAudioListener());
  await new Future.delayed(
      const Duration(seconds: 5)); // Wait a few seconds before we start talking
  StreamOpusEncoder<int> encoder = StreamOpusEncoder.bytes(
      frameTime: frameTime,
      floatInput: false,
      sampleRate: inputSampleRate,
      channels: channels,
      application: Application.voip);
  AudioFrameSink audioOutput = client.audio.sendAudio(codec: AudioCodec.opus);
  await simulateAudioRecording() // This simulates recording by reading from a file
      .transform(encoder)
      // We need to wait since reading from a file is "faster than realtime".
      .transform(new WaitingTransformer(frameTimeMs))
      .map((Uint8List audioBytes) => new AudioFrame.outgoing(frame: audioBytes))
      .pipe(audioOutput);
}

const int inputSampleRate = 8000;
const int frameTimeMs = 40; // use frames of 40ms
const FrameTime frameTime = FrameTime.ms40;
const int outputSampleRate = 48000;
const int channels = 1;

Stream<List<int>> simulateAudioRecording() async* {
  // 0_8000_1_s16le contains pcm audio with a sample rate of 8000hz, one channel, in s16le format.
  // We will now simulate audio recording by reading this file and split it into audio frames of frameTimeMs.
  int frameByteSize = (inputSampleRate ~/ 1000) *
      frameTimeMs *
      channels *
      2; //2 because s16le takes two bytes per sample
  Uint8List? buffer;
  int bufferIndex = 0;
  await for (Uint8List bytes
      in new File('./assets/0_8000_1_s16le.raw').openRead().cast<Uint8List>()) {
    int consumed = 0;
    while (consumed < bytes.length) {
      if (buffer == null && frameByteSize <= (bytes.length - consumed)) {
        yield bytes.buffer.asUint8List(consumed, frameByteSize);
        consumed += frameByteSize;
      } else if (buffer == null) {
        buffer = new Uint8List(frameByteSize);
        bufferIndex = 0;
      } else {
        int read = min(frameByteSize - bufferIndex, bytes.length - consumed);
        buffer.setRange(bufferIndex, bufferIndex + read, bytes, consumed);
        consumed += read;
        bufferIndex += read;
        if (bufferIndex == frameByteSize) {
          yield buffer;
          buffer = null;
        }
      }
    }
  }
}

class SaveToFileAudioListener with AudioListener {
  SaveToFileAudioListener() {
    new Directory('./recordings').createSync(recursive: true);
  }

  @override
  void onAudioReceived(Stream<AudioFrame> voiceData, AudioCodec codec,
      User? speaker, TalkMode talkMode) {
    String target = talkMode == TalkMode.normal
        ? 'talking to ${speaker?.channel.channelId}'
        : ' whispering';
    print('${speaker?.name} started ${target}.');
    if (codec == AudioCodec.opus) {
      File targetFile = new File(
          './recordings/${speaker?.name}_${new DateTime.now().millisecondsSinceEpoch}_.wav');
      IOSink output = targetFile.openWrite();
      output.write(
          new Uint8List(wavHeaderSize)); // Reserve space for a wav header
      // Create an opus stream decoder
      StreamOpusDecoder decoder = new StreamOpusDecoder.bytes(
          floatOutput: false, sampleRate: outputSampleRate, channels: channels);
      voiceData
          .map<Uint8List>((AudioFrame frame) =>
              frame.frame) //we are only interested in the bytes
          .cast<Uint8List?>()
          .transform(decoder)
          .cast<List<int>>()
          .pipe(output)
          .then((_) async {
        await output.close();
        await writeWavHeader(targetFile);
        print('${speaker?.name} stopped ${target}.');
      });
    } else {
      print('But we don\'t know how do decode $codec');
    }
  }
}

const int wavHeaderSize = 44;

Future<void> writeWavHeader(File file) async {
  RandomAccessFile r = await file.open(mode: FileMode.append);
  await r.setPosition(0);
  await r.writeFrom(wavHeader(
      channels: channels,
      sampleRate: outputSampleRate,
      fileSize: await file.length()));
}

Uint8List wavHeader(
    {required int sampleRate, required int channels, required int fileSize}) {
  const int sampleBits = 16; //We know this since we used opus
  const Endian endian = Endian.little;
  final int frameSize = ((sampleBits + 7) ~/ 8) * channels;
  ByteData data = new ByteData(wavHeaderSize);
  data.setUint32(4, fileSize - 4, endian);
  data.setUint32(16, 16, endian);
  data.setUint16(20, 1, endian);
  data.setUint16(22, channels, endian);
  data.setUint32(24, sampleRate, endian);
  data.setUint32(28, sampleRate * frameSize, endian);
  data.setUint16(30, frameSize, endian);
  data.setUint16(34, sampleBits, endian);
  data.setUint32(40, fileSize - 44, endian);
  Uint8List bytes = data.buffer.asUint8List();
  bytes.setAll(0, ascii.encode('RIFF'));
  bytes.setAll(8, ascii.encode('WAVE'));
  bytes.setAll(12, ascii.encode('fmt '));
  bytes.setAll(36, ascii.encode('data'));
  return bytes;
}

class WaitingTransformer<T> extends StreamTransformerBase<T, T> {
  final int waitTimeMs;
  WaitingTransformer(this.waitTimeMs);

  // Don't use Future.delayed here since it is inprecise
  @override
  Stream<T> bind(Stream<T> stream) {
    Timer? t;
    StreamController<T> controller =
        new StreamController<T>(onCancel: t?.cancel, sync: true);
    stream.toList().then((List<T> data) {
      if (!controller.isClosed && data.isNotEmpty) {
        controller.add(data[0]);
        if (data.length > 1) {
          int index = 1;
          t = new Timer.periodic(new Duration(milliseconds: waitTimeMs),
              (Timer t) {
            if (t.isActive) {
              controller.add(data[index]);
              index++;
              if (index == data.length) {
                t.cancel();
                controller.close();
              }
            }
          });
        }
      }
    });
    return controller.stream;
  }
}
