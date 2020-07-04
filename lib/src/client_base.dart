import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:fixnum/fixnum.dart' as Fixnum;
import 'package:protobuf/protobuf.dart';

import 'connection.dart';
import 'generated/Mumble.pb.dart' as Proto;
import 'connection_options.dart' as ConnectionOptions;
import 'utils.dart' as Utils;
import 'messages.dart' as Messages;
import 'dart:async';
import 'client.dart';
import 'model/channel.dart';
import 'model/misc.dart';
import 'model/user.dart';
import 'listeners.dart';
import 'audio_packet.dart';
import 'audio_client.dart';
import 'streams/protobuf_packet.dart';

int _channelToId(Channel channel) => channel.channelId;
int _userToId(User user) => user.session;

class ServerInfoBase extends ServerInfo {
  int _suggestedOpusBitrate;
  @override
  int get suggestedOpusBitrate => _suggestedOpusBitrate;

  int _maxBandwidth;
  @override
  int get maxBandwidth => _maxBandwidth;

  String _welcomeText;
  @override
  String get welcomeText => _welcomeText;

  VersionInformation _version;
  @override
  VersionInformation get version => _version;

  ServerConfig _config;
  @override
  ServerConfig get config => _config;

  ServerConnectionStats _connectionStats;
  @override
  ServerConnectionStats get connectionStats => _connectionStats;

  ServerSuggestedClientConfig _suggestedClientConfig;
  @override
  ServerSuggestedClientConfig get suggestedClientConfig =>
      _suggestedClientConfig;

  ServerCodecVersion _codecVersion;
  @override
  ServerCodecVersion get codecVersion => _codecVersion;

  ServerInfoBase._();
}

class MumbleClientBase with Notifier<MumbleClientListener>, MumbleClient {
  final Map<int, User> _users;
  final Map<int, Channel> _channels;
  final Connection _connection;

  final ConnectionOptions.ConnectionOptions options;

  DateTime _lastMessageReceived;

  AudioClientBase _audio;
  @override
  AudioClient get audio => _audio;

  CryptState _cryptState;
  @override
  CryptState get cryptState => _cryptState;

  Selfe _selfe;
  @override
  Selfe get selfe => _selfe;

  Completer<void> _pinging;

  final ServerInfoBase _serverInfo;
  @override
  ServerInfo get serverInfo => synced ? _serverInfo : null;

  bool _synced;
  @override
  bool get synced => _synced ?? false;

  bool _used;

  MumbleClientBase({@required this.options})
      : this._connection = new Connection(
            host: options.host, port: options.port, context: options.context),
        this._channels = new Map<int, Channel>(),
        this._users = new Map<int, User>(),
        this._serverInfo = new ServerInfoBase._(),
        this._used = false,
        super();

  Future<void> _pingRoutine() async {
    _pinging = new Completer<void>();
    while (!_pinging.isCompleted) {
      _connection.writeMessage(new Proto.Ping()
        ..timestamp =
            new Fixnum.Int64(new DateTime.now().millisecondsSinceEpoch));
      await Future.any(<Future>[
        new Future.delayed(const Duration(seconds: 15)),
        _pinging.future
      ]);
      if (new DateTime.now().difference(_lastMessageReceived) >=
          const Duration(seconds: 30)) {
        print("TIMEOUT"); //TODO
      }
    }
  }

  @override
  Future<void> close() async {
    await audio?.close();
    _pinging?.complete();
    await _connection?.close();
  }

  @override
  Future<void> connect(
      {OnBadCertificate onBadCertificate,
      bool useUdp: true,
      dynamic localUdpBindAddress,
      int localUdpBindPort: 0}) async {
    if (_used) {
      throw new ClientReuseError();
    } else {
      _used = true;
    }
    Completer<void> syncCompleter = new Completer<void>();
    Stream<ProtobufPacket> packets =
        await _connection.connect(onBadCertificate: onBadCertificate);
    packets.listen((ProtobufPacket message) {
      if (message.type == Messages.serverSync) {
        _handleServerSync(Messages.decode(message) as Proto.ServerSync);
        syncCompleter.complete();
      } else {
        _onMessage(message);
      }
    }, onError: _onError, onDone: _onDone);
    writeMessage(new Proto.Version()
      ..version = ConnectionOptions.clientVersion
      ..release = ConnectionOptions.clientName
      ..os = ConnectionOptions.os
      ..osVersion = ConnectionOptions.osVersion);
    Proto.Authenticate auth = new Proto.Authenticate()
      ..username = options.name
      ..opus = options.opus
      ..celtVersions.addAll(options.celtVersions)
      ..tokens.addAll(options.tokens);
    if (options.password != null) {
      auth.password = options.password;
    }
    writeMessage(auth);
    _pingRoutine();
    await syncCompleter.future;
    _audio = await AudioClientBase.withRemoteHostLookup(
        this, useUdp, localUdpBindAddress, localUdpBindPort);
    _synced = true;
    listeners.forEach((MumbleClientListener listener) => listener.onSynced());
  }

  void _onError(dynamic error, [StackTrace stackTrace]) {
    listeners.forEach(
        (MumbleClientListener listener) => listener.onError(error, stackTrace));
  }

  void _onDone() {
    listeners.forEach((MumbleClientListener listener) => listener.onDone());
  }

  void _onMessage(ProtobufPacket message) {
    _lastMessageReceived = new DateTime.now();
    switch (message.type) {
      case Messages.cryptSetup:
        Proto.CryptSetup crypt = Messages.decode(message) as Proto.CryptSetup;
        _cryptState = new CryptState(
            key: (!crypt.hasKey() || crypt.key.isEmpty)
                ? cryptState.key
                : new Uint8List.fromList(crypt.key),
            clientNonce: (!crypt.hasClientNonce() || crypt.clientNonce.isEmpty)
                ? cryptState.clientNonce
                : new Uint8List.fromList(crypt.clientNonce),
            serverNonce: (!crypt.hasServerNonce() || crypt.serverNonce.isEmpty)
                ? cryptState.serverNonce
                : new Uint8List.fromList(crypt.serverNonce));
        listeners.forEach(
            (MumbleClientListener listener) => listener.onCryptStateChanged());
        break;
      case Messages.ping:
        Proto.Ping ping = Messages.decode(message) as Proto.Ping;
        _serverInfo._connectionStats = new ServerConnectionStats(
            packetStats: new PacketStats(
              goodPacketCount: ping.good,
              latePacketCount: ping.late,
              lostPacketCount: ping.lost,
              resync: ping.resync,
            ),
            tcpPacketCount: ping.tcpPackets,
            udpPacketCount: ping.udpPackets,
            pingStats: new PingStats(
                tcpPingAverage: ping.tcpPingAvg,
                tcpPingVariance: ping.tcpPingVar,
                udpPingAverage: ping.udpPingAvg,
                udpPingVariance: ping.udpPingVar));
        break;
      case Messages.codecVersion:
        Proto.CodecVersion codec =
            Messages.decode(message) as Proto.CodecVersion;
        _serverInfo._codecVersion = new ServerCodecVersion(
            celtAlphaVersion: codec.alpha,
            celtBetaVersion: codec.beta,
            preferAlpha: codec.preferAlpha,
            opus: codec.opus);
        break;
      case Messages.userStats:
        Proto.UserStats stats = Messages.decode(message) as Proto.UserStats;
        User user = _getUser(stats.session);
        if (user != null) {
          reportUserStats(user: user, stats: createUserStats(stats: stats));
        }
        break;
      case Messages.userState:
        _handleUserState(Messages.decode(message) as Proto.UserState);
        break;
      case Messages.userRemove:
        _handleUserRemove(Messages.decode(message) as Proto.UserRemove);
        break;
      case Messages.channelState:
        _handleChannelState(Messages.decode(message) as Proto.ChannelState);
        break;
      case Messages.channelRemove:
        _handleChannelRemove(Messages.decode(message) as Proto.ChannelRemove);
        break;
      case Messages.textMessage:
        _handleTextMessage(Messages.decode(message) as Proto.TextMessage);
        break;
      case Messages.udpTunnel:
        _handleUdpTunnel(message);
        break;
      case Messages.version:
        Proto.Version version = Messages.decode(message) as Proto.Version;
        _serverInfo._version = new VersionInformation(
            os: version.os,
            osVersion: version.osVersion,
            release: version.release,
            version: version.version);
        break;
      case Messages.serverConfig:
        Proto.ServerConfig config =
            Messages.decode(message) as Proto.ServerConfig;
        _serverInfo._config = new ServerConfig(
            allowHtml: config.allowHtml,
            maxImageMessageLength: config.imageMessageLength,
            maxMessageLength: config.messageLength,
            maxUsers: config.maxUsers);
        _serverInfo._maxBandwidth = config.maxBandwidth;
        _serverInfo._suggestedOpusBitrate =
            Utils.adjustNetworkBandwidth(config.maxBandwidth) ??
                Utils.defaultBitrate;
        _serverInfo._welcomeText = config.welcomeText;
        break;
      case Messages.suggestConfig:
        Proto.SuggestConfig suggested =
            Messages.decode(message) as Proto.SuggestConfig;
        _serverInfo._suggestedClientConfig = new ServerSuggestedClientConfig(
            suggestedClientVersion: suggested.version,
            usePositionalAudio: suggested.positional,
            usePushToTalk: suggested.pushToTalk);
        break;
      case Messages.reject:
        Proto.Reject reject = Messages.decode(message) as Proto.Reject;
        throw new RejectException(
            reason: reject.reason,
            rejectType: RejectType.values[reject.type.value]);
        break;
      case Messages.permissionDenied:
        Proto.PermissionDenied denied =
            Messages.decode(message) as Proto.PermissionDenied;
        throw new PermissionDeniedException(
            denyType: DenyType.values[denied.type.value],
            deniedPermission: new Permission.fromInt(denied.permission),
            invalidUserName: denied.name,
            reason: denied.reason,
            channel: _getChannel(denied.channelId, ignoreNull: true),
            user: _getUser(denied.session, ignoreNull: true));
        break;
      case Messages.permissionQuery:
        Proto.PermissionQuery query =
            Messages.decode(message) as Proto.PermissionQuery;
        if (query.flush) {
          listeners.forEach((MumbleClientListener listener) =>
              listener.onDropAllChannelPermissions());
        } else {
          Channel channel = _getChannel(query.channelId);
          Permission permissions = new Permission.fromInt(query.permissions);
          notifyChannelPermissions(channel: channel, permissions: permissions);
        }
        break;
      case Messages.banList:
        Proto.BanList banList = Messages.decode(message) as Proto.BanList;
        List<BanEntry> entries = new List<BanEntry>.unmodifiable(
            banList.bans.map(banEntryFromProto));
        listeners.forEach((MumbleClientListener listener) =>
            listener.onBanListReceived(entries));
        break;
      case Messages.userList:
        Proto.UserList registeredUsers =
            Messages.decode(message) as Proto.UserList;
        List<RegisteredUser> users = new List<RegisteredUser>.unmodifiable(
            registeredUsers.users
                .map((Proto.UserList_User user) => createRegisteredUser(
                    user, _getChannel(user.lastChannel, ignoreNull: true)))
                .toList());
        listeners.forEach((MumbleClientListener listener) =>
            listener.onUserListReceived(users));
        break;
      case Messages.queryUsers:
        Proto.QueryUsers queryResult =
            Messages.decode(message) as Proto.QueryUsers;
        Map<int, String> idsToNames = new Map<int, String>.fromIterables(
            queryResult.ids, queryResult.names);
        idsToNames = new Map<int, String>.unmodifiable(idsToNames);
        listeners.forEach((MumbleClientListener listener) =>
            listener.onQueryUsersResult(idsToNames));
        break;
      default:
        print("Unhandeld message of type ${message.type}"); //TODO
        break;
    }
  }

  void _handleUdpTunnel(ProtobufPacket packet) {
    AudioPacket audio = new AudioPacket.incoming(data: packet.data);
    _audio.feed(audio, false);
  }

  void _handleServerSync(Proto.ServerSync message) {
    _selfe = asSelfe(user: _users[message.session]);
    _users.remove(message.session);
    _serverInfo._maxBandwidth = message.maxBandwidth;
    _serverInfo._suggestedOpusBitrate =
        Utils.adjustNetworkBandwidth(message.maxBandwidth) ??
            Utils.defaultBitrate;
    _serverInfo._welcomeText = message.welcomeText;
  }

  User _getUser(int session, {ignoreNull: false}) {
    if (ignoreNull && session == null) {
      return null;
    } else {
      if (_selfe != null && _selfe.session == session) {
        return _selfe;
      } else {
        return _users[session];
      }
    }
  }

  Channel _getChannel(int id, {ignoreNull: false}) =>
      (ignoreNull && id == null) ? null : _channels[id];

  void _handleUserState(Proto.UserState message) {
    User user = _getUser(message.session);
    bool created = user == null;
    if (created) {
      user = createNewUser(client: this);
      _users[message.session] = user;
    }
    Channel channel;
    if (message.hasChannelId()) {
      channel = _getChannel(message.channelId);
    }
    UserChanges changes =
        updateUser(user: user, channel: channel, state: message);
    if (synced) {
      if (created) {
        listeners.forEach(
            (MumbleClientListener listener) => listener.onUserAdded(user));
      } else {
        notifyUserUpdate(
            user: user, actor: _getUser(message.actor), changes: changes);
      }
    }
  }

  void _handleUserRemove(Proto.UserRemove message) {
    User user = _users.remove(message.session);
    if (user != null && synced) {
      notifyUserRemoved(
          user: user,
          actor: _getUser(message.actor),
          reason: message.reason,
          ban: message.ban);
    }
  }

  void _handleChannelState(Proto.ChannelState message) {
    Channel channel = _getChannel(message.channelId);
    bool created = channel == null;
    if (created) {
      channel = createNewChannel(client: this);
      _channels[message.channelId] = channel;
    }
    Channel parent;
    if (message.hasParent()) {
      parent = _getChannel(message.parent);
    }
    List<Channel> links;
    if (message.linksRemove.isNotEmpty) {
      links = channel.links;
      List<Channel> change = new List<Channel>();
      for (int remove in message.linksRemove) {
        Channel other = _getChannel(remove);
        other.links.remove(channel);
        links.remove(other);
        change.add(other);
        notifyChannelUpdate(channel: other, changes: linksChanged);
      }
    } else if (message.linksAdd.isNotEmpty) {
      links = channel.links;
      List<Channel> change = new List<Channel>();
      for (int add in message.linksAdd) {
        Channel other = _getChannel(add);
        other.links.add(channel);
        links.add(channel);
        change.add(other);
        notifyChannelUpdate(channel: other, changes: linksChanged);
      }
    } else if (message.links.isNotEmpty) {
      links = new List<Channel>();
      for (int id in message.links) {
        Channel element = _getChannel(id);
        if (element != null) {
          links.add(element);
        }
      }
    }
    ChannelChanges changes = updateChannel(
        channel: channel, parent: parent, state: message, links: links);
    if (synced) {
      if (created) {
        listeners.forEach((MumbleClientListener listener) =>
            listener.onChannelAdded(channel));
      } else {
        notifyChannelUpdate(channel: channel, changes: changes);
      }
    }
  }

  void _handleChannelRemove(Proto.ChannelRemove message) {
    Channel channel = _channels.remove(message.channelId);
    if (channel != null && synced) {
      notifyChannelRemoved(channel: channel);
    }
  }

  void _handleTextMessage(Proto.TextMessage message) {
    TextMessage msg = new TextMessage.incoming(
        actor: _getUser(message.actor),
        message: message.message,
        clients: message.session.map(_getUser).toList(),
        channels: message.channelId.map(_getChannel).toList(),
        trees: message.treeId.map(_getChannel).toList());
    listeners.forEach(
        (MumbleClientListener listener) => listener.onTextMessage(msg));
  }

  void writeMessage<T extends GeneratedMessage>(T message) {
    _connection.writeMessage<T>(message);
  }

  void tunnelAudioPacket(AudioPacket packet) {
    _connection.tunnelAudioPacket(packet);
  }

  @override
  Map<int, User> getUsers() => new Map<int, User>.of(_users);

  @override
  Map<int, Channel> getChannels() => new Map<int, Channel>.of(_channels);

  @override
  void requestCryptStateResync() => writeMessage(
      new Proto.CryptSetup()..clientNonce = cryptState.clientNonce);

  @override
  void queryBans() => writeMessage(new Proto.BanList()..query = true);

  @override
  void queryUsersByNames({@required List<String> names}) =>
      writeMessage(new Proto.QueryUsers()..names.addAll(names));

  @override
  void queryUsersByIds({@required List<int> ids}) =>
      writeMessage(new Proto.QueryUsers()..ids.addAll(ids));

  @override
  void updateTokens({@required List<String> tokens}) =>
      writeMessage(new Proto.Authenticate()..tokens.addAll(tokens));

//TODO ACL Stuff

  @override
  void listUsers() => writeMessage(new Proto.UserList());

  @override
  void createChannel(
      {@required String name,
      int position,
      int maxUsers,
      String description,
      bool temporary,
      Channel parent}) {
    Proto.ChannelState channel = Proto.ChannelState();
    channel.parent = parent?.channelId ?? rootChannelId;
    channel.name = name;
    if (position != null) channel.position = position;
    if (maxUsers != null) channel.maxUsers = maxUsers;
    if (description != null) channel.description = description;
    if (temporary != null) channel.temporary = temporary;
    writeMessage(channel);
  }

  @override
  void sendMessage({@required TextMessage message}) {
    Proto.TextMessage msg = new Proto.TextMessage();
    msg.message = message.message;
    if (message.trees != null && message.trees.isNotEmpty) {
      msg.treeId.addAll(message.trees.map(_channelToId));
    }
    if (message.channels != null && message.channels.isNotEmpty) {
      msg.channelId.addAll(message.channels.map(_channelToId));
    }
    if (message.clients != null && message.clients.isNotEmpty) {
      msg.session.addAll(message.clients.map(_userToId));
    }
    writeMessage(msg);
  }

  @override
  void setBanList(List<BanEntry> bans) {
    Proto.BanList list = new Proto.BanList()
      ..bans.addAll(bans.map(serializeBanEntry))
      ..query = false;
    writeMessage(list);
  }

  @override
  void registerVoiceTarget({VoiceTarget target}) =>
      writeMessage(serializeVoiceTarget(target));
}
