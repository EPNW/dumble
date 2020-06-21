import 'dart:async';
import 'dart:io';
import 'dart:convert' show base64;

//import 'package:dumble/src/audio_client.dart';
//import 'package:dumble/src/utils.dart';

import '../lib/src/var_int.dart';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:dumble/dumble.dart';

import '../../opus_dart/test/test.dart' as opus;

void main() async {
  await anotherTest();
}

Future<void> anotherTest() async {
  opus.init();
  String pw = 'dart';
  List<int> fullChain = await new File('cert.p12').readAsBytes();
  bool su = false;
  ConnectionOptions options = new ConnectionOptions(
      // clientCertificate: fullChain,
      // clientCertificateStorePassword: pw,
      host: 'mumble.linux-power.de',
      port: 64754,
      opus: true,
      name: 'Dart',
      password: null);
  MumbleClient client = new MumbleClient(options: options);
  ExampleListener listener = new ExampleListener(client);
  client.add(listener);
  await client.connect(
      onBadCertificate: (X509Certificate cert) => true, useUdp: true);
  await new Future.delayed(const Duration(seconds: 10));
  //client.selfe.registerUser();
  await new Future.delayed(const Duration(seconds: 600));
  print('Closing');
  await client.close();
  print('Closed');
  // print(client.serverInfo);
}

class ExampleListener
    with ChannelListener, MumbleClientListener, UserListener, AudioListener {
  final MumbleClient client;
  ExampleListener(this.client);

  @override
  void onChannelAdded(Channel channel) {
    print('Channel added ${channel.name}');
  }

  @override
  void onSynced() async {
    print('Synced! Hello ${client.selfe.name}!');
    client.getChannels().values.forEach((Channel c) => c.add(this));
    client.getUsers().values.forEach((User u) => u.add(this));
    client.audio.add(this);
    client.selfe.add(this);
    client.selfe.setComment(
        comment:
            'Ich bin ein Bot um die Mumble Client Implemenitierung in der Programmierstprache Dart zu testen.');
    Channel protected = client
        .getChannels()
        .values
        .firstWhere((Channel c) => c.name == 'Protected', orElse: () => null);
    client.selfe.moveToChannel(channel: client.rootChannel);
    client.selfe.requestUserStats();
    client.getUsers().values.forEach((User u) => u.requestUserStats());
  }

  @override
  void onTextMessage(TextMessage message) {
    User actor = message.actor;
    print('${actor?.name}: ${message.message}');
    actor.sendMessageToUser(message: 'Selber ${message.message}');
  }

  @override
  void onUserAdded(User user) {
    print('New user ${user.name}');
    user.add(this);
  }

  @override
  void onDone() {
    print('Done');
  }

  @override
  void onError(error, [StackTrace stackTrace]) {
    print(error);
  }

  @override
  void onChannelChanged(Channel channel, ChannelChanges changes) {
    print('Channel changes: $changes');
  }

  @override
  void onChannelRemoved(Channel channel) {
    // TODO: implement onChannelRemoved
  }

  @override
  void onUserChanged(User user, User actor, UserChanges changes) {
    // print('User changes: $changes');
  }

  @override
  void onUserRemoved(User user, User actor, String reason, bool ban) {
    // TODO: implement onUserRemoved
  }

  @override
  void onUserStats(User user, UserStats stats) {
    print('Stats for ${user.name}');
    print(stats);
  }

  @override
  onCryptStateChanged() {
    print('CryptState!');
  }

  @override
  Future<void> onAudioReceived(Stream<AudioFrame> voiceData, AudioCodec codec,
      User speaker, TalkMode talkMode) async {
    print('Incoming transmission ($talkMode) from ${speaker.name}');
	//Send it back
    voiceData.pipe(client.audio.sendAudio(codec: codec));
  }

  @override
  void onChannelPermissionsReceived(Channel channel, Permission permission) {
    // TODO: implement onChannelPermissionsReceived
  }

  @override
  void onDropAllChannelPermissions() {
    // TODO: implement onDropAllChannelPermissions
  }

  @override
  void onBanListReceived(List<BanEntry> bans) async {}

  @override
  void onQueryUsersResult(Map<int, String> idToName) {
    // TODO: implement onQueryUsersResult
  }

  @override
  void onUserListReceived(List<RegisteredUser> users) {
    // TODO: implement onUserListReceived
  }
}