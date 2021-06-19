import 'streams/protobuf_packet.dart';
import 'package:protobuf/protobuf.dart';
import 'generated/Mumble.pb.dart';

const Map<Type, int> _messageTypes = {
  Version: version,
  UDPTunnel: udpTunnel,
  Authenticate: authenticate,
  Ping: ping,
  Reject: reject,
  ServerSync: serverSync,
  ChannelRemove: channelRemove,
  ChannelState: channelState,
  UserRemove: userRemove,
  UserState: userState,
  BanList: banList,
  TextMessage: textMessage,
  PermissionDenied: permissionDenied,
  ACL: acl,
  QueryUsers: queryUsers,
  CryptSetup: cryptSetup,
  ContextActionModify: contextActionModify,
  ContextAction: contextAction,
  UserList: userList,
  VoiceTarget: voiceTarget,
  PermissionQuery: permissionQuery,
  CodecVersion: codecVersion,
  UserStats: userStats,
  RequestBlob: requestBlob,
  ServerConfig: serverConfig,
  SuggestConfig: suggestConfig,
  PluginDataTransmission: pluginDataTransmission
};

/// From https://github.com/mumble-voip/mumble/blob/master/src/Message.h
const int version = 0,
    udpTunnel = 1,
    authenticate = 2,
    ping = 3,
    reject = 4,
    serverSync = 5,
    channelRemove = 6,
    channelState = 7,
    userRemove = 8,
    userState = 9,
    banList = 10,
    textMessage = 11,
    permissionDenied = 12,
    acl = 13,
    queryUsers = 14,
    cryptSetup = 15,
    contextActionModify = 16,
    contextAction = 17,
    userList = 18,
    voiceTarget = 19,
    permissionQuery = 20,
    codecVersion = 21,
    userStats = 22,
    requestBlob = 23,
    serverConfig = 24,
    suggestConfig = 25,
    pluginDataTransmission = 26;

/// Builds a [GeneratedMessage] from bytes.
typedef T MessageBuilder<T extends GeneratedMessage>(List<int> bytes);

/// Used to obtain the matching [MessageBuilder] for each defined message code.
final Map<int, MessageBuilder> _builders = <int, MessageBuilder>{
  version: (List<int> bytes) => Version.fromBuffer(bytes),
  udpTunnel: (List<int> bytes) => UDPTunnel.fromBuffer(bytes),
  authenticate: (List<int> bytes) => Authenticate.fromBuffer(bytes),
  ping: (List<int> bytes) => Ping.fromBuffer(bytes),
  reject: (List<int> bytes) => Reject.fromBuffer(bytes),
  serverSync: (List<int> bytes) => ServerSync.fromBuffer(bytes),
  channelRemove: (List<int> bytes) => ChannelRemove.fromBuffer(bytes),
  channelState: (List<int> bytes) => ChannelState.fromBuffer(bytes),
  userRemove: (List<int> bytes) => UserRemove.fromBuffer(bytes),
  userState: (List<int> bytes) => UserState.fromBuffer(bytes),
  banList: (List<int> bytes) => BanList.fromBuffer(bytes),
  textMessage: (List<int> bytes) => TextMessage.fromBuffer(bytes),
  permissionDenied: (List<int> bytes) => PermissionDenied.fromBuffer(bytes),
  acl: (List<int> bytes) => ACL.fromBuffer(bytes),
  queryUsers: (List<int> bytes) => QueryUsers.fromBuffer(bytes),
  cryptSetup: (List<int> bytes) => CryptSetup.fromBuffer(bytes),
  contextActionModify: (List<int> bytes) =>
      ContextActionModify.fromBuffer(bytes),
  contextAction: (List<int> bytes) => ContextAction.fromBuffer(bytes),
  userList: (List<int> bytes) => UserList.fromBuffer(bytes),
  voiceTarget: (List<int> bytes) => VoiceTarget.fromBuffer(bytes),
  permissionQuery: (List<int> bytes) => PermissionQuery.fromBuffer(bytes),
  codecVersion: (List<int> bytes) => CodecVersion.fromBuffer(bytes),
  userStats: (List<int> bytes) => UserStats.fromBuffer(bytes),
  requestBlob: (List<int> bytes) => RequestBlob.fromBuffer(bytes),
  serverConfig: (List<int> bytes) => ServerConfig.fromBuffer(bytes),
  suggestConfig: (List<int> bytes) => SuggestConfig.fromBuffer(bytes),
  pluginDataTransmission: (List<int> bytes) =>
      PluginDataTransmission.fromBuffer(bytes),
};

class UnknownMessageException implements Exception {
  final dynamic requestedType;
  const UnknownMessageException({required this.requestedType});

  @override
  String toString() {
    return 'Tried to send or decode a message of unknown type ${requestedType}';
  }
}

ProtobufPacket encode<T extends GeneratedMessage>(T message) {
  int? type = _messageTypes[T];
  if (type != null) {
    return new ProtobufPacket(type: type, data: message.writeToBuffer());
  } else {
    throw new UnknownMessageException(requestedType: T);
  }
}

GeneratedMessage decode(ProtobufPacket packet) {
  MessageBuilder? builder = _builders[packet.type];
  if (builder != null) {
    return builder(packet.data);
  } else {
    throw new UnknownMessageException(requestedType: packet.type);
  }
}
