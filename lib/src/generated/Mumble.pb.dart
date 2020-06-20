///
//  Generated code. Do not modify.
//  source: Mumble.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Mumble.pbenum.dart';

export 'Mumble.pbenum.dart';

class Version extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Version', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'version', $pb.PbFieldType.OU3)
    ..aOS(2, 'release')
    ..aOS(3, 'os')
    ..aOS(4, 'osVersion')
    ..hasRequiredFields = false
  ;

  Version._() : super();
  factory Version() => create();
  factory Version.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Version.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Version clone() => Version()..mergeFromMessage(this);
  Version copyWith(void Function(Version) updates) => super.copyWith((message) => updates(message as Version));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Version create() => Version._();
  Version createEmptyInstance() => create();
  static $pb.PbList<Version> createRepeated() => $pb.PbList<Version>();
  @$core.pragma('dart2js:noInline')
  static Version getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Version>(create);
  static Version _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get release => $_getSZ(1);
  @$pb.TagNumber(2)
  set release($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRelease() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelease() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get os => $_getSZ(2);
  @$pb.TagNumber(3)
  set os($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOs() => $_has(2);
  @$pb.TagNumber(3)
  void clearOs() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get osVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set osVersion($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOsVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearOsVersion() => clearField(4);
}

class UDPTunnel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UDPTunnel', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'packet', $pb.PbFieldType.QY)
  ;

  UDPTunnel._() : super();
  factory UDPTunnel() => create();
  factory UDPTunnel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UDPTunnel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UDPTunnel clone() => UDPTunnel()..mergeFromMessage(this);
  UDPTunnel copyWith(void Function(UDPTunnel) updates) => super.copyWith((message) => updates(message as UDPTunnel));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UDPTunnel create() => UDPTunnel._();
  UDPTunnel createEmptyInstance() => create();
  static $pb.PbList<UDPTunnel> createRepeated() => $pb.PbList<UDPTunnel>();
  @$core.pragma('dart2js:noInline')
  static UDPTunnel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UDPTunnel>(create);
  static UDPTunnel _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get packet => $_getN(0);
  @$pb.TagNumber(1)
  set packet($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPacket() => $_has(0);
  @$pb.TagNumber(1)
  void clearPacket() => clearField(1);
}

class Authenticate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Authenticate', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..aOS(1, 'username')
    ..aOS(2, 'password')
    ..pPS(3, 'tokens')
    ..p<$core.int>(4, 'celtVersions', $pb.PbFieldType.P3)
    ..aOB(5, 'opus')
    ..hasRequiredFields = false
  ;

  Authenticate._() : super();
  factory Authenticate() => create();
  factory Authenticate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Authenticate clone() => Authenticate()..mergeFromMessage(this);
  Authenticate copyWith(void Function(Authenticate) updates) => super.copyWith((message) => updates(message as Authenticate));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Authenticate create() => Authenticate._();
  Authenticate createEmptyInstance() => create();
  static $pb.PbList<Authenticate> createRepeated() => $pb.PbList<Authenticate>();
  @$core.pragma('dart2js:noInline')
  static Authenticate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate>(create);
  static Authenticate _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get tokens => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get celtVersions => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get opus => $_getBF(4);
  @$pb.TagNumber(5)
  set opus($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpus() => clearField(5);
}

class Ping extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Ping', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'timestamp', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, 'good', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, 'late', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, 'lost', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'resync', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, 'udpPackets', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, 'tcpPackets', $pb.PbFieldType.OU3)
    ..a<$core.double>(8, 'udpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(9, 'udpPingVar', $pb.PbFieldType.OF)
    ..a<$core.double>(10, 'tcpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(11, 'tcpPingVar', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Ping._() : super();
  factory Ping() => create();
  factory Ping.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ping.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ping clone() => Ping()..mergeFromMessage(this);
  Ping copyWith(void Function(Ping) updates) => super.copyWith((message) => updates(message as Ping));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ping create() => Ping._();
  Ping createEmptyInstance() => create();
  static $pb.PbList<Ping> createRepeated() => $pb.PbList<Ping>();
  @$core.pragma('dart2js:noInline')
  static Ping getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get good => $_getIZ(1);
  @$pb.TagNumber(2)
  set good($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGood() => $_has(1);
  @$pb.TagNumber(2)
  void clearGood() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get late => $_getIZ(2);
  @$pb.TagNumber(3)
  set late($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLate() => $_has(2);
  @$pb.TagNumber(3)
  void clearLate() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get lost => $_getIZ(3);
  @$pb.TagNumber(4)
  set lost($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLost() => $_has(3);
  @$pb.TagNumber(4)
  void clearLost() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get resync => $_getIZ(4);
  @$pb.TagNumber(5)
  set resync($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResync() => $_has(4);
  @$pb.TagNumber(5)
  void clearResync() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get udpPackets => $_getIZ(5);
  @$pb.TagNumber(6)
  set udpPackets($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUdpPackets() => $_has(5);
  @$pb.TagNumber(6)
  void clearUdpPackets() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get tcpPackets => $_getIZ(6);
  @$pb.TagNumber(7)
  set tcpPackets($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTcpPackets() => $_has(6);
  @$pb.TagNumber(7)
  void clearTcpPackets() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get udpPingAvg => $_getN(7);
  @$pb.TagNumber(8)
  set udpPingAvg($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUdpPingAvg() => $_has(7);
  @$pb.TagNumber(8)
  void clearUdpPingAvg() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get udpPingVar => $_getN(8);
  @$pb.TagNumber(9)
  set udpPingVar($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUdpPingVar() => $_has(8);
  @$pb.TagNumber(9)
  void clearUdpPingVar() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get tcpPingAvg => $_getN(9);
  @$pb.TagNumber(10)
  set tcpPingAvg($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTcpPingAvg() => $_has(9);
  @$pb.TagNumber(10)
  void clearTcpPingAvg() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get tcpPingVar => $_getN(10);
  @$pb.TagNumber(11)
  set tcpPingVar($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTcpPingVar() => $_has(10);
  @$pb.TagNumber(11)
  void clearTcpPingVar() => clearField(11);
}

class Reject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Reject', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..e<Reject_RejectType>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Reject_RejectType.None, valueOf: Reject_RejectType.valueOf, enumValues: Reject_RejectType.values)
    ..aOS(2, 'reason')
    ..hasRequiredFields = false
  ;

  Reject._() : super();
  factory Reject() => create();
  factory Reject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Reject clone() => Reject()..mergeFromMessage(this);
  Reject copyWith(void Function(Reject) updates) => super.copyWith((message) => updates(message as Reject));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Reject create() => Reject._();
  Reject createEmptyInstance() => create();
  static $pb.PbList<Reject> createRepeated() => $pb.PbList<Reject>();
  @$core.pragma('dart2js:noInline')
  static Reject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reject>(create);
  static Reject _defaultInstance;

  @$pb.TagNumber(1)
  Reject_RejectType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Reject_RejectType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);
}

class ServerSync extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ServerSync', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'maxBandwidth', $pb.PbFieldType.OU3)
    ..aOS(3, 'welcomeText')
    ..a<$fixnum.Int64>(4, 'permissions', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ServerSync._() : super();
  factory ServerSync() => create();
  factory ServerSync.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerSync.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ServerSync clone() => ServerSync()..mergeFromMessage(this);
  ServerSync copyWith(void Function(ServerSync) updates) => super.copyWith((message) => updates(message as ServerSync));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerSync create() => ServerSync._();
  ServerSync createEmptyInstance() => create();
  static $pb.PbList<ServerSync> createRepeated() => $pb.PbList<ServerSync>();
  @$core.pragma('dart2js:noInline')
  static ServerSync getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerSync>(create);
  static ServerSync _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maxBandwidth => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxBandwidth($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxBandwidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxBandwidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get welcomeText => $_getSZ(2);
  @$pb.TagNumber(3)
  set welcomeText($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWelcomeText() => $_has(2);
  @$pb.TagNumber(3)
  void clearWelcomeText() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get permissions => $_getI64(3);
  @$pb.TagNumber(4)
  set permissions($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermissions() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermissions() => clearField(4);
}

class ChannelRemove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChannelRemove', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'channelId', $pb.PbFieldType.QU3)
  ;

  ChannelRemove._() : super();
  factory ChannelRemove() => create();
  factory ChannelRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChannelRemove clone() => ChannelRemove()..mergeFromMessage(this);
  ChannelRemove copyWith(void Function(ChannelRemove) updates) => super.copyWith((message) => updates(message as ChannelRemove));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChannelRemove create() => ChannelRemove._();
  ChannelRemove createEmptyInstance() => create();
  static $pb.PbList<ChannelRemove> createRepeated() => $pb.PbList<ChannelRemove>();
  @$core.pragma('dart2js:noInline')
  static ChannelRemove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelRemove>(create);
  static ChannelRemove _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);
}

class ChannelState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChannelState', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'parent', $pb.PbFieldType.OU3)
    ..aOS(3, 'name')
    ..p<$core.int>(4, 'links', $pb.PbFieldType.PU3)
    ..aOS(5, 'description')
    ..p<$core.int>(6, 'linksAdd', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, 'linksRemove', $pb.PbFieldType.PU3)
    ..aOB(8, 'temporary')
    ..a<$core.int>(9, 'position', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(10, 'descriptionHash', $pb.PbFieldType.OY)
    ..a<$core.int>(11, 'maxUsers', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ChannelState._() : super();
  factory ChannelState() => create();
  factory ChannelState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChannelState clone() => ChannelState()..mergeFromMessage(this);
  ChannelState copyWith(void Function(ChannelState) updates) => super.copyWith((message) => updates(message as ChannelState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChannelState create() => ChannelState._();
  ChannelState createEmptyInstance() => create();
  static $pb.PbList<ChannelState> createRepeated() => $pb.PbList<ChannelState>();
  @$core.pragma('dart2js:noInline')
  static ChannelState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelState>(create);
  static ChannelState _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get parent => $_getIZ(1);
  @$pb.TagNumber(2)
  set parent($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get links => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get linksAdd => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get linksRemove => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get temporary => $_getBF(7);
  @$pb.TagNumber(8)
  set temporary($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTemporary() => $_has(7);
  @$pb.TagNumber(8)
  void clearTemporary() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get position => $_getIZ(8);
  @$pb.TagNumber(9)
  set position($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPosition() => $_has(8);
  @$pb.TagNumber(9)
  void clearPosition() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get descriptionHash => $_getN(9);
  @$pb.TagNumber(10)
  set descriptionHash($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDescriptionHash() => $_has(9);
  @$pb.TagNumber(10)
  void clearDescriptionHash() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get maxUsers => $_getIZ(10);
  @$pb.TagNumber(11)
  set maxUsers($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMaxUsers() => $_has(10);
  @$pb.TagNumber(11)
  void clearMaxUsers() => clearField(11);
}

class UserRemove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserRemove', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'session', $pb.PbFieldType.QU3)
    ..a<$core.int>(2, 'actor', $pb.PbFieldType.OU3)
    ..aOS(3, 'reason')
    ..aOB(4, 'ban')
  ;

  UserRemove._() : super();
  factory UserRemove() => create();
  factory UserRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserRemove clone() => UserRemove()..mergeFromMessage(this);
  UserRemove copyWith(void Function(UserRemove) updates) => super.copyWith((message) => updates(message as UserRemove));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRemove create() => UserRemove._();
  UserRemove createEmptyInstance() => create();
  static $pb.PbList<UserRemove> createRepeated() => $pb.PbList<UserRemove>();
  @$core.pragma('dart2js:noInline')
  static UserRemove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRemove>(create);
  static UserRemove _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get actor => $_getIZ(1);
  @$pb.TagNumber(2)
  set actor($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActor() => $_has(1);
  @$pb.TagNumber(2)
  void clearActor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get ban => $_getBF(3);
  @$pb.TagNumber(4)
  set ban($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBan() => $_has(3);
  @$pb.TagNumber(4)
  void clearBan() => clearField(4);
}

class UserState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserState', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'actor', $pb.PbFieldType.OU3)
    ..aOS(3, 'name')
    ..a<$core.int>(4, 'userId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'channelId', $pb.PbFieldType.OU3)
    ..aOB(6, 'mute')
    ..aOB(7, 'deaf')
    ..aOB(8, 'suppress')
    ..aOB(9, 'selfMute')
    ..aOB(10, 'selfDeaf')
    ..a<$core.List<$core.int>>(11, 'texture', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(12, 'pluginContext', $pb.PbFieldType.OY)
    ..aOS(13, 'pluginIdentity')
    ..aOS(14, 'comment')
    ..aOS(15, 'hash')
    ..a<$core.List<$core.int>>(16, 'commentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(17, 'textureHash', $pb.PbFieldType.OY)
    ..aOB(18, 'prioritySpeaker')
    ..aOB(19, 'recording')
    ..hasRequiredFields = false
  ;

  UserState._() : super();
  factory UserState() => create();
  factory UserState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserState clone() => UserState()..mergeFromMessage(this);
  UserState copyWith(void Function(UserState) updates) => super.copyWith((message) => updates(message as UserState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserState create() => UserState._();
  UserState createEmptyInstance() => create();
  static $pb.PbList<UserState> createRepeated() => $pb.PbList<UserState>();
  @$core.pragma('dart2js:noInline')
  static UserState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserState>(create);
  static UserState _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get actor => $_getIZ(1);
  @$pb.TagNumber(2)
  set actor($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActor() => $_has(1);
  @$pb.TagNumber(2)
  void clearActor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get channelId => $_getIZ(4);
  @$pb.TagNumber(5)
  set channelId($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChannelId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannelId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get mute => $_getBF(5);
  @$pb.TagNumber(6)
  set mute($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMute() => $_has(5);
  @$pb.TagNumber(6)
  void clearMute() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get deaf => $_getBF(6);
  @$pb.TagNumber(7)
  set deaf($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeaf() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeaf() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get suppress => $_getBF(7);
  @$pb.TagNumber(8)
  set suppress($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSuppress() => $_has(7);
  @$pb.TagNumber(8)
  void clearSuppress() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get selfMute => $_getBF(8);
  @$pb.TagNumber(9)
  set selfMute($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSelfMute() => $_has(8);
  @$pb.TagNumber(9)
  void clearSelfMute() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get selfDeaf => $_getBF(9);
  @$pb.TagNumber(10)
  set selfDeaf($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSelfDeaf() => $_has(9);
  @$pb.TagNumber(10)
  void clearSelfDeaf() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get texture => $_getN(10);
  @$pb.TagNumber(11)
  set texture($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTexture() => $_has(10);
  @$pb.TagNumber(11)
  void clearTexture() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get pluginContext => $_getN(11);
  @$pb.TagNumber(12)
  set pluginContext($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPluginContext() => $_has(11);
  @$pb.TagNumber(12)
  void clearPluginContext() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get pluginIdentity => $_getSZ(12);
  @$pb.TagNumber(13)
  set pluginIdentity($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPluginIdentity() => $_has(12);
  @$pb.TagNumber(13)
  void clearPluginIdentity() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get comment => $_getSZ(13);
  @$pb.TagNumber(14)
  set comment($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasComment() => $_has(13);
  @$pb.TagNumber(14)
  void clearComment() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get hash => $_getSZ(14);
  @$pb.TagNumber(15)
  set hash($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasHash() => $_has(14);
  @$pb.TagNumber(15)
  void clearHash() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.int> get commentHash => $_getN(15);
  @$pb.TagNumber(16)
  set commentHash($core.List<$core.int> v) { $_setBytes(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCommentHash() => $_has(15);
  @$pb.TagNumber(16)
  void clearCommentHash() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<$core.int> get textureHash => $_getN(16);
  @$pb.TagNumber(17)
  set textureHash($core.List<$core.int> v) { $_setBytes(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasTextureHash() => $_has(16);
  @$pb.TagNumber(17)
  void clearTextureHash() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get prioritySpeaker => $_getBF(17);
  @$pb.TagNumber(18)
  set prioritySpeaker($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasPrioritySpeaker() => $_has(17);
  @$pb.TagNumber(18)
  void clearPrioritySpeaker() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get recording => $_getBF(18);
  @$pb.TagNumber(19)
  set recording($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasRecording() => $_has(18);
  @$pb.TagNumber(19)
  void clearRecording() => clearField(19);
}

class BanList_BanEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BanList.BanEntry', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.QY)
    ..a<$core.int>(2, 'mask', $pb.PbFieldType.QU3)
    ..aOS(3, 'name')
    ..aOS(4, 'hash')
    ..aOS(5, 'reason')
    ..aOS(6, 'start')
    ..a<$core.int>(7, 'duration', $pb.PbFieldType.OU3)
  ;

  BanList_BanEntry._() : super();
  factory BanList_BanEntry() => create();
  factory BanList_BanEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BanList_BanEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BanList_BanEntry clone() => BanList_BanEntry()..mergeFromMessage(this);
  BanList_BanEntry copyWith(void Function(BanList_BanEntry) updates) => super.copyWith((message) => updates(message as BanList_BanEntry));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BanList_BanEntry create() => BanList_BanEntry._();
  BanList_BanEntry createEmptyInstance() => create();
  static $pb.PbList<BanList_BanEntry> createRepeated() => $pb.PbList<BanList_BanEntry>();
  @$core.pragma('dart2js:noInline')
  static BanList_BanEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanList_BanEntry>(create);
  static BanList_BanEntry _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mask => $_getIZ(1);
  @$pb.TagNumber(2)
  set mask($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearMask() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get hash => $_getSZ(3);
  @$pb.TagNumber(4)
  set hash($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearHash() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get reason => $_getSZ(4);
  @$pb.TagNumber(5)
  set reason($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearReason() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get start => $_getSZ(5);
  @$pb.TagNumber(6)
  set start($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStart() => $_has(5);
  @$pb.TagNumber(6)
  void clearStart() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get duration => $_getIZ(6);
  @$pb.TagNumber(7)
  set duration($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);
}

class BanList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BanList', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..pc<BanList_BanEntry>(1, 'bans', $pb.PbFieldType.PM, subBuilder: BanList_BanEntry.create)
    ..aOB(2, 'query')
  ;

  BanList._() : super();
  factory BanList() => create();
  factory BanList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BanList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BanList clone() => BanList()..mergeFromMessage(this);
  BanList copyWith(void Function(BanList) updates) => super.copyWith((message) => updates(message as BanList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BanList create() => BanList._();
  BanList createEmptyInstance() => create();
  static $pb.PbList<BanList> createRepeated() => $pb.PbList<BanList>();
  @$core.pragma('dart2js:noInline')
  static BanList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanList>(create);
  static BanList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BanList_BanEntry> get bans => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get query => $_getBF(1);
  @$pb.TagNumber(2)
  set query($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);
}

class TextMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TextMessage', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'actor', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, 'session', $pb.PbFieldType.PU3)
    ..p<$core.int>(3, 'channelId', $pb.PbFieldType.PU3)
    ..p<$core.int>(4, 'treeId', $pb.PbFieldType.PU3)
    ..aQS(5, 'message')
  ;

  TextMessage._() : super();
  factory TextMessage() => create();
  factory TextMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TextMessage clone() => TextMessage()..mergeFromMessage(this);
  TextMessage copyWith(void Function(TextMessage) updates) => super.copyWith((message) => updates(message as TextMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TextMessage create() => TextMessage._();
  TextMessage createEmptyInstance() => create();
  static $pb.PbList<TextMessage> createRepeated() => $pb.PbList<TextMessage>();
  @$core.pragma('dart2js:noInline')
  static TextMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMessage>(create);
  static TextMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get actor => $_getIZ(0);
  @$pb.TagNumber(1)
  set actor($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActor() => $_has(0);
  @$pb.TagNumber(1)
  void clearActor() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get session => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get channelId => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get treeId => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => clearField(5);
}

class PermissionDenied extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PermissionDenied', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'permission', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, 'session', $pb.PbFieldType.OU3)
    ..aOS(4, 'reason')
    ..e<PermissionDenied_DenyType>(5, 'type', $pb.PbFieldType.OE, defaultOrMaker: PermissionDenied_DenyType.Text, valueOf: PermissionDenied_DenyType.valueOf, enumValues: PermissionDenied_DenyType.values)
    ..aOS(6, 'name')
    ..hasRequiredFields = false
  ;

  PermissionDenied._() : super();
  factory PermissionDenied() => create();
  factory PermissionDenied.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionDenied.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PermissionDenied clone() => PermissionDenied()..mergeFromMessage(this);
  PermissionDenied copyWith(void Function(PermissionDenied) updates) => super.copyWith((message) => updates(message as PermissionDenied));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermissionDenied create() => PermissionDenied._();
  PermissionDenied createEmptyInstance() => create();
  static $pb.PbList<PermissionDenied> createRepeated() => $pb.PbList<PermissionDenied>();
  @$core.pragma('dart2js:noInline')
  static PermissionDenied getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionDenied>(create);
  static PermissionDenied _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get permission => $_getIZ(0);
  @$pb.TagNumber(1)
  set permission($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermission() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get session => $_getIZ(2);
  @$pb.TagNumber(3)
  set session($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => clearField(4);

  @$pb.TagNumber(5)
  PermissionDenied_DenyType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(PermissionDenied_DenyType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);
}

class ACL_ChanGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ACL.ChanGroup', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..aQS(1, 'name')
    ..a<$core.bool>(2, 'inherited', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(3, 'inherit', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(4, 'inheritable', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..p<$core.int>(5, 'add', $pb.PbFieldType.PU3)
    ..p<$core.int>(6, 'remove', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, 'inheritedMembers', $pb.PbFieldType.PU3)
  ;

  ACL_ChanGroup._() : super();
  factory ACL_ChanGroup() => create();
  factory ACL_ChanGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL_ChanGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ACL_ChanGroup clone() => ACL_ChanGroup()..mergeFromMessage(this);
  ACL_ChanGroup copyWith(void Function(ACL_ChanGroup) updates) => super.copyWith((message) => updates(message as ACL_ChanGroup));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ACL_ChanGroup create() => ACL_ChanGroup._();
  ACL_ChanGroup createEmptyInstance() => create();
  static $pb.PbList<ACL_ChanGroup> createRepeated() => $pb.PbList<ACL_ChanGroup>();
  @$core.pragma('dart2js:noInline')
  static ACL_ChanGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL_ChanGroup>(create);
  static ACL_ChanGroup _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inherited => $_getB(1, true);
  @$pb.TagNumber(2)
  set inherited($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInherited() => $_has(1);
  @$pb.TagNumber(2)
  void clearInherited() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get inherit => $_getB(2, true);
  @$pb.TagNumber(3)
  set inherit($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInherit() => $_has(2);
  @$pb.TagNumber(3)
  void clearInherit() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get inheritable => $_getB(3, true);
  @$pb.TagNumber(4)
  set inheritable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInheritable() => $_has(3);
  @$pb.TagNumber(4)
  void clearInheritable() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get add => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get remove => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get inheritedMembers => $_getList(6);
}

class ACL_ChanACL extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ACL.ChanACL', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, 'applyHere', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(2, 'applySubs', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(3, 'inherited', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.int>(4, 'userId', $pb.PbFieldType.OU3)
    ..aOS(5, 'group')
    ..a<$core.int>(6, 'grant', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, 'deny', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ACL_ChanACL._() : super();
  factory ACL_ChanACL() => create();
  factory ACL_ChanACL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL_ChanACL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ACL_ChanACL clone() => ACL_ChanACL()..mergeFromMessage(this);
  ACL_ChanACL copyWith(void Function(ACL_ChanACL) updates) => super.copyWith((message) => updates(message as ACL_ChanACL));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ACL_ChanACL create() => ACL_ChanACL._();
  ACL_ChanACL createEmptyInstance() => create();
  static $pb.PbList<ACL_ChanACL> createRepeated() => $pb.PbList<ACL_ChanACL>();
  @$core.pragma('dart2js:noInline')
  static ACL_ChanACL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL_ChanACL>(create);
  static ACL_ChanACL _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get applyHere => $_getB(0, true);
  @$pb.TagNumber(1)
  set applyHere($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApplyHere() => $_has(0);
  @$pb.TagNumber(1)
  void clearApplyHere() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get applySubs => $_getB(1, true);
  @$pb.TagNumber(2)
  set applySubs($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApplySubs() => $_has(1);
  @$pb.TagNumber(2)
  void clearApplySubs() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get inherited => $_getB(2, true);
  @$pb.TagNumber(3)
  set inherited($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInherited() => $_has(2);
  @$pb.TagNumber(3)
  void clearInherited() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get group => $_getSZ(4);
  @$pb.TagNumber(5)
  set group($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroup() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroup() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get grant => $_getIZ(5);
  @$pb.TagNumber(6)
  set grant($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGrant() => $_has(5);
  @$pb.TagNumber(6)
  void clearGrant() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get deny => $_getIZ(6);
  @$pb.TagNumber(7)
  set deny($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeny() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeny() => clearField(7);
}

class ACL extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ACL', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'channelId', $pb.PbFieldType.QU3)
    ..a<$core.bool>(2, 'inheritAcls', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..pc<ACL_ChanGroup>(3, 'groups', $pb.PbFieldType.PM, subBuilder: ACL_ChanGroup.create)
    ..pc<ACL_ChanACL>(4, 'acls', $pb.PbFieldType.PM, subBuilder: ACL_ChanACL.create)
    ..aOB(5, 'query')
  ;

  ACL._() : super();
  factory ACL() => create();
  factory ACL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ACL clone() => ACL()..mergeFromMessage(this);
  ACL copyWith(void Function(ACL) updates) => super.copyWith((message) => updates(message as ACL));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ACL create() => ACL._();
  ACL createEmptyInstance() => create();
  static $pb.PbList<ACL> createRepeated() => $pb.PbList<ACL>();
  @$core.pragma('dart2js:noInline')
  static ACL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL>(create);
  static ACL _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inheritAcls => $_getB(1, true);
  @$pb.TagNumber(2)
  set inheritAcls($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInheritAcls() => $_has(1);
  @$pb.TagNumber(2)
  void clearInheritAcls() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ACL_ChanGroup> get groups => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<ACL_ChanACL> get acls => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get query => $_getBF(4);
  @$pb.TagNumber(5)
  set query($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuery() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuery() => clearField(5);
}

class QueryUsers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('QueryUsers', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, 'ids', $pb.PbFieldType.PU3)
    ..pPS(2, 'names')
    ..hasRequiredFields = false
  ;

  QueryUsers._() : super();
  factory QueryUsers() => create();
  factory QueryUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  QueryUsers clone() => QueryUsers()..mergeFromMessage(this);
  QueryUsers copyWith(void Function(QueryUsers) updates) => super.copyWith((message) => updates(message as QueryUsers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryUsers create() => QueryUsers._();
  QueryUsers createEmptyInstance() => create();
  static $pb.PbList<QueryUsers> createRepeated() => $pb.PbList<QueryUsers>();
  @$core.pragma('dart2js:noInline')
  static QueryUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryUsers>(create);
  static QueryUsers _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ids => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get names => $_getList(1);
}

class CryptSetup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CryptSetup', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'key', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'clientNonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'serverNonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  CryptSetup._() : super();
  factory CryptSetup() => create();
  factory CryptSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CryptSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CryptSetup clone() => CryptSetup()..mergeFromMessage(this);
  CryptSetup copyWith(void Function(CryptSetup) updates) => super.copyWith((message) => updates(message as CryptSetup));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CryptSetup create() => CryptSetup._();
  CryptSetup createEmptyInstance() => create();
  static $pb.PbList<CryptSetup> createRepeated() => $pb.PbList<CryptSetup>();
  @$core.pragma('dart2js:noInline')
  static CryptSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CryptSetup>(create);
  static CryptSetup _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get key => $_getN(0);
  @$pb.TagNumber(1)
  set key($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get clientNonce => $_getN(1);
  @$pb.TagNumber(2)
  set clientNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get serverNonce => $_getN(2);
  @$pb.TagNumber(3)
  set serverNonce($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServerNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerNonce() => clearField(3);
}

class ContextActionModify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextActionModify', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..aQS(1, 'action')
    ..aOS(2, 'text')
    ..a<$core.int>(3, 'context', $pb.PbFieldType.OU3)
    ..e<ContextActionModify_Operation>(4, 'operation', $pb.PbFieldType.OE, defaultOrMaker: ContextActionModify_Operation.Add, valueOf: ContextActionModify_Operation.valueOf, enumValues: ContextActionModify_Operation.values)
  ;

  ContextActionModify._() : super();
  factory ContextActionModify() => create();
  factory ContextActionModify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextActionModify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextActionModify clone() => ContextActionModify()..mergeFromMessage(this);
  ContextActionModify copyWith(void Function(ContextActionModify) updates) => super.copyWith((message) => updates(message as ContextActionModify));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextActionModify create() => ContextActionModify._();
  ContextActionModify createEmptyInstance() => create();
  static $pb.PbList<ContextActionModify> createRepeated() => $pb.PbList<ContextActionModify>();
  @$core.pragma('dart2js:noInline')
  static ContextActionModify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextActionModify>(create);
  static ContextActionModify _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get action => $_getSZ(0);
  @$pb.TagNumber(1)
  set action($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get context => $_getIZ(2);
  @$pb.TagNumber(3)
  set context($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContext() => $_has(2);
  @$pb.TagNumber(3)
  void clearContext() => clearField(3);

  @$pb.TagNumber(4)
  ContextActionModify_Operation get operation => $_getN(3);
  @$pb.TagNumber(4)
  set operation(ContextActionModify_Operation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOperation() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperation() => clearField(4);
}

class ContextAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextAction', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'channelId', $pb.PbFieldType.OU3)
    ..aQS(3, 'action')
  ;

  ContextAction._() : super();
  factory ContextAction() => create();
  factory ContextAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextAction clone() => ContextAction()..mergeFromMessage(this);
  ContextAction copyWith(void Function(ContextAction) updates) => super.copyWith((message) => updates(message as ContextAction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextAction create() => ContextAction._();
  ContextAction createEmptyInstance() => create();
  static $pb.PbList<ContextAction> createRepeated() => $pb.PbList<ContextAction>();
  @$core.pragma('dart2js:noInline')
  static ContextAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextAction>(create);
  static ContextAction _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get action => $_getSZ(2);
  @$pb.TagNumber(3)
  set action($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);
}

class UserList_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserList.User', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'userId', $pb.PbFieldType.QU3)
    ..aOS(2, 'name')
    ..aOS(3, 'lastSeen')
    ..a<$core.int>(4, 'lastChannel', $pb.PbFieldType.OU3)
  ;

  UserList_User._() : super();
  factory UserList_User() => create();
  factory UserList_User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList_User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserList_User clone() => UserList_User()..mergeFromMessage(this);
  UserList_User copyWith(void Function(UserList_User) updates) => super.copyWith((message) => updates(message as UserList_User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList_User create() => UserList_User._();
  UserList_User createEmptyInstance() => create();
  static $pb.PbList<UserList_User> createRepeated() => $pb.PbList<UserList_User>();
  @$core.pragma('dart2js:noInline')
  static UserList_User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList_User>(create);
  static UserList_User _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastSeen => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastSeen($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastSeen() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastSeen() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get lastChannel => $_getIZ(3);
  @$pb.TagNumber(4)
  set lastChannel($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastChannel() => clearField(4);
}

class UserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserList', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..pc<UserList_User>(1, 'users', $pb.PbFieldType.PM, subBuilder: UserList_User.create)
  ;

  UserList._() : super();
  factory UserList() => create();
  factory UserList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserList clone() => UserList()..mergeFromMessage(this);
  UserList copyWith(void Function(UserList) updates) => super.copyWith((message) => updates(message as UserList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  UserList createEmptyInstance() => create();
  static $pb.PbList<UserList> createRepeated() => $pb.PbList<UserList>();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserList_User> get users => $_getList(0);
}

class VoiceTarget_Target extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VoiceTarget.Target', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, 'session', $pb.PbFieldType.PU3)
    ..a<$core.int>(2, 'channelId', $pb.PbFieldType.OU3)
    ..aOS(3, 'group')
    ..aOB(4, 'links')
    ..aOB(5, 'children')
    ..hasRequiredFields = false
  ;

  VoiceTarget_Target._() : super();
  factory VoiceTarget_Target() => create();
  factory VoiceTarget_Target.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceTarget_Target.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VoiceTarget_Target clone() => VoiceTarget_Target()..mergeFromMessage(this);
  VoiceTarget_Target copyWith(void Function(VoiceTarget_Target) updates) => super.copyWith((message) => updates(message as VoiceTarget_Target));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoiceTarget_Target create() => VoiceTarget_Target._();
  VoiceTarget_Target createEmptyInstance() => create();
  static $pb.PbList<VoiceTarget_Target> createRepeated() => $pb.PbList<VoiceTarget_Target>();
  @$core.pragma('dart2js:noInline')
  static VoiceTarget_Target getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceTarget_Target>(create);
  static VoiceTarget_Target _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get session => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get group => $_getSZ(2);
  @$pb.TagNumber(3)
  set group($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get links => $_getBF(3);
  @$pb.TagNumber(4)
  set links($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLinks() => $_has(3);
  @$pb.TagNumber(4)
  void clearLinks() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get children => $_getBF(4);
  @$pb.TagNumber(5)
  set children($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChildren() => $_has(4);
  @$pb.TagNumber(5)
  void clearChildren() => clearField(5);
}

class VoiceTarget extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VoiceTarget', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'id', $pb.PbFieldType.OU3)
    ..pc<VoiceTarget_Target>(2, 'targets', $pb.PbFieldType.PM, subBuilder: VoiceTarget_Target.create)
    ..hasRequiredFields = false
  ;

  VoiceTarget._() : super();
  factory VoiceTarget() => create();
  factory VoiceTarget.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceTarget.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VoiceTarget clone() => VoiceTarget()..mergeFromMessage(this);
  VoiceTarget copyWith(void Function(VoiceTarget) updates) => super.copyWith((message) => updates(message as VoiceTarget));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoiceTarget create() => VoiceTarget._();
  VoiceTarget createEmptyInstance() => create();
  static $pb.PbList<VoiceTarget> createRepeated() => $pb.PbList<VoiceTarget>();
  @$core.pragma('dart2js:noInline')
  static VoiceTarget getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceTarget>(create);
  static VoiceTarget _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<VoiceTarget_Target> get targets => $_getList(1);
}

class PermissionQuery extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PermissionQuery', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'permissions', $pb.PbFieldType.OU3)
    ..aOB(3, 'flush')
    ..hasRequiredFields = false
  ;

  PermissionQuery._() : super();
  factory PermissionQuery() => create();
  factory PermissionQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PermissionQuery clone() => PermissionQuery()..mergeFromMessage(this);
  PermissionQuery copyWith(void Function(PermissionQuery) updates) => super.copyWith((message) => updates(message as PermissionQuery));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermissionQuery create() => PermissionQuery._();
  PermissionQuery createEmptyInstance() => create();
  static $pb.PbList<PermissionQuery> createRepeated() => $pb.PbList<PermissionQuery>();
  @$core.pragma('dart2js:noInline')
  static PermissionQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionQuery>(create);
  static PermissionQuery _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get permissions => $_getIZ(1);
  @$pb.TagNumber(2)
  set permissions($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissions() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissions() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get flush => $_getBF(2);
  @$pb.TagNumber(3)
  set flush($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFlush() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlush() => clearField(3);
}

class CodecVersion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CodecVersion', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'alpha', $pb.PbFieldType.Q3)
    ..a<$core.int>(2, 'beta', $pb.PbFieldType.Q3)
    ..a<$core.bool>(3, 'preferAlpha', $pb.PbFieldType.QB, defaultOrMaker: true)
    ..aOB(4, 'opus')
  ;

  CodecVersion._() : super();
  factory CodecVersion() => create();
  factory CodecVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodecVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CodecVersion clone() => CodecVersion()..mergeFromMessage(this);
  CodecVersion copyWith(void Function(CodecVersion) updates) => super.copyWith((message) => updates(message as CodecVersion));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodecVersion create() => CodecVersion._();
  CodecVersion createEmptyInstance() => create();
  static $pb.PbList<CodecVersion> createRepeated() => $pb.PbList<CodecVersion>();
  @$core.pragma('dart2js:noInline')
  static CodecVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodecVersion>(create);
  static CodecVersion _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get alpha => $_getIZ(0);
  @$pb.TagNumber(1)
  set alpha($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlpha() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlpha() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get beta => $_getIZ(1);
  @$pb.TagNumber(2)
  set beta($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearBeta() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get preferAlpha => $_getB(2, true);
  @$pb.TagNumber(3)
  set preferAlpha($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPreferAlpha() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreferAlpha() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get opus => $_getBF(3);
  @$pb.TagNumber(4)
  set opus($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOpus() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpus() => clearField(4);
}

class UserStats_Stats extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserStats.Stats', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'good', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'late', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, 'lost', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, 'resync', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  UserStats_Stats._() : super();
  factory UserStats_Stats() => create();
  factory UserStats_Stats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStats_Stats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserStats_Stats clone() => UserStats_Stats()..mergeFromMessage(this);
  UserStats_Stats copyWith(void Function(UserStats_Stats) updates) => super.copyWith((message) => updates(message as UserStats_Stats));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserStats_Stats create() => UserStats_Stats._();
  UserStats_Stats createEmptyInstance() => create();
  static $pb.PbList<UserStats_Stats> createRepeated() => $pb.PbList<UserStats_Stats>();
  @$core.pragma('dart2js:noInline')
  static UserStats_Stats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStats_Stats>(create);
  static UserStats_Stats _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get good => $_getIZ(0);
  @$pb.TagNumber(1)
  set good($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGood() => $_has(0);
  @$pb.TagNumber(1)
  void clearGood() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get late => $_getIZ(1);
  @$pb.TagNumber(2)
  set late($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLate() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lost => $_getIZ(2);
  @$pb.TagNumber(3)
  set lost($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLost() => $_has(2);
  @$pb.TagNumber(3)
  void clearLost() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get resync => $_getIZ(3);
  @$pb.TagNumber(4)
  set resync($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResync() => $_has(3);
  @$pb.TagNumber(4)
  void clearResync() => clearField(4);
}

class UserStats extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserStats', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'session', $pb.PbFieldType.OU3)
    ..aOB(2, 'statsOnly')
    ..p<$core.List<$core.int>>(3, 'certificates', $pb.PbFieldType.PY)
    ..aOM<UserStats_Stats>(4, 'fromClient', subBuilder: UserStats_Stats.create)
    ..aOM<UserStats_Stats>(5, 'fromServer', subBuilder: UserStats_Stats.create)
    ..a<$core.int>(6, 'udpPackets', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, 'tcpPackets', $pb.PbFieldType.OU3)
    ..a<$core.double>(8, 'udpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(9, 'udpPingVar', $pb.PbFieldType.OF)
    ..a<$core.double>(10, 'tcpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(11, 'tcpPingVar', $pb.PbFieldType.OF)
    ..aOM<Version>(12, 'version', subBuilder: Version.create)
    ..p<$core.int>(13, 'celtVersions', $pb.PbFieldType.P3)
    ..a<$core.List<$core.int>>(14, 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(15, 'bandwidth', $pb.PbFieldType.OU3)
    ..a<$core.int>(16, 'onlinesecs', $pb.PbFieldType.OU3)
    ..a<$core.int>(17, 'idlesecs', $pb.PbFieldType.OU3)
    ..aOB(18, 'strongCertificate')
    ..aOB(19, 'opus')
    ..hasRequiredFields = false
  ;

  UserStats._() : super();
  factory UserStats() => create();
  factory UserStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserStats clone() => UserStats()..mergeFromMessage(this);
  UserStats copyWith(void Function(UserStats) updates) => super.copyWith((message) => updates(message as UserStats));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserStats create() => UserStats._();
  UserStats createEmptyInstance() => create();
  static $pb.PbList<UserStats> createRepeated() => $pb.PbList<UserStats>();
  @$core.pragma('dart2js:noInline')
  static UserStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStats>(create);
  static UserStats _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get statsOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set statsOnly($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatsOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatsOnly() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get certificates => $_getList(2);

  @$pb.TagNumber(4)
  UserStats_Stats get fromClient => $_getN(3);
  @$pb.TagNumber(4)
  set fromClient(UserStats_Stats v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFromClient() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromClient() => clearField(4);
  @$pb.TagNumber(4)
  UserStats_Stats ensureFromClient() => $_ensure(3);

  @$pb.TagNumber(5)
  UserStats_Stats get fromServer => $_getN(4);
  @$pb.TagNumber(5)
  set fromServer(UserStats_Stats v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFromServer() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromServer() => clearField(5);
  @$pb.TagNumber(5)
  UserStats_Stats ensureFromServer() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get udpPackets => $_getIZ(5);
  @$pb.TagNumber(6)
  set udpPackets($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUdpPackets() => $_has(5);
  @$pb.TagNumber(6)
  void clearUdpPackets() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get tcpPackets => $_getIZ(6);
  @$pb.TagNumber(7)
  set tcpPackets($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTcpPackets() => $_has(6);
  @$pb.TagNumber(7)
  void clearTcpPackets() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get udpPingAvg => $_getN(7);
  @$pb.TagNumber(8)
  set udpPingAvg($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUdpPingAvg() => $_has(7);
  @$pb.TagNumber(8)
  void clearUdpPingAvg() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get udpPingVar => $_getN(8);
  @$pb.TagNumber(9)
  set udpPingVar($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUdpPingVar() => $_has(8);
  @$pb.TagNumber(9)
  void clearUdpPingVar() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get tcpPingAvg => $_getN(9);
  @$pb.TagNumber(10)
  set tcpPingAvg($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTcpPingAvg() => $_has(9);
  @$pb.TagNumber(10)
  void clearTcpPingAvg() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get tcpPingVar => $_getN(10);
  @$pb.TagNumber(11)
  set tcpPingVar($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTcpPingVar() => $_has(10);
  @$pb.TagNumber(11)
  void clearTcpPingVar() => clearField(11);

  @$pb.TagNumber(12)
  Version get version => $_getN(11);
  @$pb.TagNumber(12)
  set version(Version v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasVersion() => $_has(11);
  @$pb.TagNumber(12)
  void clearVersion() => clearField(12);
  @$pb.TagNumber(12)
  Version ensureVersion() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.List<$core.int> get celtVersions => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<$core.int> get address => $_getN(13);
  @$pb.TagNumber(14)
  set address($core.List<$core.int> v) { $_setBytes(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAddress() => $_has(13);
  @$pb.TagNumber(14)
  void clearAddress() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get bandwidth => $_getIZ(14);
  @$pb.TagNumber(15)
  set bandwidth($core.int v) { $_setUnsignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasBandwidth() => $_has(14);
  @$pb.TagNumber(15)
  void clearBandwidth() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get onlinesecs => $_getIZ(15);
  @$pb.TagNumber(16)
  set onlinesecs($core.int v) { $_setUnsignedInt32(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasOnlinesecs() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnlinesecs() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get idlesecs => $_getIZ(16);
  @$pb.TagNumber(17)
  set idlesecs($core.int v) { $_setUnsignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasIdlesecs() => $_has(16);
  @$pb.TagNumber(17)
  void clearIdlesecs() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get strongCertificate => $_getBF(17);
  @$pb.TagNumber(18)
  set strongCertificate($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasStrongCertificate() => $_has(17);
  @$pb.TagNumber(18)
  void clearStrongCertificate() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get opus => $_getBF(18);
  @$pb.TagNumber(19)
  set opus($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasOpus() => $_has(18);
  @$pb.TagNumber(19)
  void clearOpus() => clearField(19);
}

class RequestBlob extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestBlob', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, 'sessionTexture', $pb.PbFieldType.PU3)
    ..p<$core.int>(2, 'sessionComment', $pb.PbFieldType.PU3)
    ..p<$core.int>(3, 'channelDescription', $pb.PbFieldType.PU3)
    ..hasRequiredFields = false
  ;

  RequestBlob._() : super();
  factory RequestBlob() => create();
  factory RequestBlob.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestBlob.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestBlob clone() => RequestBlob()..mergeFromMessage(this);
  RequestBlob copyWith(void Function(RequestBlob) updates) => super.copyWith((message) => updates(message as RequestBlob));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestBlob create() => RequestBlob._();
  RequestBlob createEmptyInstance() => create();
  static $pb.PbList<RequestBlob> createRepeated() => $pb.PbList<RequestBlob>();
  @$core.pragma('dart2js:noInline')
  static RequestBlob getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestBlob>(create);
  static RequestBlob _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get sessionTexture => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get sessionComment => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get channelDescription => $_getList(2);
}

class ServerConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ServerConfig', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'maxBandwidth', $pb.PbFieldType.OU3)
    ..aOS(2, 'welcomeText')
    ..aOB(3, 'allowHtml')
    ..a<$core.int>(4, 'messageLength', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'imageMessageLength', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, 'maxUsers', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ServerConfig._() : super();
  factory ServerConfig() => create();
  factory ServerConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ServerConfig clone() => ServerConfig()..mergeFromMessage(this);
  ServerConfig copyWith(void Function(ServerConfig) updates) => super.copyWith((message) => updates(message as ServerConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerConfig create() => ServerConfig._();
  ServerConfig createEmptyInstance() => create();
  static $pb.PbList<ServerConfig> createRepeated() => $pb.PbList<ServerConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerConfig>(create);
  static ServerConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxBandwidth => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxBandwidth($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxBandwidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxBandwidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get welcomeText => $_getSZ(1);
  @$pb.TagNumber(2)
  set welcomeText($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWelcomeText() => $_has(1);
  @$pb.TagNumber(2)
  void clearWelcomeText() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get allowHtml => $_getBF(2);
  @$pb.TagNumber(3)
  set allowHtml($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowHtml() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowHtml() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get messageLength => $_getIZ(3);
  @$pb.TagNumber(4)
  set messageLength($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageLength() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageLength() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get imageMessageLength => $_getIZ(4);
  @$pb.TagNumber(5)
  set imageMessageLength($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageMessageLength() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageMessageLength() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get maxUsers => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxUsers($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxUsers() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxUsers() => clearField(6);
}

class SuggestConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SuggestConfig', package: const $pb.PackageName('MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, 'version', $pb.PbFieldType.OU3)
    ..aOB(2, 'positional')
    ..aOB(3, 'pushToTalk')
    ..hasRequiredFields = false
  ;

  SuggestConfig._() : super();
  factory SuggestConfig() => create();
  factory SuggestConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SuggestConfig clone() => SuggestConfig()..mergeFromMessage(this);
  SuggestConfig copyWith(void Function(SuggestConfig) updates) => super.copyWith((message) => updates(message as SuggestConfig));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestConfig create() => SuggestConfig._();
  SuggestConfig createEmptyInstance() => create();
  static $pb.PbList<SuggestConfig> createRepeated() => $pb.PbList<SuggestConfig>();
  @$core.pragma('dart2js:noInline')
  static SuggestConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestConfig>(create);
  static SuggestConfig _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get positional => $_getBF(1);
  @$pb.TagNumber(2)
  set positional($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPositional() => $_has(1);
  @$pb.TagNumber(2)
  void clearPositional() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get pushToTalk => $_getBF(2);
  @$pb.TagNumber(3)
  set pushToTalk($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPushToTalk() => $_has(2);
  @$pb.TagNumber(3)
  void clearPushToTalk() => clearField(3);
}

