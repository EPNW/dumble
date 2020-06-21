import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'dart:async';

Completer<void> _stopPlayingCompleter;

bool _playing = false;
bool get playingFile => _playing;

Stream<Duration> playFile(String fileName, String workDir) async* {
  if (!_playing) {
    _playing = true;
    Process p = await Process.start(
        'ffplay', <String>['-autoexit', '-nodisp', fileName],
        workingDirectory: workDir);
    await for (String data in p.stderr
        .transform(systemEncoding.decoder)
        .transform(new LineSplitter())) {
      if (_stopPlayingCompleter != null) {
        break;
      } else if (data.contains('M-A:')) {
        Duration d = parseSeconds(data.trim().split(' ').first);
        if (d != null) {
          yield d;
        }
      }
    }
    p.kill();
    _playing = false;
    if (_stopPlayingCompleter != null) {
      Completer<void> tmp = _stopPlayingCompleter;
      _stopPlayingCompleter = null;
      tmp.complete();
    }
  }
}

Future<void> stopPlayingFile() async {
  if (_playing) {
    if (_stopPlayingCompleter == null) {
      _stopPlayingCompleter = new Completer<void>();
    }
    return await _stopPlayingCompleter.future;
  }
}

Duration parseSeconds(String secondsAndMs) {
  List<String> last = secondsAndMs.split('.');
  if (last.length == 2) {
    int seconds = int.tryParse(last[0]);
    int millis = int.tryParse((last[1].padRight(3, '0')));
    if (seconds == null || millis == null || seconds < 0) {
      return null;
    } else {
      return new Duration(seconds: seconds, milliseconds: millis);
    }
  } else {
    return null;
  }
}

enum Quantization { s8, s16le }

Future<IOSink> playRawStream(
    int sampleRate, int channels, Quantization quantization) async {
  String quant;
  switch (quantization) {
    case Quantization.s8:
      quant = 's8';
      break;
    case Quantization.s16le:
      quant = 's16le';
      break;
    default:
      throw new ArgumentError.notNull('quantization');
      break;
  }
  Process p = await Process.start('ffplay', <String>[
    //  '-noinfbuf', //TODO
    '-autoexit',
    '-nodisp',
    '-ac',
    channels.toString(),
    '-ar',
    sampleRate.toString(),
    '-f',
    quant,
    '-i',
    '-'
  ]);
  p.stderr.drain();
  p.stdout.drain();
  return p.stdin;
}

Stream<Uint8List> recordAudio(
    {Duration duration,
    String device,
    int rate: 44100,
    int channels: 1,
    Quantization quantization: Quantization.s16le}) async* {
  Process record;
  Stream<Uint8List> audio;
  if (Platform.isWindows) {
    //TODO fmedia buffer stuff, marked in config with #HERE
    List<String> params = <String>[
      '--record',
      '--rate=$rate',
      '--channels=$channels',
      '--out=@stdout.wav'
    ];
    if (quantization == Quantization.s16le) {
      params.add('--format=int16');
    } else if (quantization == Quantization.s8) {
      params.add('--format=int8');
    }
    if (duration != null) {
      params.add('--until=${duration.inSeconds}');
    }
    if (device != null) {
      params.add('--dev-capture=$device');
    }
    record = await Process.start('fmedia', params, runInShell: false);
    audio = record.stdout.skipBytes(44).cast<Uint8List>();
  } else {
    List<String> params = <String>[
      '--rate=$rate',
      '--channels=$channels',
      '--file-type=raw',
      //  '--buffer-time=10', //TODO adjust, this is in ms
    ];
    if (quantization == Quantization.s16le) {
      params.add('--format=S16_LE');
    } else if (quantization == Quantization.s8) {
      params.add('--format=S8');
    }
    if (duration != null) {
      params.add('--duration=${duration.inSeconds}');
    }
    if (device != null) {
      params.add('--device=$device');
    }
    params.add('-');
    record = await Process.start('arecord', params, runInShell: false);
    audio = record.stdout.cast<Uint8List>();
  }
  record.stdin.close();
  record.stderr.drain();
  yield* audio;
}

extension SkipBytes on Stream<List<int>> {
  Stream<List<int>> skipBytes(int nBytes) async* {
    await for (List<int> bytes in this) {
      if (nBytes != 0) {
        if (bytes.length <= nBytes) {
          nBytes -= bytes.length;
        } else {
          if (bytes is Uint8List) {
            yield bytes.buffer.asUint8List(
                nBytes + bytes.offsetInBytes, bytes.lengthInBytes - nBytes);
            nBytes = 0;
          } else {
            yield bytes.sublist(nBytes);
            nBytes = 0;
          }
        }
      } else {
        yield bytes;
      }
    }
  }
}
