import 'dart:async';
import 'listeners.dart';
import 'model/channel.dart';
import 'model/voice_target.dart';
import 'model/user.dart';
import 'client_base.dart';
import 'model/crypto.dart';
import 'connection_options.dart';
import 'audio/audio_client.dart';
import 'connection.dart' show OnBadCertificate;
import 'model/server_infos.dart';
import 'model/text_message.dart';
import 'model/ban.dart';
import 'model/stats.dart';
import 'utils/utils.dart' show JsonString;

/// The id of the root channel of a Mumble server is always `0`.
const int rootChannelId = 0;

mixin CryptStateProvider {
  CryptState get cryptState;
}

/// A client that handles all the communication with a Mumble server.
/// Register a [MumbleClientListener] to get notified on events.
abstract class MumbleClient
    implements Notifier<MumbleClientListener>, CryptStateProvider {
  /// The connection options used while this client was connected to a server.
  ConnectionOptions get options;

  /// The info the connected server send.
  ServerInfo get serverInfo;

  /// The object representing the user which belongs to this client.
  Self get self;

  /// The servers root channel
  Channel get rootChannel;

  /// The audio client which can be used to transmitt audio.
  AudioClient get audio;

  /// If this client is closed.
  ///
  /// If the client is closed, it will not do anything when calling a
  /// method on it or, nor will it invoke any more callbacks. Methods that
  /// have a return value and all properties will return the last known values,
  /// but should not be used anymore.
  bool get closed;

  /// Connects a mumble server.
  ///
  /// Every Mumble server provides a ssl certificate. If your local runtime does not trust this certificate,
  /// (e.g. self signed certificates) `onBadCertificate` is invoked with it. There you can decide, how to procceed.
  ///
  /// On default, it is tried to use udp for audio transmitting. You can disable this using `useUdp`.
  /// If using udp you can use `localUdpBindAddress` and `localUdpBindPort` to speficy how the clients
  /// udp peer should be created. Leave this `null` to listen on all interfaces and
  /// set localUdpBindPort to 0 to use an ephemeral port.
  ///
  /// A disconnected client can not be reconnected, so create a new client instance instead using this method.
  static Future<MumbleClient> connect(
      {required ConnectionOptions options,
      OnBadCertificate? onBadCertificate,
      bool useUdp: true,
      Object? localUdpBindAddress,
      int localUdpBindPort: 0}) {
    return MumbleClientBase.connect(
        options: options,
        onBadCertificate: onBadCertificate,
        useUdp: useUdp,
        localUdpBindAddress: localUdpBindAddress,
        localUdpBindPort: localUdpBindPort);
  }

  /// Closes the connection to a Mumble server.
  ///
  /// After closing, you should discard this client and create a new client object if you want to ettablish another connection.
  ///
  /// Calling this method will set [closed] to `true` immediately. For implications, see the property documentation.
  Future<void> close();

  ///Lists all [User]s connected to the Mumble server, mapped to their id, but does not include [self].
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
  void queryUsersByNames({required List<String> names});

  /// Queries the names of the users with the given ids and invokes [onQueryUsersResult] on all registered listeners if successfull.
  void queryUsersByIds({required List<int> ids});

  /// Sets new tokens for this connection. Tokens are like passwords and used to enter password protected channels.
  void updateTokens({required List<String> tokens});

  /// Creates a new channel. On success [onChannelAdded] will be invoked on all registered listeners.
  void createChannel(
      {required String name,
      int? position,
      int? maxUsers,
      String? description,
      bool? temporary,
      Channel? parent});

  /// Sends a [OutgoingTextMessage] to users or channels.
  void sendMessage({required OutgoingTextMessage message});

  /// Register a [VoiceTarget] on the server to whisper it afterwards.
  void registerVoiceTarget({required VoiceTarget target});

  /// Requests that the internal udp crypt state (the nonce) is resynced.
  void requestCryptStateResync();
}

/// All values will be [null] until they are received from the server.
abstract class ServerInfo with JsonString {
  VersionInformation? get version;
  ServerConfig? get config;
  ServerConnectionStats? get connectionStats;
  ServerSuggestedClientConfig? get suggestedClientConfig;
  ServerCodecVersion? get codecVersion;

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    if (version != null) {
      map['version'] = version!.jsonMap();
    }
    if (config != null) {
      map['config'] = config!.jsonMap();
    }
    if (connectionStats != null) {
      map['connectionStats'] = connectionStats!.jsonMap();
    }
    if (suggestedClientConfig != null) {
      map['suggestedClientConfig'] = suggestedClientConfig!.jsonMap();
    }
    if (codecVersion != null) {
      map['codecVersion'] = codecVersion!.jsonMap();
    }
    return map;
  }
}
