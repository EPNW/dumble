import 'send.dart';
import 'receive.dart';
import 'dart:ffi';
import 'package:opus_dart/opus_dart.dart';
import 'dart:io';
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
  String host = 'mumble.linux-power.de';
  int port = 64754;
  receive(48000, 1, host, port);
  await send(
     recordAudio(channels: 1,rate: 48000), 48000, 1, host, port);
  print('Done');
}
