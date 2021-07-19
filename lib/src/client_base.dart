import 'package:fixnum/fixnum.dart' as Fixnum show Int64;
import 'package:protobuf/protobuf.dart';

import 'model/exceptions.dart';
import 'connection.dart';
import 'generated/Mumble.pb.dart' as Proto;
import 'connection_options.dart' as ConnectionOptions;
import 'utils.dart' as Utils;
import 'messages.dart' as Messages;
import 'dart:async';
import 'client.dart';
import 'model/channel.dart';
import 'model/voice_target.dart';
import 'model/user.dart';
import 'listeners.dart';
import 'audio/audio_packet.dart';
import 'audio/audio_client.dart';
import 'streams/protobuf_packet.dart';
import 'model/server_infos.dart';
import 'model/crypto.dart';
import 'model/stats.dart';
import 'model/ban.dart';
import 'model/text_message.dart';
import 'model/user_stats.dart';
import 'model/registered_user.dart';
import 'model/permission.dart';

int _channelToId(Channel channel) => channel.channelId;
int _userToId(User user) => user.session;

const String _earlyAccessErrorText =
    'Accessing this property is not allowed until the connect function returned!' +
        '\r\nHow were you even able to access it?!';

class MumbleClientBase extends MumbleClient
    with Notifier<MumbleClientListener> {
  final Map<int, User> _users;
  final Map<int, Channel> _channels;
  final Connection _connection;
  final Completer<void> _pinging;

  @override
  final ConnectionOptions.ConnectionOptions options;

  DateTime? _lastMessageReceived;

  AudioClientBase? _lateAudio;
  @override
  AudioClient get audio {
    if (_lateAudio != null) {
      return _lateAudio!;
    } else {
      throw new StateError(_earlyAccessErrorText);
    }
  }

  CryptState? _lateCryptState;
  @override
  CryptState get cryptState {
    if (_lateCryptState != null) {
      return _lateCryptState!;
    } else {
      throw new StateError(_earlyAccessErrorText);
    }
  }

  final ServerInfoBase _serverInfo;
  @override
  ServerInfo get serverInfo => _serverInfo;

  MumbleClientBase({required this.options, required Connection connection})
      : this._connection = connection,
        this._users = new Map<int, User>(),
        this._channels = new Map<int, Channel>(),
        this._serverInfo = new ServerInfoBase(),
        this._pinging = new Completer<void>();

  /// Starts the ping routine but does not await it
  void _startPingRoutine() {
    _pingRoutine();
  }

  Future<void> _pingRoutine() async {
    const Duration timeout = const Duration(seconds: 30);
    final DateTime start = new DateTime.now();
    while (!_pinging.isCompleted) {
      _connection.writeMessage(new Proto.Ping()
        ..timestamp =
            new Fixnum.Int64(new DateTime.now().millisecondsSinceEpoch));
      await Future.any(<Future>[
        new Future.delayed(const Duration(seconds: 15)),
        _pinging.future
      ]);
      DateTime now = new DateTime.now();
      if (now.difference(_lastMessageReceived ?? start) >= timeout) {
        print("TIMEOUT"); //TODO
      }
    }
  }

  @override
  Future<void> close() async {
    await _lateAudio?.close();
    if (!_pinging.isCompleted) {
      _pinging.complete();
    }
    await _connection.close();
  }

  static Future<MumbleClient> connect(
      {required ConnectionOptions.ConnectionOptions options,
      OnBadCertificate? onBadCertificate,
      bool useUdp: true,
      Object? localUdpBindAddress,
      int localUdpBindPort: 0}) async {
    Completer<void> syncCompleter = new Completer<void>();
    Connection con = await Connection.connect(
        host: options.host,
        port: options.port,
        context: options.context,
        onBadCertificate: onBadCertificate);
    MumbleClientBase client =
        new MumbleClientBase(options: options, connection: con);
    con.listen((ProtobufPacket message) {
      if (message.type == Messages.serverSync) {
        client._handleServerSync(Messages.decode(message) as Proto.ServerSync);
        syncCompleter.complete();
      } else {
        client._onMessage(message);
      }
    }, onError: client._onError, onDone: client._onDone);
    client.writeMessage(new Proto.Version()
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
      auth.password = options.password!;
    }
    client.writeMessage(auth);
    client._startPingRoutine();
    await syncCompleter.future;
    // By now, the _lateSelf, _lateRootChannel and _lateCryptState should have been initalized,
    // so assert it
    if (client._lateCryptState == null) {
      throw new StateError(
          'Received sync complete message from server, but CryptState is still missing!' +
              '\r\nThis should be impossible!');
    }
    if (client._lateSelf == null) {
      throw new StateError(
          'Received sync complete message from server, but Self is still missing!' +
              '\r\nThis should be impossible!');
    }
    if (client._lateRootChannel == null) {
      throw new StateError(
          'Received sync complete message from server, but the root channel is still missing!' +
              '\r\nThis should be impossible!');
    }
    client._lateAudio = await AudioClientBase.withRemoteHostLookup(
        client,
        useUdp,
        localUdpBindAddress,
        localUdpBindPort,
        options.incomingAudioStreamTimeout);
    return client;
  }

  void _onError(Object error, [StackTrace? stackTrace]) {
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
        _lateCryptState = cryptStateFromProto(crypt, _lateCryptState);
        listeners.forEach(
            (MumbleClientListener listener) => listener.onCryptStateChanged());
        break;
      case Messages.ping:
        Proto.Ping ping = Messages.decode(message) as Proto.Ping;
        _serverInfo.connectionStats = serverConnectionStatsFromProto(ping);
        break;
      case Messages.codecVersion:
        Proto.CodecVersion codec =
            Messages.decode(message) as Proto.CodecVersion;
        _serverInfo.codecVersion = serverCodecVersionFromProto(codec);
        break;
      case Messages.userStats:
        Proto.UserStats stats = Messages.decode(message) as Proto.UserStats;
        User? user = _getUserOrSelf(stats.hasSession(), stats.session);
        if (user != null) {
          reportUserStats(user: user, stats: userStatsFromProto(stats: stats));
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
        _serverInfo.version = versionInformationFromProto(version);
        break;
      case Messages.serverConfig:
        Proto.ServerConfig config =
            Messages.decode(message) as Proto.ServerConfig;
        _serverInfo.config = serverConfigFromProto(config);
        break;
      case Messages.suggestConfig:
        Proto.SuggestConfig suggested =
            Messages.decode(message) as Proto.SuggestConfig;
        _serverInfo.suggestedClientConfig =
            serverSuggestedClientConfigFromProto(suggested);
        break;
      case Messages.reject:
        Proto.Reject reject = Messages.decode(message) as Proto.Reject;
        throw rejectExceptionFromProto(reject);
      case Messages.permissionDenied:
        Proto.PermissionDenied denied =
            Messages.decode(message) as Proto.PermissionDenied;
        throw permissionDeniedExceptionFromProto(denied);
      case Messages.permissionQuery:
        Proto.PermissionQuery query =
            Messages.decode(message) as Proto.PermissionQuery;
        if (query.hasFlush() && query.flush) {
          listeners.forEach((MumbleClientListener listener) =>
              listener.onDropAllChannelPermissions());
        } else {
          Channel? channel = _getChannel(query.hasChannelId(), query.channelId);
          if (channel != null) {
            Permission permissions = new Permission.fromInt(query.permissions);
            notifyChannelPermissions(
                channel: channel, permissions: permissions);
          }
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
                .map((Proto.UserList_User user) => registeredUserFromProto(
                    user, _getChannel(user.hasLastChannel(), user.lastChannel)))
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
    AudioPacket audio = decodeIncoming(data: packet.data);
    if (audio is IncomingAudioPacket) {
      // If it is guaranteed that no voice packet is transmitted before syncing is done
      // we could use the audio field, but I am not sure about that, so we are using the
      // _lateAudio and by this, discarding every packet until we are synced.
      // TODO test if we could are always synced by now and can use audio instead of _lateAudio
      _lateAudio?.feed(audio, false);
    } else {
      throw new ArgumentError(
          'Did not expect a packet here that is NOT of type IncomingAudioPacket!' +
              'Actual type was ${audio.runtimeType}');
    }
  }

  void _handleServerSync(Proto.ServerSync message) {
    if (!message.hasSession()) {
      throw ArgumentError('Bad message, session id missing!');
    }
    User? user = _users[message.session];
    if (user == null) {
      throw new StateError(
          'A synced message was recevied, but not the own user object!');
    }
    _lateSelf = asSelf(user: user);
    _users.remove(user.session);
    _serverInfo.config =
        updatedServerConfigFromProto(message, _serverInfo.config);
  }

//TODO ACL Stuff

//TODO Plugin Stuff

  void writeMessage<T extends GeneratedMessage>(T message) {
    _connection.writeMessage<T>(message);
  }

  void _handleTextMessage(Proto.TextMessage message) {
    IncomingTextMessage msg = incomingTextMessageFromProto(
        actor: _getUserOrSelf(message.hasActor(), message.actor),
        message: message.message,
        clients: message.session
            .map((int session) => _getUserOrSelf(true, session))
            .toList()
            .filterNull(),
        channels: message.channelId
            .map((int channel) => _getChannel(true, channel))
            .toList()
            .filterNull(),
        trees: message.treeId
            .map((int channel) => _getChannel(true, channel))
            .toList()
            .filterNull());
    listeners.forEach(
        (MumbleClientListener listener) => listener.onTextMessage(msg));
  }

  void tunnelAudioPacket(AudioPacket packet) {
    _connection.tunnelAudioPacket(packet);
  }

  @override
  void requestCryptStateResync() => writeMessage(
      new Proto.CryptSetup()..clientNonce = cryptState.clientNonce);

  @override
  void queryBans() => writeMessage(new Proto.BanList()..query = true);

  @override
  void updateTokens({required List<String> tokens}) =>
      writeMessage(new Proto.Authenticate()..tokens.addAll(tokens));

  @override
  void sendMessage({required OutgoingTextMessage message}) {
    Proto.TextMessage msg = new Proto.TextMessage();
    msg.message = message.message;
    if (message.trees.isNotEmpty) {
      msg.treeId.addAll(message.trees.map(_channelToId));
    }
    if (message.channels.isNotEmpty) {
      msg.channelId.addAll(message.channels.map(_channelToId));
    }
    if (message.clients.isNotEmpty) {
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
  void registerVoiceTarget({required VoiceTarget target}) =>
      writeMessage(serializeVoiceTarget(target));

  // Channel Section
  @override
  Map<int, Channel> getChannels() => new Map<int, Channel>.of(_channels);

  Channel? _getChannel(bool hasChannel, int id) {
    return hasChannel ? _channels[id] : null;
  }

  Channel? _lateRootChannel;
  @override
  Channel get rootChannel {
    if (_lateRootChannel != null) {
      return _lateRootChannel!;
    } else {
      throw new StateError(_earlyAccessErrorText);
    }
  }

  void _handleChannelState(Proto.ChannelState message) {
    if (!message.hasChannelId()) {
      throw new ArgumentError('Bad message, channel id missing!');
    }
    final bool created;
    final Channel channel;
    Channel? channelOrNull = _getChannel(true, message.channelId);
    if (channelOrNull == null) {
      channel = createNewChannel(channelId: message.channelId, client: this);
      _channels[message.channelId] = channel;
      if (channel.channelId == rootChannelId) {
        _lateRootChannel = channel;
      }
      created = true;
    } else {
      channel = channelOrNull;
      created = false;
    }
    Channel? parent = _getChannel(message.hasParent(), message.parent);
    List<Channel>? links;
    if (message.linksRemove.isNotEmpty) {
      links = channel.links;
      List<Channel> change = <Channel>[];
      for (int remove in message.linksRemove) {
        Channel? other = _getChannel(true, remove);
        if (other != null) {
          other.links.remove(channel);
          links.remove(other);
          change.add(other);
          notifyChannelUpdate(channel: other, changes: linksChanged);
        }
      }
    } else if (message.linksAdd.isNotEmpty) {
      links = channel.links;
      List<Channel> change = <Channel>[];
      for (int add in message.linksAdd) {
        Channel? other = _getChannel(true, add);
        if (other != null) {
          other.links.add(channel);
          links.add(other);
          change.add(other);
          notifyChannelUpdate(channel: other, changes: linksChanged);
        }
      }
    } else if (message.links.isNotEmpty) {
      links = <Channel>[];
      for (int id in message.links) {
        Channel? element = _getChannel(true, id);
        if (element != null) {
          links.add(element);
        }
      }
    }
    ChannelChanges changes = updateChannel(
        channel: channel, parent: parent, state: message, links: links);
    if (created) {
      listeners.forEach(
          (MumbleClientListener listener) => listener.onChannelAdded(channel));
    } else {
      notifyChannelUpdate(channel: channel, changes: changes);
    }
  }

  void _handleChannelRemove(Proto.ChannelRemove message) {
    if (message.hasChannelId()) {
      if (message.channelId != 0) {
        Channel? channel = _channels.remove(message.channelId);
        if (channel != null) {
          notifyChannelRemoved(channel: channel);
        }
      } else {
        throw new ArgumentError('Can not remove the root channel!');
      }
    } else {
      throw new ArgumentError('Bad message, channel id missing!');
    }
  }

  @override
  void createChannel(
      {required String name,
      int? position,
      int? maxUsers,
      String? description,
      bool? temporary,
      Channel? parent}) {
    Proto.ChannelState channel = Proto.ChannelState();
    channel.parent = parent?.channelId ?? rootChannelId;
    channel.name = name;
    if (position != null) channel.position = position;
    if (maxUsers != null) channel.maxUsers = maxUsers;
    if (description != null) channel.description = description;
    if (temporary != null) channel.temporary = temporary;
    writeMessage(channel);
  }

  // User Section

  Self? _lateSelf;
  @override
  Self get self {
    if (_lateSelf != null) {
      return _lateSelf!;
    } else {
      throw new StateError(_earlyAccessErrorText);
    }
  }

  @override
  Map<int, User> getUsers() => new Map<int, User>.of(_users);

  User? _getUserOrSelf(bool hasUser, int session) {
    if (hasUser) {
      if (_lateSelf != null) {
        if (_lateSelf!.session == session) {
          return _lateSelf;
        }
      }
      return _users[session];
    } else {
      return null;
    }
  }

  void _handleUserState(Proto.UserState message) {
    if (!message.hasSession()) {
      throw new ArgumentError('Bad message, session id missing!');
    }
    Channel? channel = _getChannel(message.hasChannelId(), message.channelId);
    final bool created;
    final User user;
    User? userOrNull = _getUserOrSelf(true, message.session);
    if (userOrNull == null) {
      channel ??= _lateRootChannel;
      if (channel == null) {
        throw new StateError(
            'Channel is null for a new user and there is no root channel! This should never happen!');
      }
      user = createNewUser(
          client: this, sessionId: message.session, channel: channel);
      _users[message.session] = user;
      created = true;
    } else {
      user = userOrNull;
      created = false;
    }

    UserChanges changes =
        updateUser(user: user, channel: channel, state: message);

    if (created) {
      listeners.forEach(
          (MumbleClientListener listener) => listener.onUserAdded(user));
    } else {
      notifyUserUpdate(
          user: user,
          actor: _getUserOrSelf(message.hasActor(), message.actor),
          changes: changes);
    }
  }

  void _handleUserRemove(Proto.UserRemove message) {
    User? user = _users.remove(message.session);
    if (user != null) {
      notifyUserRemoved(
          user: user,
          actor: _getUserOrSelf(message.hasActor(), message.actor),
          reason: message.reason,
          ban: message.ban);
    }
  }

  @override
  void queryUsersByNames({required List<String> names}) =>
      writeMessage(new Proto.QueryUsers()..names.addAll(names));

  @override
  void queryUsersByIds({required List<int> ids}) =>
      writeMessage(new Proto.QueryUsers()..ids.addAll(ids));

  @override
  void listUsers() => writeMessage(new Proto.UserList());
}

class ServerInfoBase extends ServerInfo {
  @override
  VersionInformation? version;

  @override
  ServerConfig? config;

  @override
  ServerConnectionStats? connectionStats;

  @override
  ServerSuggestedClientConfig? suggestedClientConfig;

  @override
  ServerCodecVersion? codecVersion;
}
