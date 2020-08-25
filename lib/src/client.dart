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

/// The id of the root channel of a Mumble server is always `0`.
const int rootChannelId = 0;

abstract class CryptStateProvider {
  CryptState get cryptState;
}

/// A client that handles all the communication with a Mumble server.
/// Register a [MumbleClientListener] to get notified on events!
abstract class MumbleClient
    implements Notifier<MumbleClientListener>, CryptStateProvider {
  ConnectionOptions get options;

  /// The info the connected server send, only availalbe while connected.
  ServerInfo get serverInfo;

  /// Indicates it a connection is ettablished to a server and the server state was synced with this client instance.
  /// This means that [selfe], [getChannels], and [getUsers] will work now.
  bool get synced;

  /// The object representing the user which belongs to this client.
  Selfe get selfe;

  /// The servers root channel.
  Channel get rootChannel => synced ? getChannels()[rootChannelId] : null;

  /// The audio client which can be used to transmitt audio. Only available if [synced].
  AudioClient get audio;

  /// Connects a mumble server.
  ///
  /// Every Mumble server provides a ssl certificate. If your local runtime does not trust this certificate,
  /// (e.g. selfe signed certificates) `onBadCertificate` is invoked with it. There you can decide, how to procceed.
  ///
  /// On default, it is tried to use udp for audio transmitting. You can disable this using `useUdp`.
  /// If using udp you can use `localUdpBindAddress` and `localUdpBindPort` to speficy how the clients
  /// udp peer should be created. Leave this null to listen on all interfaces using an ephemeral port.
  ///
  /// Connect must only be called once! If a disconnect happens, create a new client instance.
  Future<void> connect(
      {OnBadCertificate onBadCertificate,
      bool useUdp: true,
      dynamic localUdpBindAddress,
      int localUdpBindPort: 0});

  /// Closes the connection to a Mumble server.
  /// After closing, you should discard this client and create a new client object if you want to ettablish another connection.
  Future<void> close();

  ///Lists all [User]s connected to the Mumble server, mapped to their id, but does not include [selfe].
  Map<int, User> getUsers();

  /// Lists all [Channel]s in this Mumble server, mapped to their id.
  Map<int, Channel> getChannels();

  /// Sets the balist for this server.
  void setBanList(List<BanEntry> bans);

  /// Queries the banlist of this server and invokes [onBanListReceived] on all registered listeners if successfull.
  void queryBans();

  /// Requests a list of all registered users and invokes [onUserListReceived] on all registered listeners if successfull.
  void listUsers();

  /// Queries the ids of the users with the given names and invokes [onQueryUsersResult] on all registered listeners if successfull.
  void queryUsersByNames({@required List<String> names});

  /// Queries the names of the users with the given ids and invokes [onQueryUsersResult] on all registered listeners if successfull.
  void queryUsersByIds({@required List<int> ids});

  /// Sets new tokens for this connection. Tokens like passwords and used to enter password protected channels.
  void updateTokens({@required List<String> tokens});

  /// Creates a new channel. On success [onChannelAdded] will be invoked on all registered listeners.
  void createChannel(
      {@required String name,
      int position,
      int maxUsers,
      String description,
      bool temporary,
      Channel parent});

  /// Sends a [TextMessage] to users or channels.
  void sendMessage({@required TextMessage message});

  /// Register a [VoiceTarget] on the server to whisper it afterwards.
  void registerVoiceTarget({@required VoiceTarget target});

  /// Requests that the internal udp crypt state (the nonce) is resynced.
  void requestCryptStateResync();

  /// Creates a new client with the given [ConnectionOptions].
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

/// Readonly how the server is configured
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

/// Stats about the connection to the server
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
