import 'package:meta/meta.dart';
import 'dart:async';
import 'listeners.dart';
import 'model/channel.dart';
import 'model/misc.dart';
import 'model/user.dart';
import 'client_base.dart';
import 'utils.dart' show JsonString;
import 'connection_options.dart';
import 'audio_client.dart';
import 'connection.dart' show OnBadCertificate;

const int rootChannelId = 0;

abstract class CryptStateProvider {
  CryptState get cryptState;
}

abstract class MumbleClient
    implements Notifier<MumbleClientListener>, CryptStateProvider {
  ConnectionOptions get options;

  ServerInfo get serverInfo;
  bool get synced;
  Selfe get selfe;
  Channel get rootChannel => synced ? getChannels()[rootChannelId] : null;
  AudioClient get audio;

  Future<void> connect(
      {OnBadCertificate onBadCertificate,
      bool useUdp: true,
      dynamic localUdpBindAddress,
      int localUdpBindPort: 0});

  Future<void> close();

  ///Does not include selfe
  Map<int, User> getUsers();
  Map<int, Channel> getChannels();

  void setBanList(List<BanEntry> bans);
  void queryBans();
  void listUsers();
  void queryUsersByNames({@required List<String> names});
  void queryUsersByIds({@required List<int> ids});
  void updateTokens({@required List<String> tokens});
  void createChannel(
      {@required String name,
      int position,
      int maxUsers,
      String description,
      bool temporary,
      Channel parent});
  void sendMessage({@required TextMessage message});
  void registerVoiceTarget({@required VoiceTarget target});
  void requestCryptStateResync();

  factory MumbleClient({@required ConnectionOptions options}) =>
      new MumbleClientBase(options: options);
}

enum RejectType {
  /// The rejection reason is unknown (details should be available in Reject.reason).
  none,

  /// The client attempted to connect with an incompatible version.
  wrongVersion,

  /// The user name supplied by the client was invalid.
  invalidUsername,

  /// The client attempted to authenticate as a user with a password but it was wrong.
  wrongUserPassword,

  /// The client attempted to connect to a passworded server but the password was wrong.
  wrongServerPassword,

  /// Supplied username is already in use.
  usernameInUse,

  /// Server is currently full and cannot accept more users.
  serverFull,

  /// The user did not provide a certificate but one is required.
  noCertificate,

  authenticatorFail
}

class RejectException implements Exception {
  final String reason;
  final RejectType rejectType;
  const RejectException({this.reason, this.rejectType});

  @override
  String toString() {
    String string = 'RejectException';
    if (rejectType != null) {
      string = string + ' ($rejectType)';
    }
    if (reason != null) {
      string = string + ': $reason';
    }
    return string;
  }
}

enum DenyType {
  /// Operation denied for other reason, see reason field.
  text,

  /// Permissions were denied.
  permission,

  /// Cannot modify SuperUser.
  superUser,

  /// Invalid channel name.
  channelName,

  /// Text message too long.
  textTooLong,

  /// The flux capacitor was spelled wrong.
  h9K,

  /// Operation not permitted in temporary channel.
  temporaryChannel,

  /// Operation requires certificate.
  missingCertificate,

  /// Invalid username.
  userName,

  /// Channel is full.
  channelFull,

  nestingLimit
}

class PermissionDeniedException implements Exception {
  final DenyType denyType;
  final Permission deniedPermission;
  final Channel channel;
  final User user;
  final String reason;
  final String invalidUserName;

  const PermissionDeniedException(
      {this.denyType,
      this.deniedPermission,
      this.channel,
      this.user,
      this.reason,
      this.invalidUserName});

  @override
  String toString() {
    String string =
        'PermissionDeniedException for user ${user.name} (session: ${user.session}) with reason $denyType';
    switch (denyType) {
      case DenyType.permission:
        string =
            '$string in channel ${channel.name} (id: ${channel.channelId}) and denied permission $deniedPermission';
        break;
      case DenyType.userName:
        string = '$string; tried using name $invalidUserName';
        break;
      default:
        break;
    }
    if (reason != null && reason.isNotEmpty) {
      string = '$string\r\nReason: $reason';
    }
    return string;
  }
}

abstract class ServerInfo with JsonString {
  int get suggestedOpusBitrate;
  int get maxBandwidth;
  String get welcomeText;
  VersionInformation get version;
  ServerConfig get config;
  ServerConnectionStats get connectionStats;
  ServerSuggestedClientConfig get suggestedClientConfig;
  ServerCodecVersion get codecVersion;

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['suggestedOpusBitrate'] = suggestedOpusBitrate
    ..['maxBandwidth'] = maxBandwidth
    ..['welcomeText'] = welcomeText
    ..['version'] = version?.jsonMap()
    ..['config'] = config?.jsonMap()
    ..['connectionStats'] = connectionStats?.jsonMap()
    ..['suggestedClientConfig'] = suggestedClientConfig?.jsonMap()
    ..['codecVersion'] = codecVersion?.jsonMap();
}

class ServerSuggestedClientConfig with JsonString {
  final int suggestedClientVersion;
  final bool usePositionalAudio;
  final bool usePushToTalk;

  const ServerSuggestedClientConfig(
      {this.suggestedClientVersion,
      this.usePositionalAudio,
      this.usePushToTalk});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['suggestedClientVersion'] = suggestedClientVersion
    ..['usePositionalAudio'] = usePositionalAudio
    ..['usePushToTalk'] = usePushToTalk;
}

class ServerConfig with JsonString {
  final bool allowHtml;
  final int maxMessageLength;
  final int maxImageMessageLength;
  final int maxUsers;
  const ServerConfig(
      {this.allowHtml,
      this.maxImageMessageLength,
      this.maxMessageLength,
      this.maxUsers});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['allowHtml'] = allowHtml
    ..['maxMessageLength'] = maxMessageLength
    ..['maxImageMessageLength'] = maxImageMessageLength
    ..['maxUsers'] = maxUsers;
}

class ServerConnectionStats with JsonString {
  final PacketStats packetStats;
  final int tcpPacketCount;
  final int udpPacketCount;
  final PingStats pingStats;

  const ServerConnectionStats(
      {this.packetStats,
      this.tcpPacketCount,
      this.udpPacketCount,
      this.pingStats});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['packetStats'] = packetStats?.jsonMap()
    ..['tcpPacketCount'] = tcpPacketCount
    ..['udpPacketCount'] = udpPacketCount
    ..['pingStats'] = pingStats;
}

class ServerCodecVersion with JsonString {
  final int celtAlphaVersion;
  final int celtBetaVersion;
  final bool preferAlpha;
  final bool opus;

  const ServerCodecVersion(
      {@required this.celtAlphaVersion,
      @required this.celtBetaVersion,
      @required this.preferAlpha,
      this.opus});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['celtAlphaVersion'] = celtAlphaVersion
    ..['celtBetaVersion'] = celtBetaVersion
    ..['preferAlpha'] = preferAlpha
    ..['opus'] = opus;
}

class ClientReuseError extends Error {
  ClientReuseError();

  @override
  String toString() =>
      'This client was already used (connect was called once). A MumbleClient can not be reused. Instantiate a new one instead.';
}
