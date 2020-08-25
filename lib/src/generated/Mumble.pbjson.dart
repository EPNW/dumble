///
//  Generated code. Do not modify.
//  source: mumble.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Version$json = const {
  '1': 'Version',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'release', '3': 2, '4': 1, '5': 9, '10': 'release'},
    const {'1': 'os', '3': 3, '4': 1, '5': 9, '10': 'os'},
    const {'1': 'os_version', '3': 4, '4': 1, '5': 9, '10': 'osVersion'},
  ],
};

const UDPTunnel$json = const {
  '1': 'UDPTunnel',
  '2': const [
    const {'1': 'packet', '3': 1, '4': 2, '5': 12, '10': 'packet'},
  ],
};

const Authenticate$json = const {
  '1': 'Authenticate',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'tokens', '3': 3, '4': 3, '5': 9, '10': 'tokens'},
    const {'1': 'celt_versions', '3': 4, '4': 3, '5': 5, '10': 'celtVersions'},
    const {'1': 'opus', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'opus'},
  ],
};

const Ping$json = const {
  '1': 'Ping',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 4, '10': 'timestamp'},
    const {'1': 'good', '3': 2, '4': 1, '5': 13, '10': 'good'},
    const {'1': 'late', '3': 3, '4': 1, '5': 13, '10': 'late'},
    const {'1': 'lost', '3': 4, '4': 1, '5': 13, '10': 'lost'},
    const {'1': 'resync', '3': 5, '4': 1, '5': 13, '10': 'resync'},
    const {'1': 'udp_packets', '3': 6, '4': 1, '5': 13, '10': 'udpPackets'},
    const {'1': 'tcp_packets', '3': 7, '4': 1, '5': 13, '10': 'tcpPackets'},
    const {'1': 'udp_ping_avg', '3': 8, '4': 1, '5': 2, '10': 'udpPingAvg'},
    const {'1': 'udp_ping_var', '3': 9, '4': 1, '5': 2, '10': 'udpPingVar'},
    const {'1': 'tcp_ping_avg', '3': 10, '4': 1, '5': 2, '10': 'tcpPingAvg'},
    const {'1': 'tcp_ping_var', '3': 11, '4': 1, '5': 2, '10': 'tcpPingVar'},
  ],
};

const Reject$json = const {
  '1': 'Reject',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.MumbleProto.Reject.RejectType', '10': 'type'},
    const {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
  '4': const [Reject_RejectType$json],
};

const Reject_RejectType$json = const {
  '1': 'RejectType',
  '2': const [
    const {'1': 'None', '2': 0},
    const {'1': 'WrongVersion', '2': 1},
    const {'1': 'InvalidUsername', '2': 2},
    const {'1': 'WrongUserPW', '2': 3},
    const {'1': 'WrongServerPW', '2': 4},
    const {'1': 'UsernameInUse', '2': 5},
    const {'1': 'ServerFull', '2': 6},
    const {'1': 'NoCertificate', '2': 7},
    const {'1': 'AuthenticatorFail', '2': 8},
  ],
};

const ServerSync$json = const {
  '1': 'ServerSync',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    const {'1': 'max_bandwidth', '3': 2, '4': 1, '5': 13, '10': 'maxBandwidth'},
    const {'1': 'welcome_text', '3': 3, '4': 1, '5': 9, '10': 'welcomeText'},
    const {'1': 'permissions', '3': 4, '4': 1, '5': 4, '10': 'permissions'},
  ],
};

const ChannelRemove$json = const {
  '1': 'ChannelRemove',
  '2': const [
    const {'1': 'channel_id', '3': 1, '4': 2, '5': 13, '10': 'channelId'},
  ],
};

const ChannelState$json = const {
  '1': 'ChannelState',
  '2': const [
    const {'1': 'channel_id', '3': 1, '4': 1, '5': 13, '10': 'channelId'},
    const {'1': 'parent', '3': 2, '4': 1, '5': 13, '10': 'parent'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'links', '3': 4, '4': 3, '5': 13, '10': 'links'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'links_add', '3': 6, '4': 3, '5': 13, '10': 'linksAdd'},
    const {'1': 'links_remove', '3': 7, '4': 3, '5': 13, '10': 'linksRemove'},
    const {'1': 'temporary', '3': 8, '4': 1, '5': 8, '7': 'false', '10': 'temporary'},
    const {'1': 'position', '3': 9, '4': 1, '5': 5, '7': '0', '10': 'position'},
    const {'1': 'description_hash', '3': 10, '4': 1, '5': 12, '10': 'descriptionHash'},
    const {'1': 'max_users', '3': 11, '4': 1, '5': 13, '10': 'maxUsers'},
    const {'1': 'is_enter_restricted', '3': 12, '4': 1, '5': 8, '10': 'isEnterRestricted'},
    const {'1': 'can_enter', '3': 13, '4': 1, '5': 8, '10': 'canEnter'},
  ],
};

const UserRemove$json = const {
  '1': 'UserRemove',
  '2': const [
    const {'1': 'session', '3': 1, '4': 2, '5': 13, '10': 'session'},
    const {'1': 'actor', '3': 2, '4': 1, '5': 13, '10': 'actor'},
    const {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
    const {'1': 'ban', '3': 4, '4': 1, '5': 8, '10': 'ban'},
  ],
};

const UserState$json = const {
  '1': 'UserState',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    const {'1': 'actor', '3': 2, '4': 1, '5': 13, '10': 'actor'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    const {'1': 'channel_id', '3': 5, '4': 1, '5': 13, '10': 'channelId'},
    const {'1': 'mute', '3': 6, '4': 1, '5': 8, '10': 'mute'},
    const {'1': 'deaf', '3': 7, '4': 1, '5': 8, '10': 'deaf'},
    const {'1': 'suppress', '3': 8, '4': 1, '5': 8, '10': 'suppress'},
    const {'1': 'self_mute', '3': 9, '4': 1, '5': 8, '10': 'selfMute'},
    const {'1': 'self_deaf', '3': 10, '4': 1, '5': 8, '10': 'selfDeaf'},
    const {'1': 'texture', '3': 11, '4': 1, '5': 12, '10': 'texture'},
    const {'1': 'plugin_context', '3': 12, '4': 1, '5': 12, '10': 'pluginContext'},
    const {'1': 'plugin_identity', '3': 13, '4': 1, '5': 9, '10': 'pluginIdentity'},
    const {'1': 'comment', '3': 14, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'hash', '3': 15, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'comment_hash', '3': 16, '4': 1, '5': 12, '10': 'commentHash'},
    const {'1': 'texture_hash', '3': 17, '4': 1, '5': 12, '10': 'textureHash'},
    const {'1': 'priority_speaker', '3': 18, '4': 1, '5': 8, '10': 'prioritySpeaker'},
    const {'1': 'recording', '3': 19, '4': 1, '5': 8, '10': 'recording'},
    const {'1': 'temporary_access_tokens', '3': 20, '4': 3, '5': 9, '10': 'temporaryAccessTokens'},
    const {'1': 'listening_channel_add', '3': 21, '4': 3, '5': 13, '10': 'listeningChannelAdd'},
    const {'1': 'listening_channel_remove', '3': 22, '4': 3, '5': 13, '10': 'listeningChannelRemove'},
  ],
};

const BanList$json = const {
  '1': 'BanList',
  '2': const [
    const {'1': 'bans', '3': 1, '4': 3, '5': 11, '6': '.MumbleProto.BanList.BanEntry', '10': 'bans'},
    const {'1': 'query', '3': 2, '4': 1, '5': 8, '7': 'false', '10': 'query'},
  ],
  '3': const [BanList_BanEntry$json],
};

const BanList_BanEntry$json = const {
  '1': 'BanEntry',
  '2': const [
    const {'1': 'address', '3': 1, '4': 2, '5': 12, '10': 'address'},
    const {'1': 'mask', '3': 2, '4': 2, '5': 13, '10': 'mask'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'hash', '3': 4, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'reason', '3': 5, '4': 1, '5': 9, '10': 'reason'},
    const {'1': 'start', '3': 6, '4': 1, '5': 9, '10': 'start'},
    const {'1': 'duration', '3': 7, '4': 1, '5': 13, '10': 'duration'},
  ],
};

const TextMessage$json = const {
  '1': 'TextMessage',
  '2': const [
    const {'1': 'actor', '3': 1, '4': 1, '5': 13, '10': 'actor'},
    const {'1': 'session', '3': 2, '4': 3, '5': 13, '10': 'session'},
    const {'1': 'channel_id', '3': 3, '4': 3, '5': 13, '10': 'channelId'},
    const {'1': 'tree_id', '3': 4, '4': 3, '5': 13, '10': 'treeId'},
    const {'1': 'message', '3': 5, '4': 2, '5': 9, '10': 'message'},
  ],
};

const PermissionDenied$json = const {
  '1': 'PermissionDenied',
  '2': const [
    const {'1': 'permission', '3': 1, '4': 1, '5': 13, '10': 'permission'},
    const {'1': 'channel_id', '3': 2, '4': 1, '5': 13, '10': 'channelId'},
    const {'1': 'session', '3': 3, '4': 1, '5': 13, '10': 'session'},
    const {'1': 'reason', '3': 4, '4': 1, '5': 9, '10': 'reason'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.MumbleProto.PermissionDenied.DenyType', '10': 'type'},
    const {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
  ],
  '4': const [PermissionDenied_DenyType$json],
};

const PermissionDenied_DenyType$json = const {
  '1': 'DenyType',
  '2': const [
    const {'1': 'Text', '2': 0},
    const {'1': 'Permission', '2': 1},
    const {'1': 'SuperUser', '2': 2},
    const {'1': 'ChannelName', '2': 3},
    const {'1': 'TextTooLong', '2': 4},
    const {'1': 'H9K', '2': 5},
    const {'1': 'TemporaryChannel', '2': 6},
    const {'1': 'MissingCertificate', '2': 7},
    const {'1': 'UserName', '2': 8},
    const {'1': 'ChannelFull', '2': 9},
    const {'1': 'NestingLimit', '2': 10},
    const {'1': 'ChannelCountLimit', '2': 11},
    const {'1': 'ChannelListenerLimit', '2': 12},
    const {'1': 'UserListenerLimit', '2': 13},
  ],
};

const ACL$json = const {
  '1': 'ACL',
  '2': const [
    const {'1': 'channel_id', '3': 1, '4': 2, '5': 13, '10': 'channelId'},
    const {'1': 'inherit_acls', '3': 2, '4': 1, '5': 8, '7': 'true', '10': 'inheritAcls'},
    const {'1': 'groups', '3': 3, '4': 3, '5': 11, '6': '.MumbleProto.ACL.ChanGroup', '10': 'groups'},
    const {'1': 'acls', '3': 4, '4': 3, '5': 11, '6': '.MumbleProto.ACL.ChanACL', '10': 'acls'},
    const {'1': 'query', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'query'},
  ],
  '3': const [ACL_ChanGroup$json, ACL_ChanACL$json],
};

const ACL_ChanGroup$json = const {
  '1': 'ChanGroup',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
    const {'1': 'inherited', '3': 2, '4': 1, '5': 8, '7': 'true', '10': 'inherited'},
    const {'1': 'inherit', '3': 3, '4': 1, '5': 8, '7': 'true', '10': 'inherit'},
    const {'1': 'inheritable', '3': 4, '4': 1, '5': 8, '7': 'true', '10': 'inheritable'},
    const {'1': 'add', '3': 5, '4': 3, '5': 13, '10': 'add'},
    const {'1': 'remove', '3': 6, '4': 3, '5': 13, '10': 'remove'},
    const {'1': 'inherited_members', '3': 7, '4': 3, '5': 13, '10': 'inheritedMembers'},
  ],
};

const ACL_ChanACL$json = const {
  '1': 'ChanACL',
  '2': const [
    const {'1': 'apply_here', '3': 1, '4': 1, '5': 8, '7': 'true', '10': 'applyHere'},
    const {'1': 'apply_subs', '3': 2, '4': 1, '5': 8, '7': 'true', '10': 'applySubs'},
    const {'1': 'inherited', '3': 3, '4': 1, '5': 8, '7': 'true', '10': 'inherited'},
    const {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    const {'1': 'group', '3': 5, '4': 1, '5': 9, '10': 'group'},
    const {'1': 'grant', '3': 6, '4': 1, '5': 13, '10': 'grant'},
    const {'1': 'deny', '3': 7, '4': 1, '5': 13, '10': 'deny'},
  ],
};

const QueryUsers$json = const {
  '1': 'QueryUsers',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 13, '10': 'ids'},
    const {'1': 'names', '3': 2, '4': 3, '5': 9, '10': 'names'},
  ],
};

const CryptSetup$json = const {
  '1': 'CryptSetup',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    const {'1': 'client_nonce', '3': 2, '4': 1, '5': 12, '10': 'clientNonce'},
    const {'1': 'server_nonce', '3': 3, '4': 1, '5': 12, '10': 'serverNonce'},
  ],
};

const ContextActionModify$json = const {
  '1': 'ContextActionModify',
  '2': const [
    const {'1': 'action', '3': 1, '4': 2, '5': 9, '10': 'action'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'context', '3': 3, '4': 1, '5': 13, '10': 'context'},
    const {'1': 'operation', '3': 4, '4': 1, '5': 14, '6': '.MumbleProto.ContextActionModify.Operation', '10': 'operation'},
  ],
  '4': const [ContextActionModify_Context$json, ContextActionModify_Operation$json],
};

const ContextActionModify_Context$json = const {
  '1': 'Context',
  '2': const [
    const {'1': 'Server', '2': 1},
    const {'1': 'Channel', '2': 2},
    const {'1': 'User', '2': 4},
  ],
};

const ContextActionModify_Operation$json = const {
  '1': 'Operation',
  '2': const [
    const {'1': 'Add', '2': 0},
    const {'1': 'Remove', '2': 1},
  ],
};

const ContextAction$json = const {
  '1': 'ContextAction',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    const {'1': 'channel_id', '3': 2, '4': 1, '5': 13, '10': 'channelId'},
    const {'1': 'action', '3': 3, '4': 2, '5': 9, '10': 'action'},
  ],
};

const UserList$json = const {
  '1': 'UserList',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.MumbleProto.UserList.User', '10': 'users'},
  ],
  '3': const [UserList_User$json],
};

const UserList_User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 2, '5': 13, '10': 'userId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'last_seen', '3': 3, '4': 1, '5': 9, '10': 'lastSeen'},
    const {'1': 'last_channel', '3': 4, '4': 1, '5': 13, '10': 'lastChannel'},
  ],
};

const VoiceTarget$json = const {
  '1': 'VoiceTarget',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    const {'1': 'targets', '3': 2, '4': 3, '5': 11, '6': '.MumbleProto.VoiceTarget.Target', '10': 'targets'},
  ],
  '3': const [VoiceTarget_Target$json],
};

const VoiceTarget_Target$json = const {
  '1': 'Target',
  '2': const [
    const {'1': 'session', '3': 1, '4': 3, '5': 13, '10': 'session'},
    const {'1': 'channel_id', '3': 2, '4': 1, '5': 13, '10': 'channelId'},
    const {'1': 'group', '3': 3, '4': 1, '5': 9, '10': 'group'},
    const {'1': 'links', '3': 4, '4': 1, '5': 8, '7': 'false', '10': 'links'},
    const {'1': 'children', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'children'},
  ],
};

const PermissionQuery$json = const {
  '1': 'PermissionQuery',
  '2': const [
    const {'1': 'channel_id', '3': 1, '4': 1, '5': 13, '10': 'channelId'},
    const {'1': 'permissions', '3': 2, '4': 1, '5': 13, '10': 'permissions'},
    const {'1': 'flush', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'flush'},
  ],
};

const CodecVersion$json = const {
  '1': 'CodecVersion',
  '2': const [
    const {'1': 'alpha', '3': 1, '4': 2, '5': 5, '10': 'alpha'},
    const {'1': 'beta', '3': 2, '4': 2, '5': 5, '10': 'beta'},
    const {'1': 'prefer_alpha', '3': 3, '4': 2, '5': 8, '7': 'true', '10': 'preferAlpha'},
    const {'1': 'opus', '3': 4, '4': 1, '5': 8, '7': 'false', '10': 'opus'},
  ],
};

const UserStats$json = const {
  '1': 'UserStats',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    const {'1': 'stats_only', '3': 2, '4': 1, '5': 8, '7': 'false', '10': 'statsOnly'},
    const {'1': 'certificates', '3': 3, '4': 3, '5': 12, '10': 'certificates'},
    const {'1': 'from_client', '3': 4, '4': 1, '5': 11, '6': '.MumbleProto.UserStats.Stats', '10': 'fromClient'},
    const {'1': 'from_server', '3': 5, '4': 1, '5': 11, '6': '.MumbleProto.UserStats.Stats', '10': 'fromServer'},
    const {'1': 'udp_packets', '3': 6, '4': 1, '5': 13, '10': 'udpPackets'},
    const {'1': 'tcp_packets', '3': 7, '4': 1, '5': 13, '10': 'tcpPackets'},
    const {'1': 'udp_ping_avg', '3': 8, '4': 1, '5': 2, '10': 'udpPingAvg'},
    const {'1': 'udp_ping_var', '3': 9, '4': 1, '5': 2, '10': 'udpPingVar'},
    const {'1': 'tcp_ping_avg', '3': 10, '4': 1, '5': 2, '10': 'tcpPingAvg'},
    const {'1': 'tcp_ping_var', '3': 11, '4': 1, '5': 2, '10': 'tcpPingVar'},
    const {'1': 'version', '3': 12, '4': 1, '5': 11, '6': '.MumbleProto.Version', '10': 'version'},
    const {'1': 'celt_versions', '3': 13, '4': 3, '5': 5, '10': 'celtVersions'},
    const {'1': 'address', '3': 14, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'bandwidth', '3': 15, '4': 1, '5': 13, '10': 'bandwidth'},
    const {'1': 'onlinesecs', '3': 16, '4': 1, '5': 13, '10': 'onlinesecs'},
    const {'1': 'idlesecs', '3': 17, '4': 1, '5': 13, '10': 'idlesecs'},
    const {'1': 'strong_certificate', '3': 18, '4': 1, '5': 8, '7': 'false', '10': 'strongCertificate'},
    const {'1': 'opus', '3': 19, '4': 1, '5': 8, '7': 'false', '10': 'opus'},
  ],
  '3': const [UserStats_Stats$json],
};

const UserStats_Stats$json = const {
  '1': 'Stats',
  '2': const [
    const {'1': 'good', '3': 1, '4': 1, '5': 13, '10': 'good'},
    const {'1': 'late', '3': 2, '4': 1, '5': 13, '10': 'late'},
    const {'1': 'lost', '3': 3, '4': 1, '5': 13, '10': 'lost'},
    const {'1': 'resync', '3': 4, '4': 1, '5': 13, '10': 'resync'},
  ],
};

const RequestBlob$json = const {
  '1': 'RequestBlob',
  '2': const [
    const {'1': 'session_texture', '3': 1, '4': 3, '5': 13, '10': 'sessionTexture'},
    const {'1': 'session_comment', '3': 2, '4': 3, '5': 13, '10': 'sessionComment'},
    const {'1': 'channel_description', '3': 3, '4': 3, '5': 13, '10': 'channelDescription'},
  ],
};

const ServerConfig$json = const {
  '1': 'ServerConfig',
  '2': const [
    const {'1': 'max_bandwidth', '3': 1, '4': 1, '5': 13, '10': 'maxBandwidth'},
    const {'1': 'welcome_text', '3': 2, '4': 1, '5': 9, '10': 'welcomeText'},
    const {'1': 'allow_html', '3': 3, '4': 1, '5': 8, '10': 'allowHtml'},
    const {'1': 'message_length', '3': 4, '4': 1, '5': 13, '10': 'messageLength'},
    const {'1': 'image_message_length', '3': 5, '4': 1, '5': 13, '10': 'imageMessageLength'},
    const {'1': 'max_users', '3': 6, '4': 1, '5': 13, '10': 'maxUsers'},
  ],
};

const SuggestConfig$json = const {
  '1': 'SuggestConfig',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'positional', '3': 2, '4': 1, '5': 8, '10': 'positional'},
    const {'1': 'push_to_talk', '3': 3, '4': 1, '5': 8, '10': 'pushToTalk'},
  ],
};

