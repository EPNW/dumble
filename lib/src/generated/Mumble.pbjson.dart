//
//  Generated code. Do not modify.
//  source: Mumble.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use versionDescriptor instead')
const Version$json = {
  '1': 'Version',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'release', '3': 2, '4': 1, '5': 9, '10': 'release'},
    {'1': 'os', '3': 3, '4': 1, '5': 9, '10': 'os'},
    {'1': 'os_version', '3': 4, '4': 1, '5': 9, '10': 'osVersion'},
  ],
};

/// Descriptor for `Version`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionDescriptor = $convert.base64Decode(
    'CgdWZXJzaW9uEhgKB3ZlcnNpb24YASABKA1SB3ZlcnNpb24SGAoHcmVsZWFzZRgCIAEoCVIHcm'
    'VsZWFzZRIOCgJvcxgDIAEoCVICb3MSHQoKb3NfdmVyc2lvbhgEIAEoCVIJb3NWZXJzaW9u');

@$core.Deprecated('Use uDPTunnelDescriptor instead')
const UDPTunnel$json = {
  '1': 'UDPTunnel',
  '2': [
    {'1': 'packet', '3': 1, '4': 2, '5': 12, '10': 'packet'},
  ],
};

/// Descriptor for `UDPTunnel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uDPTunnelDescriptor = $convert.base64Decode(
    'CglVRFBUdW5uZWwSFgoGcGFja2V0GAEgAigMUgZwYWNrZXQ=');

@$core.Deprecated('Use authenticateDescriptor instead')
const Authenticate$json = {
  '1': 'Authenticate',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'tokens', '3': 3, '4': 3, '5': 9, '10': 'tokens'},
    {'1': 'celt_versions', '3': 4, '4': 3, '5': 5, '10': 'celtVersions'},
    {'1': 'opus', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'opus'},
  ],
};

/// Descriptor for `Authenticate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateDescriptor = $convert.base64Decode(
    'CgxBdXRoZW50aWNhdGUSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZBIWCgZ0b2tlbnMYAyADKAlSBnRva2VucxIjCg1jZWx0X3ZlcnNpb25z'
    'GAQgAygFUgxjZWx0VmVyc2lvbnMSGQoEb3B1cxgFIAEoCDoFZmFsc2VSBG9wdXM=');

@$core.Deprecated('Use pingDescriptor instead')
const Ping$json = {
  '1': 'Ping',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 4, '10': 'timestamp'},
    {'1': 'good', '3': 2, '4': 1, '5': 13, '10': 'good'},
    {'1': 'late', '3': 3, '4': 1, '5': 13, '10': 'late'},
    {'1': 'lost', '3': 4, '4': 1, '5': 13, '10': 'lost'},
    {'1': 'resync', '3': 5, '4': 1, '5': 13, '10': 'resync'},
    {'1': 'udp_packets', '3': 6, '4': 1, '5': 13, '10': 'udpPackets'},
    {'1': 'tcp_packets', '3': 7, '4': 1, '5': 13, '10': 'tcpPackets'},
    {'1': 'udp_ping_avg', '3': 8, '4': 1, '5': 2, '10': 'udpPingAvg'},
    {'1': 'udp_ping_var', '3': 9, '4': 1, '5': 2, '10': 'udpPingVar'},
    {'1': 'tcp_ping_avg', '3': 10, '4': 1, '5': 2, '10': 'tcpPingAvg'},
    {'1': 'tcp_ping_var', '3': 11, '4': 1, '5': 2, '10': 'tcpPingVar'},
  ],
};

/// Descriptor for `Ping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingDescriptor = $convert.base64Decode(
    'CgRQaW5nEhwKCXRpbWVzdGFtcBgBIAEoBFIJdGltZXN0YW1wEhIKBGdvb2QYAiABKA1SBGdvb2'
    'QSEgoEbGF0ZRgDIAEoDVIEbGF0ZRISCgRsb3N0GAQgASgNUgRsb3N0EhYKBnJlc3luYxgFIAEo'
    'DVIGcmVzeW5jEh8KC3VkcF9wYWNrZXRzGAYgASgNUgp1ZHBQYWNrZXRzEh8KC3RjcF9wYWNrZX'
    'RzGAcgASgNUgp0Y3BQYWNrZXRzEiAKDHVkcF9waW5nX2F2ZxgIIAEoAlIKdWRwUGluZ0F2ZxIg'
    'Cgx1ZHBfcGluZ192YXIYCSABKAJSCnVkcFBpbmdWYXISIAoMdGNwX3BpbmdfYXZnGAogASgCUg'
    'p0Y3BQaW5nQXZnEiAKDHRjcF9waW5nX3ZhchgLIAEoAlIKdGNwUGluZ1Zhcg==');

@$core.Deprecated('Use rejectDescriptor instead')
const Reject$json = {
  '1': 'Reject',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.MumbleProto.Reject.RejectType', '10': 'type'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
  '4': [Reject_RejectType$json],
};

@$core.Deprecated('Use rejectDescriptor instead')
const Reject_RejectType$json = {
  '1': 'RejectType',
  '2': [
    {'1': 'None', '2': 0},
    {'1': 'WrongVersion', '2': 1},
    {'1': 'InvalidUsername', '2': 2},
    {'1': 'WrongUserPW', '2': 3},
    {'1': 'WrongServerPW', '2': 4},
    {'1': 'UsernameInUse', '2': 5},
    {'1': 'ServerFull', '2': 6},
    {'1': 'NoCertificate', '2': 7},
    {'1': 'AuthenticatorFail', '2': 8},
    {'1': 'UsernameCertMissmatch', '2': 9},
  ],
};

/// Descriptor for `Reject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rejectDescriptor = $convert.base64Decode(
    'CgZSZWplY3QSMgoEdHlwZRgBIAEoDjIeLk11bWJsZVByb3RvLlJlamVjdC5SZWplY3RUeXBlUg'
    'R0eXBlEhYKBnJlYXNvbhgCIAEoCVIGcmVhc29uIskBCgpSZWplY3RUeXBlEggKBE5vbmUQABIQ'
    'CgxXcm9uZ1ZlcnNpb24QARITCg9JbnZhbGlkVXNlcm5hbWUQAhIPCgtXcm9uZ1VzZXJQVxADEh'
    'EKDVdyb25nU2VydmVyUFcQBBIRCg1Vc2VybmFtZUluVXNlEAUSDgoKU2VydmVyRnVsbBAGEhEK'
    'DU5vQ2VydGlmaWNhdGUQBxIVChFBdXRoZW50aWNhdG9yRmFpbBAIEhkKFVVzZXJuYW1lQ2VydE'
    '1pc3NtYXRjaBAJ');

@$core.Deprecated('Use serverSyncDescriptor instead')
const ServerSync$json = {
  '1': 'ServerSync',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    {'1': 'max_bandwidth', '3': 2, '4': 1, '5': 13, '10': 'maxBandwidth'},
    {'1': 'welcome_text', '3': 3, '4': 1, '5': 9, '10': 'welcomeText'},
    {'1': 'permissions', '3': 4, '4': 1, '5': 4, '10': 'permissions'},
  ],
};

/// Descriptor for `ServerSync`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverSyncDescriptor = $convert.base64Decode(
    'CgpTZXJ2ZXJTeW5jEhgKB3Nlc3Npb24YASABKA1SB3Nlc3Npb24SIwoNbWF4X2JhbmR3aWR0aB'
    'gCIAEoDVIMbWF4QmFuZHdpZHRoEiEKDHdlbGNvbWVfdGV4dBgDIAEoCVILd2VsY29tZVRleHQS'
    'IAoLcGVybWlzc2lvbnMYBCABKARSC3Blcm1pc3Npb25z');

@$core.Deprecated('Use channelRemoveDescriptor instead')
const ChannelRemove$json = {
  '1': 'ChannelRemove',
  '2': [
    {'1': 'channel_id', '3': 1, '4': 2, '5': 13, '10': 'channelId'},
  ],
};

/// Descriptor for `ChannelRemove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelRemoveDescriptor = $convert.base64Decode(
    'Cg1DaGFubmVsUmVtb3ZlEh0KCmNoYW5uZWxfaWQYASACKA1SCWNoYW5uZWxJZA==');

@$core.Deprecated('Use channelStateDescriptor instead')
const ChannelState$json = {
  '1': 'ChannelState',
  '2': [
    {'1': 'channel_id', '3': 1, '4': 1, '5': 13, '10': 'channelId'},
    {'1': 'parent', '3': 2, '4': 1, '5': 13, '10': 'parent'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'links', '3': 4, '4': 3, '5': 13, '10': 'links'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    {'1': 'links_add', '3': 6, '4': 3, '5': 13, '10': 'linksAdd'},
    {'1': 'links_remove', '3': 7, '4': 3, '5': 13, '10': 'linksRemove'},
    {'1': 'temporary', '3': 8, '4': 1, '5': 8, '7': 'false', '10': 'temporary'},
    {'1': 'position', '3': 9, '4': 1, '5': 5, '7': '0', '10': 'position'},
    {'1': 'description_hash', '3': 10, '4': 1, '5': 12, '10': 'descriptionHash'},
    {'1': 'max_users', '3': 11, '4': 1, '5': 13, '10': 'maxUsers'},
    {'1': 'is_enter_restricted', '3': 12, '4': 1, '5': 8, '10': 'isEnterRestricted'},
    {'1': 'can_enter', '3': 13, '4': 1, '5': 8, '10': 'canEnter'},
  ],
};

/// Descriptor for `ChannelState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelStateDescriptor = $convert.base64Decode(
    'CgxDaGFubmVsU3RhdGUSHQoKY2hhbm5lbF9pZBgBIAEoDVIJY2hhbm5lbElkEhYKBnBhcmVudB'
    'gCIAEoDVIGcGFyZW50EhIKBG5hbWUYAyABKAlSBG5hbWUSFAoFbGlua3MYBCADKA1SBWxpbmtz'
    'EiAKC2Rlc2NyaXB0aW9uGAUgASgJUgtkZXNjcmlwdGlvbhIbCglsaW5rc19hZGQYBiADKA1SCG'
    'xpbmtzQWRkEiEKDGxpbmtzX3JlbW92ZRgHIAMoDVILbGlua3NSZW1vdmUSIwoJdGVtcG9yYXJ5'
    'GAggASgIOgVmYWxzZVIJdGVtcG9yYXJ5Eh0KCHBvc2l0aW9uGAkgASgFOgEwUghwb3NpdGlvbh'
    'IpChBkZXNjcmlwdGlvbl9oYXNoGAogASgMUg9kZXNjcmlwdGlvbkhhc2gSGwoJbWF4X3VzZXJz'
    'GAsgASgNUghtYXhVc2VycxIuChNpc19lbnRlcl9yZXN0cmljdGVkGAwgASgIUhFpc0VudGVyUm'
    'VzdHJpY3RlZBIbCgljYW5fZW50ZXIYDSABKAhSCGNhbkVudGVy');

@$core.Deprecated('Use userRemoveDescriptor instead')
const UserRemove$json = {
  '1': 'UserRemove',
  '2': [
    {'1': 'session', '3': 1, '4': 2, '5': 13, '10': 'session'},
    {'1': 'actor', '3': 2, '4': 1, '5': 13, '10': 'actor'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'ban', '3': 4, '4': 1, '5': 8, '10': 'ban'},
  ],
};

/// Descriptor for `UserRemove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRemoveDescriptor = $convert.base64Decode(
    'CgpVc2VyUmVtb3ZlEhgKB3Nlc3Npb24YASACKA1SB3Nlc3Npb24SFAoFYWN0b3IYAiABKA1SBW'
    'FjdG9yEhYKBnJlYXNvbhgDIAEoCVIGcmVhc29uEhAKA2JhbhgEIAEoCFIDYmFu');

@$core.Deprecated('Use userStateDescriptor instead')
const UserState$json = {
  '1': 'UserState',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    {'1': 'actor', '3': 2, '4': 1, '5': 13, '10': 'actor'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'channel_id', '3': 5, '4': 1, '5': 13, '10': 'channelId'},
    {'1': 'mute', '3': 6, '4': 1, '5': 8, '10': 'mute'},
    {'1': 'deaf', '3': 7, '4': 1, '5': 8, '10': 'deaf'},
    {'1': 'suppress', '3': 8, '4': 1, '5': 8, '10': 'suppress'},
    {'1': 'self_mute', '3': 9, '4': 1, '5': 8, '10': 'selfMute'},
    {'1': 'self_deaf', '3': 10, '4': 1, '5': 8, '10': 'selfDeaf'},
    {'1': 'texture', '3': 11, '4': 1, '5': 12, '10': 'texture'},
    {'1': 'plugin_context', '3': 12, '4': 1, '5': 12, '10': 'pluginContext'},
    {'1': 'plugin_identity', '3': 13, '4': 1, '5': 9, '10': 'pluginIdentity'},
    {'1': 'comment', '3': 14, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'hash', '3': 15, '4': 1, '5': 9, '10': 'hash'},
    {'1': 'comment_hash', '3': 16, '4': 1, '5': 12, '10': 'commentHash'},
    {'1': 'texture_hash', '3': 17, '4': 1, '5': 12, '10': 'textureHash'},
    {'1': 'priority_speaker', '3': 18, '4': 1, '5': 8, '10': 'prioritySpeaker'},
    {'1': 'recording', '3': 19, '4': 1, '5': 8, '10': 'recording'},
    {'1': 'temporary_access_tokens', '3': 20, '4': 3, '5': 9, '10': 'temporaryAccessTokens'},
    {'1': 'listening_channel_add', '3': 21, '4': 3, '5': 13, '10': 'listeningChannelAdd'},
    {'1': 'listening_channel_remove', '3': 22, '4': 3, '5': 13, '10': 'listeningChannelRemove'},
  ],
};

/// Descriptor for `UserState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userStateDescriptor = $convert.base64Decode(
    'CglVc2VyU3RhdGUSGAoHc2Vzc2lvbhgBIAEoDVIHc2Vzc2lvbhIUCgVhY3RvchgCIAEoDVIFYW'
    'N0b3ISEgoEbmFtZRgDIAEoCVIEbmFtZRIXCgd1c2VyX2lkGAQgASgNUgZ1c2VySWQSHQoKY2hh'
    'bm5lbF9pZBgFIAEoDVIJY2hhbm5lbElkEhIKBG11dGUYBiABKAhSBG11dGUSEgoEZGVhZhgHIA'
    'EoCFIEZGVhZhIaCghzdXBwcmVzcxgIIAEoCFIIc3VwcHJlc3MSGwoJc2VsZl9tdXRlGAkgASgI'
    'UghzZWxmTXV0ZRIbCglzZWxmX2RlYWYYCiABKAhSCHNlbGZEZWFmEhgKB3RleHR1cmUYCyABKA'
    'xSB3RleHR1cmUSJQoOcGx1Z2luX2NvbnRleHQYDCABKAxSDXBsdWdpbkNvbnRleHQSJwoPcGx1'
    'Z2luX2lkZW50aXR5GA0gASgJUg5wbHVnaW5JZGVudGl0eRIYCgdjb21tZW50GA4gASgJUgdjb2'
    '1tZW50EhIKBGhhc2gYDyABKAlSBGhhc2gSIQoMY29tbWVudF9oYXNoGBAgASgMUgtjb21tZW50'
    'SGFzaBIhCgx0ZXh0dXJlX2hhc2gYESABKAxSC3RleHR1cmVIYXNoEikKEHByaW9yaXR5X3NwZW'
    'FrZXIYEiABKAhSD3ByaW9yaXR5U3BlYWtlchIcCglyZWNvcmRpbmcYEyABKAhSCXJlY29yZGlu'
    'ZxI2Chd0ZW1wb3JhcnlfYWNjZXNzX3Rva2VucxgUIAMoCVIVdGVtcG9yYXJ5QWNjZXNzVG9rZW'
    '5zEjIKFWxpc3RlbmluZ19jaGFubmVsX2FkZBgVIAMoDVITbGlzdGVuaW5nQ2hhbm5lbEFkZBI4'
    'ChhsaXN0ZW5pbmdfY2hhbm5lbF9yZW1vdmUYFiADKA1SFmxpc3RlbmluZ0NoYW5uZWxSZW1vdm'
    'U=');

@$core.Deprecated('Use banListDescriptor instead')
const BanList$json = {
  '1': 'BanList',
  '2': [
    {'1': 'bans', '3': 1, '4': 3, '5': 11, '6': '.MumbleProto.BanList.BanEntry', '10': 'bans'},
    {'1': 'query', '3': 2, '4': 1, '5': 8, '7': 'false', '10': 'query'},
  ],
  '3': [BanList_BanEntry$json],
};

@$core.Deprecated('Use banListDescriptor instead')
const BanList_BanEntry$json = {
  '1': 'BanEntry',
  '2': [
    {'1': 'address', '3': 1, '4': 2, '5': 12, '10': 'address'},
    {'1': 'mask', '3': 2, '4': 2, '5': 13, '10': 'mask'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'hash', '3': 4, '4': 1, '5': 9, '10': 'hash'},
    {'1': 'reason', '3': 5, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'start', '3': 6, '4': 1, '5': 9, '10': 'start'},
    {'1': 'duration', '3': 7, '4': 1, '5': 13, '10': 'duration'},
  ],
};

/// Descriptor for `BanList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List banListDescriptor = $convert.base64Decode(
    'CgdCYW5MaXN0EjEKBGJhbnMYASADKAsyHS5NdW1ibGVQcm90by5CYW5MaXN0LkJhbkVudHJ5Ug'
    'RiYW5zEhsKBXF1ZXJ5GAIgASgIOgVmYWxzZVIFcXVlcnkaqgEKCEJhbkVudHJ5EhgKB2FkZHJl'
    'c3MYASACKAxSB2FkZHJlc3MSEgoEbWFzaxgCIAIoDVIEbWFzaxISCgRuYW1lGAMgASgJUgRuYW'
    '1lEhIKBGhhc2gYBCABKAlSBGhhc2gSFgoGcmVhc29uGAUgASgJUgZyZWFzb24SFAoFc3RhcnQY'
    'BiABKAlSBXN0YXJ0EhoKCGR1cmF0aW9uGAcgASgNUghkdXJhdGlvbg==');

@$core.Deprecated('Use textMessageDescriptor instead')
const TextMessage$json = {
  '1': 'TextMessage',
  '2': [
    {'1': 'actor', '3': 1, '4': 1, '5': 13, '10': 'actor'},
    {'1': 'session', '3': 2, '4': 3, '5': 13, '10': 'session'},
    {'1': 'channel_id', '3': 3, '4': 3, '5': 13, '10': 'channelId'},
    {'1': 'tree_id', '3': 4, '4': 3, '5': 13, '10': 'treeId'},
    {'1': 'message', '3': 5, '4': 2, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `TextMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMessageDescriptor = $convert.base64Decode(
    'CgtUZXh0TWVzc2FnZRIUCgVhY3RvchgBIAEoDVIFYWN0b3ISGAoHc2Vzc2lvbhgCIAMoDVIHc2'
    'Vzc2lvbhIdCgpjaGFubmVsX2lkGAMgAygNUgljaGFubmVsSWQSFwoHdHJlZV9pZBgEIAMoDVIG'
    'dHJlZUlkEhgKB21lc3NhZ2UYBSACKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use permissionDeniedDescriptor instead')
const PermissionDenied$json = {
  '1': 'PermissionDenied',
  '2': [
    {'1': 'permission', '3': 1, '4': 1, '5': 13, '10': 'permission'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 13, '10': 'channelId'},
    {'1': 'session', '3': 3, '4': 1, '5': 13, '10': 'session'},
    {'1': 'reason', '3': 4, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.MumbleProto.PermissionDenied.DenyType', '10': 'type'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
  ],
  '4': [PermissionDenied_DenyType$json],
};

@$core.Deprecated('Use permissionDeniedDescriptor instead')
const PermissionDenied_DenyType$json = {
  '1': 'DenyType',
  '2': [
    {'1': 'Text', '2': 0},
    {'1': 'Permission', '2': 1},
    {'1': 'SuperUser', '2': 2},
    {'1': 'ChannelName', '2': 3},
    {'1': 'TextTooLong', '2': 4},
    {'1': 'H9K', '2': 5},
    {'1': 'TemporaryChannel', '2': 6},
    {'1': 'MissingCertificate', '2': 7},
    {'1': 'UserName', '2': 8},
    {'1': 'ChannelFull', '2': 9},
    {'1': 'NestingLimit', '2': 10},
    {'1': 'ChannelCountLimit', '2': 11},
    {'1': 'ChannelListenerLimit', '2': 12},
    {'1': 'UserListenerLimit', '2': 13},
  ],
};

/// Descriptor for `PermissionDenied`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDeniedDescriptor = $convert.base64Decode(
    'ChBQZXJtaXNzaW9uRGVuaWVkEh4KCnBlcm1pc3Npb24YASABKA1SCnBlcm1pc3Npb24SHQoKY2'
    'hhbm5lbF9pZBgCIAEoDVIJY2hhbm5lbElkEhgKB3Nlc3Npb24YAyABKA1SB3Nlc3Npb24SFgoG'
    'cmVhc29uGAQgASgJUgZyZWFzb24SOgoEdHlwZRgFIAEoDjImLk11bWJsZVByb3RvLlBlcm1pc3'
    'Npb25EZW5pZWQuRGVueVR5cGVSBHR5cGUSEgoEbmFtZRgGIAEoCVIEbmFtZSKFAgoIRGVueVR5'
    'cGUSCAoEVGV4dBAAEg4KClBlcm1pc3Npb24QARINCglTdXBlclVzZXIQAhIPCgtDaGFubmVsTm'
    'FtZRADEg8KC1RleHRUb29Mb25nEAQSBwoDSDlLEAUSFAoQVGVtcG9yYXJ5Q2hhbm5lbBAGEhYK'
    'Ek1pc3NpbmdDZXJ0aWZpY2F0ZRAHEgwKCFVzZXJOYW1lEAgSDwoLQ2hhbm5lbEZ1bGwQCRIQCg'
    'xOZXN0aW5nTGltaXQQChIVChFDaGFubmVsQ291bnRMaW1pdBALEhgKFENoYW5uZWxMaXN0ZW5l'
    'ckxpbWl0EAwSFQoRVXNlckxpc3RlbmVyTGltaXQQDQ==');

@$core.Deprecated('Use aCLDescriptor instead')
const ACL$json = {
  '1': 'ACL',
  '2': [
    {'1': 'channel_id', '3': 1, '4': 2, '5': 13, '10': 'channelId'},
    {'1': 'inherit_acls', '3': 2, '4': 1, '5': 8, '7': 'true', '10': 'inheritAcls'},
    {'1': 'groups', '3': 3, '4': 3, '5': 11, '6': '.MumbleProto.ACL.ChanGroup', '10': 'groups'},
    {'1': 'acls', '3': 4, '4': 3, '5': 11, '6': '.MumbleProto.ACL.ChanACL', '10': 'acls'},
    {'1': 'query', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'query'},
  ],
  '3': [ACL_ChanGroup$json, ACL_ChanACL$json],
};

@$core.Deprecated('Use aCLDescriptor instead')
const ACL_ChanGroup$json = {
  '1': 'ChanGroup',
  '2': [
    {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
    {'1': 'inherited', '3': 2, '4': 1, '5': 8, '7': 'true', '10': 'inherited'},
    {'1': 'inherit', '3': 3, '4': 1, '5': 8, '7': 'true', '10': 'inherit'},
    {'1': 'inheritable', '3': 4, '4': 1, '5': 8, '7': 'true', '10': 'inheritable'},
    {'1': 'add', '3': 5, '4': 3, '5': 13, '10': 'add'},
    {'1': 'remove', '3': 6, '4': 3, '5': 13, '10': 'remove'},
    {'1': 'inherited_members', '3': 7, '4': 3, '5': 13, '10': 'inheritedMembers'},
  ],
};

@$core.Deprecated('Use aCLDescriptor instead')
const ACL_ChanACL$json = {
  '1': 'ChanACL',
  '2': [
    {'1': 'apply_here', '3': 1, '4': 1, '5': 8, '7': 'true', '10': 'applyHere'},
    {'1': 'apply_subs', '3': 2, '4': 1, '5': 8, '7': 'true', '10': 'applySubs'},
    {'1': 'inherited', '3': 3, '4': 1, '5': 8, '7': 'true', '10': 'inherited'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'group', '3': 5, '4': 1, '5': 9, '10': 'group'},
    {'1': 'grant', '3': 6, '4': 1, '5': 13, '10': 'grant'},
    {'1': 'deny', '3': 7, '4': 1, '5': 13, '10': 'deny'},
  ],
};

/// Descriptor for `ACL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aCLDescriptor = $convert.base64Decode(
    'CgNBQ0wSHQoKY2hhbm5lbF9pZBgBIAIoDVIJY2hhbm5lbElkEicKDGluaGVyaXRfYWNscxgCIA'
    'EoCDoEdHJ1ZVILaW5oZXJpdEFjbHMSMgoGZ3JvdXBzGAMgAygLMhouTXVtYmxlUHJvdG8uQUNM'
    'LkNoYW5Hcm91cFIGZ3JvdXBzEiwKBGFjbHMYBCADKAsyGC5NdW1ibGVQcm90by5BQ0wuQ2hhbk'
    'FDTFIEYWNscxIbCgVxdWVyeRgFIAEoCDoFZmFsc2VSBXF1ZXJ5GuIBCglDaGFuR3JvdXASEgoE'
    'bmFtZRgBIAIoCVIEbmFtZRIiCglpbmhlcml0ZWQYAiABKAg6BHRydWVSCWluaGVyaXRlZBIeCg'
    'dpbmhlcml0GAMgASgIOgR0cnVlUgdpbmhlcml0EiYKC2luaGVyaXRhYmxlGAQgASgIOgR0cnVl'
    'Ugtpbmhlcml0YWJsZRIQCgNhZGQYBSADKA1SA2FkZBIWCgZyZW1vdmUYBiADKA1SBnJlbW92ZR'
    'IrChFpbmhlcml0ZWRfbWVtYmVycxgHIAMoDVIQaW5oZXJpdGVkTWVtYmVycxrQAQoHQ2hhbkFD'
    'TBIjCgphcHBseV9oZXJlGAEgASgIOgR0cnVlUglhcHBseUhlcmUSIwoKYXBwbHlfc3VicxgCIA'
    'EoCDoEdHJ1ZVIJYXBwbHlTdWJzEiIKCWluaGVyaXRlZBgDIAEoCDoEdHJ1ZVIJaW5oZXJpdGVk'
    'EhcKB3VzZXJfaWQYBCABKA1SBnVzZXJJZBIUCgVncm91cBgFIAEoCVIFZ3JvdXASFAoFZ3Jhbn'
    'QYBiABKA1SBWdyYW50EhIKBGRlbnkYByABKA1SBGRlbnk=');

@$core.Deprecated('Use queryUsersDescriptor instead')
const QueryUsers$json = {
  '1': 'QueryUsers',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 13, '10': 'ids'},
    {'1': 'names', '3': 2, '4': 3, '5': 9, '10': 'names'},
  ],
};

/// Descriptor for `QueryUsers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUsersDescriptor = $convert.base64Decode(
    'CgpRdWVyeVVzZXJzEhAKA2lkcxgBIAMoDVIDaWRzEhQKBW5hbWVzGAIgAygJUgVuYW1lcw==');

@$core.Deprecated('Use cryptSetupDescriptor instead')
const CryptSetup$json = {
  '1': 'CryptSetup',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    {'1': 'client_nonce', '3': 2, '4': 1, '5': 12, '10': 'clientNonce'},
    {'1': 'server_nonce', '3': 3, '4': 1, '5': 12, '10': 'serverNonce'},
  ],
};

/// Descriptor for `CryptSetup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cryptSetupDescriptor = $convert.base64Decode(
    'CgpDcnlwdFNldHVwEhAKA2tleRgBIAEoDFIDa2V5EiEKDGNsaWVudF9ub25jZRgCIAEoDFILY2'
    'xpZW50Tm9uY2USIQoMc2VydmVyX25vbmNlGAMgASgMUgtzZXJ2ZXJOb25jZQ==');

@$core.Deprecated('Use contextActionModifyDescriptor instead')
const ContextActionModify$json = {
  '1': 'ContextActionModify',
  '2': [
    {'1': 'action', '3': 1, '4': 2, '5': 9, '10': 'action'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'context', '3': 3, '4': 1, '5': 13, '10': 'context'},
    {'1': 'operation', '3': 4, '4': 1, '5': 14, '6': '.MumbleProto.ContextActionModify.Operation', '10': 'operation'},
  ],
  '4': [ContextActionModify_Context$json, ContextActionModify_Operation$json],
};

@$core.Deprecated('Use contextActionModifyDescriptor instead')
const ContextActionModify_Context$json = {
  '1': 'Context',
  '2': [
    {'1': 'Server', '2': 1},
    {'1': 'Channel', '2': 2},
    {'1': 'User', '2': 4},
  ],
};

@$core.Deprecated('Use contextActionModifyDescriptor instead')
const ContextActionModify_Operation$json = {
  '1': 'Operation',
  '2': [
    {'1': 'Add', '2': 0},
    {'1': 'Remove', '2': 1},
  ],
};

/// Descriptor for `ContextActionModify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contextActionModifyDescriptor = $convert.base64Decode(
    'ChNDb250ZXh0QWN0aW9uTW9kaWZ5EhYKBmFjdGlvbhgBIAIoCVIGYWN0aW9uEhIKBHRleHQYAi'
    'ABKAlSBHRleHQSGAoHY29udGV4dBgDIAEoDVIHY29udGV4dBJICglvcGVyYXRpb24YBCABKA4y'
    'Ki5NdW1ibGVQcm90by5Db250ZXh0QWN0aW9uTW9kaWZ5Lk9wZXJhdGlvblIJb3BlcmF0aW9uIi'
    'wKB0NvbnRleHQSCgoGU2VydmVyEAESCwoHQ2hhbm5lbBACEggKBFVzZXIQBCIgCglPcGVyYXRp'
    'b24SBwoDQWRkEAASCgoGUmVtb3ZlEAE=');

@$core.Deprecated('Use contextActionDescriptor instead')
const ContextAction$json = {
  '1': 'ContextAction',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 13, '10': 'channelId'},
    {'1': 'action', '3': 3, '4': 2, '5': 9, '10': 'action'},
  ],
};

/// Descriptor for `ContextAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contextActionDescriptor = $convert.base64Decode(
    'Cg1Db250ZXh0QWN0aW9uEhgKB3Nlc3Npb24YASABKA1SB3Nlc3Npb24SHQoKY2hhbm5lbF9pZB'
    'gCIAEoDVIJY2hhbm5lbElkEhYKBmFjdGlvbhgDIAIoCVIGYWN0aW9u');

@$core.Deprecated('Use userListDescriptor instead')
const UserList$json = {
  '1': 'UserList',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.MumbleProto.UserList.User', '10': 'users'},
  ],
  '3': [UserList_User$json],
};

@$core.Deprecated('Use userListDescriptor instead')
const UserList_User$json = {
  '1': 'User',
  '2': [
    {'1': 'user_id', '3': 1, '4': 2, '5': 13, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'last_seen', '3': 3, '4': 1, '5': 9, '10': 'lastSeen'},
    {'1': 'last_channel', '3': 4, '4': 1, '5': 13, '10': 'lastChannel'},
  ],
};

/// Descriptor for `UserList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userListDescriptor = $convert.base64Decode(
    'CghVc2VyTGlzdBIwCgV1c2VycxgBIAMoCzIaLk11bWJsZVByb3RvLlVzZXJMaXN0LlVzZXJSBX'
    'VzZXJzGnMKBFVzZXISFwoHdXNlcl9pZBgBIAIoDVIGdXNlcklkEhIKBG5hbWUYAiABKAlSBG5h'
    'bWUSGwoJbGFzdF9zZWVuGAMgASgJUghsYXN0U2VlbhIhCgxsYXN0X2NoYW5uZWwYBCABKA1SC2'
    'xhc3RDaGFubmVs');

@$core.Deprecated('Use voiceTargetDescriptor instead')
const VoiceTarget$json = {
  '1': 'VoiceTarget',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'targets', '3': 2, '4': 3, '5': 11, '6': '.MumbleProto.VoiceTarget.Target', '10': 'targets'},
  ],
  '3': [VoiceTarget_Target$json],
};

@$core.Deprecated('Use voiceTargetDescriptor instead')
const VoiceTarget_Target$json = {
  '1': 'Target',
  '2': [
    {'1': 'session', '3': 1, '4': 3, '5': 13, '10': 'session'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 13, '10': 'channelId'},
    {'1': 'group', '3': 3, '4': 1, '5': 9, '10': 'group'},
    {'1': 'links', '3': 4, '4': 1, '5': 8, '7': 'false', '10': 'links'},
    {'1': 'children', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'children'},
  ],
};

/// Descriptor for `VoiceTarget`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceTargetDescriptor = $convert.base64Decode(
    'CgtWb2ljZVRhcmdldBIOCgJpZBgBIAEoDVICaWQSOQoHdGFyZ2V0cxgCIAMoCzIfLk11bWJsZV'
    'Byb3RvLlZvaWNlVGFyZ2V0LlRhcmdldFIHdGFyZ2V0cxqXAQoGVGFyZ2V0EhgKB3Nlc3Npb24Y'
    'ASADKA1SB3Nlc3Npb24SHQoKY2hhbm5lbF9pZBgCIAEoDVIJY2hhbm5lbElkEhQKBWdyb3VwGA'
    'MgASgJUgVncm91cBIbCgVsaW5rcxgEIAEoCDoFZmFsc2VSBWxpbmtzEiEKCGNoaWxkcmVuGAUg'
    'ASgIOgVmYWxzZVIIY2hpbGRyZW4=');

@$core.Deprecated('Use permissionQueryDescriptor instead')
const PermissionQuery$json = {
  '1': 'PermissionQuery',
  '2': [
    {'1': 'channel_id', '3': 1, '4': 1, '5': 13, '10': 'channelId'},
    {'1': 'permissions', '3': 2, '4': 1, '5': 13, '10': 'permissions'},
    {'1': 'flush', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'flush'},
  ],
};

/// Descriptor for `PermissionQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionQueryDescriptor = $convert.base64Decode(
    'Cg9QZXJtaXNzaW9uUXVlcnkSHQoKY2hhbm5lbF9pZBgBIAEoDVIJY2hhbm5lbElkEiAKC3Blcm'
    '1pc3Npb25zGAIgASgNUgtwZXJtaXNzaW9ucxIbCgVmbHVzaBgDIAEoCDoFZmFsc2VSBWZsdXNo');

@$core.Deprecated('Use codecVersionDescriptor instead')
const CodecVersion$json = {
  '1': 'CodecVersion',
  '2': [
    {'1': 'alpha', '3': 1, '4': 2, '5': 5, '10': 'alpha'},
    {'1': 'beta', '3': 2, '4': 2, '5': 5, '10': 'beta'},
    {'1': 'prefer_alpha', '3': 3, '4': 2, '5': 8, '7': 'true', '10': 'preferAlpha'},
    {'1': 'opus', '3': 4, '4': 1, '5': 8, '7': 'false', '10': 'opus'},
  ],
};

/// Descriptor for `CodecVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List codecVersionDescriptor = $convert.base64Decode(
    'CgxDb2RlY1ZlcnNpb24SFAoFYWxwaGEYASACKAVSBWFscGhhEhIKBGJldGEYAiACKAVSBGJldG'
    'ESJwoMcHJlZmVyX2FscGhhGAMgAigIOgR0cnVlUgtwcmVmZXJBbHBoYRIZCgRvcHVzGAQgASgI'
    'OgVmYWxzZVIEb3B1cw==');

@$core.Deprecated('Use userStatsDescriptor instead')
const UserStats$json = {
  '1': 'UserStats',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 13, '10': 'session'},
    {'1': 'stats_only', '3': 2, '4': 1, '5': 8, '7': 'false', '10': 'statsOnly'},
    {'1': 'certificates', '3': 3, '4': 3, '5': 12, '10': 'certificates'},
    {'1': 'from_client', '3': 4, '4': 1, '5': 11, '6': '.MumbleProto.UserStats.Stats', '10': 'fromClient'},
    {'1': 'from_server', '3': 5, '4': 1, '5': 11, '6': '.MumbleProto.UserStats.Stats', '10': 'fromServer'},
    {'1': 'udp_packets', '3': 6, '4': 1, '5': 13, '10': 'udpPackets'},
    {'1': 'tcp_packets', '3': 7, '4': 1, '5': 13, '10': 'tcpPackets'},
    {'1': 'udp_ping_avg', '3': 8, '4': 1, '5': 2, '10': 'udpPingAvg'},
    {'1': 'udp_ping_var', '3': 9, '4': 1, '5': 2, '10': 'udpPingVar'},
    {'1': 'tcp_ping_avg', '3': 10, '4': 1, '5': 2, '10': 'tcpPingAvg'},
    {'1': 'tcp_ping_var', '3': 11, '4': 1, '5': 2, '10': 'tcpPingVar'},
    {'1': 'version', '3': 12, '4': 1, '5': 11, '6': '.MumbleProto.Version', '10': 'version'},
    {'1': 'celt_versions', '3': 13, '4': 3, '5': 5, '10': 'celtVersions'},
    {'1': 'address', '3': 14, '4': 1, '5': 12, '10': 'address'},
    {'1': 'bandwidth', '3': 15, '4': 1, '5': 13, '10': 'bandwidth'},
    {'1': 'onlinesecs', '3': 16, '4': 1, '5': 13, '10': 'onlinesecs'},
    {'1': 'idlesecs', '3': 17, '4': 1, '5': 13, '10': 'idlesecs'},
    {'1': 'strong_certificate', '3': 18, '4': 1, '5': 8, '7': 'false', '10': 'strongCertificate'},
    {'1': 'opus', '3': 19, '4': 1, '5': 8, '7': 'false', '10': 'opus'},
  ],
  '3': [UserStats_Stats$json],
};

@$core.Deprecated('Use userStatsDescriptor instead')
const UserStats_Stats$json = {
  '1': 'Stats',
  '2': [
    {'1': 'good', '3': 1, '4': 1, '5': 13, '10': 'good'},
    {'1': 'late', '3': 2, '4': 1, '5': 13, '10': 'late'},
    {'1': 'lost', '3': 3, '4': 1, '5': 13, '10': 'lost'},
    {'1': 'resync', '3': 4, '4': 1, '5': 13, '10': 'resync'},
  ],
};

/// Descriptor for `UserStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userStatsDescriptor = $convert.base64Decode(
    'CglVc2VyU3RhdHMSGAoHc2Vzc2lvbhgBIAEoDVIHc2Vzc2lvbhIkCgpzdGF0c19vbmx5GAIgAS'
    'gIOgVmYWxzZVIJc3RhdHNPbmx5EiIKDGNlcnRpZmljYXRlcxgDIAMoDFIMY2VydGlmaWNhdGVz'
    'Ej0KC2Zyb21fY2xpZW50GAQgASgLMhwuTXVtYmxlUHJvdG8uVXNlclN0YXRzLlN0YXRzUgpmcm'
    '9tQ2xpZW50Ej0KC2Zyb21fc2VydmVyGAUgASgLMhwuTXVtYmxlUHJvdG8uVXNlclN0YXRzLlN0'
    'YXRzUgpmcm9tU2VydmVyEh8KC3VkcF9wYWNrZXRzGAYgASgNUgp1ZHBQYWNrZXRzEh8KC3RjcF'
    '9wYWNrZXRzGAcgASgNUgp0Y3BQYWNrZXRzEiAKDHVkcF9waW5nX2F2ZxgIIAEoAlIKdWRwUGlu'
    'Z0F2ZxIgCgx1ZHBfcGluZ192YXIYCSABKAJSCnVkcFBpbmdWYXISIAoMdGNwX3BpbmdfYXZnGA'
    'ogASgCUgp0Y3BQaW5nQXZnEiAKDHRjcF9waW5nX3ZhchgLIAEoAlIKdGNwUGluZ1ZhchIuCgd2'
    'ZXJzaW9uGAwgASgLMhQuTXVtYmxlUHJvdG8uVmVyc2lvblIHdmVyc2lvbhIjCg1jZWx0X3Zlcn'
    'Npb25zGA0gAygFUgxjZWx0VmVyc2lvbnMSGAoHYWRkcmVzcxgOIAEoDFIHYWRkcmVzcxIcCgli'
    'YW5kd2lkdGgYDyABKA1SCWJhbmR3aWR0aBIeCgpvbmxpbmVzZWNzGBAgASgNUgpvbmxpbmVzZW'
    'NzEhoKCGlkbGVzZWNzGBEgASgNUghpZGxlc2VjcxI0ChJzdHJvbmdfY2VydGlmaWNhdGUYEiAB'
    'KAg6BWZhbHNlUhFzdHJvbmdDZXJ0aWZpY2F0ZRIZCgRvcHVzGBMgASgIOgVmYWxzZVIEb3B1cx'
    'pbCgVTdGF0cxISCgRnb29kGAEgASgNUgRnb29kEhIKBGxhdGUYAiABKA1SBGxhdGUSEgoEbG9z'
    'dBgDIAEoDVIEbG9zdBIWCgZyZXN5bmMYBCABKA1SBnJlc3luYw==');

@$core.Deprecated('Use requestBlobDescriptor instead')
const RequestBlob$json = {
  '1': 'RequestBlob',
  '2': [
    {'1': 'session_texture', '3': 1, '4': 3, '5': 13, '10': 'sessionTexture'},
    {'1': 'session_comment', '3': 2, '4': 3, '5': 13, '10': 'sessionComment'},
    {'1': 'channel_description', '3': 3, '4': 3, '5': 13, '10': 'channelDescription'},
  ],
};

/// Descriptor for `RequestBlob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestBlobDescriptor = $convert.base64Decode(
    'CgtSZXF1ZXN0QmxvYhInCg9zZXNzaW9uX3RleHR1cmUYASADKA1SDnNlc3Npb25UZXh0dXJlEi'
    'cKD3Nlc3Npb25fY29tbWVudBgCIAMoDVIOc2Vzc2lvbkNvbW1lbnQSLwoTY2hhbm5lbF9kZXNj'
    'cmlwdGlvbhgDIAMoDVISY2hhbm5lbERlc2NyaXB0aW9u');

@$core.Deprecated('Use serverConfigDescriptor instead')
const ServerConfig$json = {
  '1': 'ServerConfig',
  '2': [
    {'1': 'max_bandwidth', '3': 1, '4': 1, '5': 13, '10': 'maxBandwidth'},
    {'1': 'welcome_text', '3': 2, '4': 1, '5': 9, '10': 'welcomeText'},
    {'1': 'allow_html', '3': 3, '4': 1, '5': 8, '10': 'allowHtml'},
    {'1': 'message_length', '3': 4, '4': 1, '5': 13, '10': 'messageLength'},
    {'1': 'image_message_length', '3': 5, '4': 1, '5': 13, '10': 'imageMessageLength'},
    {'1': 'max_users', '3': 6, '4': 1, '5': 13, '10': 'maxUsers'},
  ],
};

/// Descriptor for `ServerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverConfigDescriptor = $convert.base64Decode(
    'CgxTZXJ2ZXJDb25maWcSIwoNbWF4X2JhbmR3aWR0aBgBIAEoDVIMbWF4QmFuZHdpZHRoEiEKDH'
    'dlbGNvbWVfdGV4dBgCIAEoCVILd2VsY29tZVRleHQSHQoKYWxsb3dfaHRtbBgDIAEoCFIJYWxs'
    'b3dIdG1sEiUKDm1lc3NhZ2VfbGVuZ3RoGAQgASgNUg1tZXNzYWdlTGVuZ3RoEjAKFGltYWdlX2'
    '1lc3NhZ2VfbGVuZ3RoGAUgASgNUhJpbWFnZU1lc3NhZ2VMZW5ndGgSGwoJbWF4X3VzZXJzGAYg'
    'ASgNUghtYXhVc2Vycw==');

@$core.Deprecated('Use suggestConfigDescriptor instead')
const SuggestConfig$json = {
  '1': 'SuggestConfig',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'positional', '3': 2, '4': 1, '5': 8, '10': 'positional'},
    {'1': 'push_to_talk', '3': 3, '4': 1, '5': 8, '10': 'pushToTalk'},
  ],
};

/// Descriptor for `SuggestConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suggestConfigDescriptor = $convert.base64Decode(
    'Cg1TdWdnZXN0Q29uZmlnEhgKB3ZlcnNpb24YASABKA1SB3ZlcnNpb24SHgoKcG9zaXRpb25hbB'
    'gCIAEoCFIKcG9zaXRpb25hbBIgCgxwdXNoX3RvX3RhbGsYAyABKAhSCnB1c2hUb1RhbGs=');

@$core.Deprecated('Use pluginDataTransmissionDescriptor instead')
const PluginDataTransmission$json = {
  '1': 'PluginDataTransmission',
  '2': [
    {'1': 'senderSession', '3': 1, '4': 1, '5': 13, '10': 'senderSession'},
    {
      '1': 'receiverSessions',
      '3': 2,
      '4': 3,
      '5': 13,
      '8': {'2': true},
      '10': 'receiverSessions',
    },
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
    {'1': 'dataID', '3': 4, '4': 1, '5': 9, '10': 'dataID'},
  ],
};

/// Descriptor for `PluginDataTransmission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pluginDataTransmissionDescriptor = $convert.base64Decode(
    'ChZQbHVnaW5EYXRhVHJhbnNtaXNzaW9uEiQKDXNlbmRlclNlc3Npb24YASABKA1SDXNlbmRlcl'
    'Nlc3Npb24SLgoQcmVjZWl2ZXJTZXNzaW9ucxgCIAMoDUICEAFSEHJlY2VpdmVyU2Vzc2lvbnMS'
    'EgoEZGF0YRgDIAEoDFIEZGF0YRIWCgZkYXRhSUQYBCABKAlSBmRhdGFJRA==');

