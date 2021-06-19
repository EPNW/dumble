///
//  Generated code. Do not modify.
//  source: Mumble.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Mumble.pbenum.dart';

export 'Mumble.pbenum.dart';

class Version extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Version', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'release')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'os')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'osVersion')
    ..hasRequiredFields = false
  ;

  Version._() : super();
  factory Version({
    $core.int? version,
    $core.String? release,
    $core.String? os,
    $core.String? osVersion,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (release != null) {
      _result.release = release;
    }
    if (os != null) {
      _result.os = os;
    }
    if (osVersion != null) {
      _result.osVersion = osVersion;
    }
    return _result;
  }
  factory Version.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Version.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Version clone() => Version()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Version copyWith(void Function(Version) updates) => super.copyWith((message) => updates(message as Version)) as Version; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Version create() => Version._();
  Version createEmptyInstance() => create();
  static $pb.PbList<Version> createRepeated() => $pb.PbList<Version>();
  @$core.pragma('dart2js:noInline')
  static Version getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Version>(create);
  static Version? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UDPTunnel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'packet', $pb.PbFieldType.QY)
  ;

  UDPTunnel._() : super();
  factory UDPTunnel({
    $core.List<$core.int>? packet,
  }) {
    final _result = create();
    if (packet != null) {
      _result.packet = packet;
    }
    return _result;
  }
  factory UDPTunnel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UDPTunnel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UDPTunnel clone() => UDPTunnel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UDPTunnel copyWith(void Function(UDPTunnel) updates) => super.copyWith((message) => updates(message as UDPTunnel)) as UDPTunnel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UDPTunnel create() => UDPTunnel._();
  UDPTunnel createEmptyInstance() => create();
  static $pb.PbList<UDPTunnel> createRepeated() => $pb.PbList<UDPTunnel>();
  @$core.pragma('dart2js:noInline')
  static UDPTunnel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UDPTunnel>(create);
  static UDPTunnel? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Authenticate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokens')
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'celtVersions', $pb.PbFieldType.P3)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opus')
    ..hasRequiredFields = false
  ;

  Authenticate._() : super();
  factory Authenticate({
    $core.String? username,
    $core.String? password,
    $core.Iterable<$core.String>? tokens,
    $core.Iterable<$core.int>? celtVersions,
    $core.bool? opus,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (password != null) {
      _result.password = password;
    }
    if (tokens != null) {
      _result.tokens.addAll(tokens);
    }
    if (celtVersions != null) {
      _result.celtVersions.addAll(celtVersions);
    }
    if (opus != null) {
      _result.opus = opus;
    }
    return _result;
  }
  factory Authenticate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticate clone() => Authenticate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticate copyWith(void Function(Authenticate) updates) => super.copyWith((message) => updates(message as Authenticate)) as Authenticate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Authenticate create() => Authenticate._();
  Authenticate createEmptyInstance() => create();
  static $pb.PbList<Authenticate> createRepeated() => $pb.PbList<Authenticate>();
  @$core.pragma('dart2js:noInline')
  static Authenticate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate>(create);
  static Authenticate? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Ping', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'good', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'late', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lost', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resync', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'udpPackets', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tcpPackets', $pb.PbFieldType.OU3)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'udpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'udpPingVar', $pb.PbFieldType.OF)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tcpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tcpPingVar', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Ping._() : super();
  factory Ping({
    $fixnum.Int64? timestamp,
    $core.int? good,
    $core.int? late,
    $core.int? lost,
    $core.int? resync,
    $core.int? udpPackets,
    $core.int? tcpPackets,
    $core.double? udpPingAvg,
    $core.double? udpPingVar,
    $core.double? tcpPingAvg,
    $core.double? tcpPingVar,
  }) {
    final _result = create();
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (good != null) {
      _result.good = good;
    }
    if (late != null) {
      _result.late = late;
    }
    if (lost != null) {
      _result.lost = lost;
    }
    if (resync != null) {
      _result.resync = resync;
    }
    if (udpPackets != null) {
      _result.udpPackets = udpPackets;
    }
    if (tcpPackets != null) {
      _result.tcpPackets = tcpPackets;
    }
    if (udpPingAvg != null) {
      _result.udpPingAvg = udpPingAvg;
    }
    if (udpPingVar != null) {
      _result.udpPingVar = udpPingVar;
    }
    if (tcpPingAvg != null) {
      _result.tcpPingAvg = tcpPingAvg;
    }
    if (tcpPingVar != null) {
      _result.tcpPingVar = tcpPingVar;
    }
    return _result;
  }
  factory Ping.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ping.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ping clone() => Ping()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ping copyWith(void Function(Ping) updates) => super.copyWith((message) => updates(message as Ping)) as Ping; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ping create() => Ping._();
  Ping createEmptyInstance() => create();
  static $pb.PbList<Ping> createRepeated() => $pb.PbList<Ping>();
  @$core.pragma('dart2js:noInline')
  static Ping getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Reject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..e<Reject_RejectType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Reject_RejectType.None, valueOf: Reject_RejectType.valueOf, enumValues: Reject_RejectType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  Reject._() : super();
  factory Reject({
    Reject_RejectType? type,
    $core.String? reason,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    return _result;
  }
  factory Reject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reject clone() => Reject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reject copyWith(void Function(Reject) updates) => super.copyWith((message) => updates(message as Reject)) as Reject; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Reject create() => Reject._();
  Reject createEmptyInstance() => create();
  static $pb.PbList<Reject> createRepeated() => $pb.PbList<Reject>();
  @$core.pragma('dart2js:noInline')
  static Reject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reject>(create);
  static Reject? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerSync', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxBandwidth', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'welcomeText')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissions', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ServerSync._() : super();
  factory ServerSync({
    $core.int? session,
    $core.int? maxBandwidth,
    $core.String? welcomeText,
    $fixnum.Int64? permissions,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    if (maxBandwidth != null) {
      _result.maxBandwidth = maxBandwidth;
    }
    if (welcomeText != null) {
      _result.welcomeText = welcomeText;
    }
    if (permissions != null) {
      _result.permissions = permissions;
    }
    return _result;
  }
  factory ServerSync.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerSync.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerSync clone() => ServerSync()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerSync copyWith(void Function(ServerSync) updates) => super.copyWith((message) => updates(message as ServerSync)) as ServerSync; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerSync create() => ServerSync._();
  ServerSync createEmptyInstance() => create();
  static $pb.PbList<ServerSync> createRepeated() => $pb.PbList<ServerSync>();
  @$core.pragma('dart2js:noInline')
  static ServerSync getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerSync>(create);
  static ServerSync? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChannelRemove', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.QU3)
  ;

  ChannelRemove._() : super();
  factory ChannelRemove({
    $core.int? channelId,
  }) {
    final _result = create();
    if (channelId != null) {
      _result.channelId = channelId;
    }
    return _result;
  }
  factory ChannelRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelRemove clone() => ChannelRemove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelRemove copyWith(void Function(ChannelRemove) updates) => super.copyWith((message) => updates(message as ChannelRemove)) as ChannelRemove; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChannelRemove create() => ChannelRemove._();
  ChannelRemove createEmptyInstance() => create();
  static $pb.PbList<ChannelRemove> createRepeated() => $pb.PbList<ChannelRemove>();
  @$core.pragma('dart2js:noInline')
  static ChannelRemove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelRemove>(create);
  static ChannelRemove? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChannelState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parent', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'links', $pb.PbFieldType.PU3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..p<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linksAdd', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linksRemove', $pb.PbFieldType.PU3)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temporary')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descriptionHash', $pb.PbFieldType.OY)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxUsers', $pb.PbFieldType.OU3)
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isEnterRestricted')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'canEnter')
    ..hasRequiredFields = false
  ;

  ChannelState._() : super();
  factory ChannelState({
    $core.int? channelId,
    $core.int? parent,
    $core.String? name,
    $core.Iterable<$core.int>? links,
    $core.String? description,
    $core.Iterable<$core.int>? linksAdd,
    $core.Iterable<$core.int>? linksRemove,
    $core.bool? temporary,
    $core.int? position,
    $core.List<$core.int>? descriptionHash,
    $core.int? maxUsers,
    $core.bool? isEnterRestricted,
    $core.bool? canEnter,
  }) {
    final _result = create();
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (parent != null) {
      _result.parent = parent;
    }
    if (name != null) {
      _result.name = name;
    }
    if (links != null) {
      _result.links.addAll(links);
    }
    if (description != null) {
      _result.description = description;
    }
    if (linksAdd != null) {
      _result.linksAdd.addAll(linksAdd);
    }
    if (linksRemove != null) {
      _result.linksRemove.addAll(linksRemove);
    }
    if (temporary != null) {
      _result.temporary = temporary;
    }
    if (position != null) {
      _result.position = position;
    }
    if (descriptionHash != null) {
      _result.descriptionHash = descriptionHash;
    }
    if (maxUsers != null) {
      _result.maxUsers = maxUsers;
    }
    if (isEnterRestricted != null) {
      _result.isEnterRestricted = isEnterRestricted;
    }
    if (canEnter != null) {
      _result.canEnter = canEnter;
    }
    return _result;
  }
  factory ChannelState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelState clone() => ChannelState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelState copyWith(void Function(ChannelState) updates) => super.copyWith((message) => updates(message as ChannelState)) as ChannelState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChannelState create() => ChannelState._();
  ChannelState createEmptyInstance() => create();
  static $pb.PbList<ChannelState> createRepeated() => $pb.PbList<ChannelState>();
  @$core.pragma('dart2js:noInline')
  static ChannelState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelState>(create);
  static ChannelState? _defaultInstance;

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

  @$pb.TagNumber(12)
  $core.bool get isEnterRestricted => $_getBF(11);
  @$pb.TagNumber(12)
  set isEnterRestricted($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsEnterRestricted() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsEnterRestricted() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get canEnter => $_getBF(12);
  @$pb.TagNumber(13)
  set canEnter($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCanEnter() => $_has(12);
  @$pb.TagNumber(13)
  void clearCanEnter() => clearField(13);
}

class UserRemove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserRemove', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.QU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actor', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ban')
  ;

  UserRemove._() : super();
  factory UserRemove({
    $core.int? session,
    $core.int? actor,
    $core.String? reason,
    $core.bool? ban,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    if (actor != null) {
      _result.actor = actor;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    if (ban != null) {
      _result.ban = ban;
    }
    return _result;
  }
  factory UserRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRemove clone() => UserRemove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRemove copyWith(void Function(UserRemove) updates) => super.copyWith((message) => updates(message as UserRemove)) as UserRemove; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRemove create() => UserRemove._();
  UserRemove createEmptyInstance() => create();
  static $pb.PbList<UserRemove> createRepeated() => $pb.PbList<UserRemove>();
  @$core.pragma('dart2js:noInline')
  static UserRemove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRemove>(create);
  static UserRemove? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actor', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mute')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deaf')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suppress')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selfMute')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selfDeaf')
    ..a<$core.List<$core.int>>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'texture', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pluginContext', $pb.PbFieldType.OY)
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pluginIdentity')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..a<$core.List<$core.int>>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'textureHash', $pb.PbFieldType.OY)
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prioritySpeaker')
    ..aOB(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recording')
    ..pPS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temporaryAccessTokens')
    ..p<$core.int>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listeningChannelAdd', $pb.PbFieldType.PU3)
    ..p<$core.int>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listeningChannelRemove', $pb.PbFieldType.PU3)
    ..hasRequiredFields = false
  ;

  UserState._() : super();
  factory UserState({
    $core.int? session,
    $core.int? actor,
    $core.String? name,
    $core.int? userId,
    $core.int? channelId,
    $core.bool? mute,
    $core.bool? deaf,
    $core.bool? suppress,
    $core.bool? selfMute,
    $core.bool? selfDeaf,
    $core.List<$core.int>? texture,
    $core.List<$core.int>? pluginContext,
    $core.String? pluginIdentity,
    $core.String? comment,
    $core.String? hash,
    $core.List<$core.int>? commentHash,
    $core.List<$core.int>? textureHash,
    $core.bool? prioritySpeaker,
    $core.bool? recording,
    $core.Iterable<$core.String>? temporaryAccessTokens,
    $core.Iterable<$core.int>? listeningChannelAdd,
    $core.Iterable<$core.int>? listeningChannelRemove,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    if (actor != null) {
      _result.actor = actor;
    }
    if (name != null) {
      _result.name = name;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (mute != null) {
      _result.mute = mute;
    }
    if (deaf != null) {
      _result.deaf = deaf;
    }
    if (suppress != null) {
      _result.suppress = suppress;
    }
    if (selfMute != null) {
      _result.selfMute = selfMute;
    }
    if (selfDeaf != null) {
      _result.selfDeaf = selfDeaf;
    }
    if (texture != null) {
      _result.texture = texture;
    }
    if (pluginContext != null) {
      _result.pluginContext = pluginContext;
    }
    if (pluginIdentity != null) {
      _result.pluginIdentity = pluginIdentity;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (commentHash != null) {
      _result.commentHash = commentHash;
    }
    if (textureHash != null) {
      _result.textureHash = textureHash;
    }
    if (prioritySpeaker != null) {
      _result.prioritySpeaker = prioritySpeaker;
    }
    if (recording != null) {
      _result.recording = recording;
    }
    if (temporaryAccessTokens != null) {
      _result.temporaryAccessTokens.addAll(temporaryAccessTokens);
    }
    if (listeningChannelAdd != null) {
      _result.listeningChannelAdd.addAll(listeningChannelAdd);
    }
    if (listeningChannelRemove != null) {
      _result.listeningChannelRemove.addAll(listeningChannelRemove);
    }
    return _result;
  }
  factory UserState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserState clone() => UserState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserState copyWith(void Function(UserState) updates) => super.copyWith((message) => updates(message as UserState)) as UserState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserState create() => UserState._();
  UserState createEmptyInstance() => create();
  static $pb.PbList<UserState> createRepeated() => $pb.PbList<UserState>();
  @$core.pragma('dart2js:noInline')
  static UserState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserState>(create);
  static UserState? _defaultInstance;

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

  @$pb.TagNumber(20)
  $core.List<$core.String> get temporaryAccessTokens => $_getList(19);

  @$pb.TagNumber(21)
  $core.List<$core.int> get listeningChannelAdd => $_getList(20);

  @$pb.TagNumber(22)
  $core.List<$core.int> get listeningChannelRemove => $_getList(21);
}

class BanList_BanEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BanList.BanEntry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', $pb.PbFieldType.QY)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mask', $pb.PbFieldType.QU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'start')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', $pb.PbFieldType.OU3)
  ;

  BanList_BanEntry._() : super();
  factory BanList_BanEntry({
    $core.List<$core.int>? address,
    $core.int? mask,
    $core.String? name,
    $core.String? hash,
    $core.String? reason,
    $core.String? start,
    $core.int? duration,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (mask != null) {
      _result.mask = mask;
    }
    if (name != null) {
      _result.name = name;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    if (start != null) {
      _result.start = start;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory BanList_BanEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BanList_BanEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BanList_BanEntry clone() => BanList_BanEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BanList_BanEntry copyWith(void Function(BanList_BanEntry) updates) => super.copyWith((message) => updates(message as BanList_BanEntry)) as BanList_BanEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BanList_BanEntry create() => BanList_BanEntry._();
  BanList_BanEntry createEmptyInstance() => create();
  static $pb.PbList<BanList_BanEntry> createRepeated() => $pb.PbList<BanList_BanEntry>();
  @$core.pragma('dart2js:noInline')
  static BanList_BanEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanList_BanEntry>(create);
  static BanList_BanEntry? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BanList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..pc<BanList_BanEntry>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bans', $pb.PbFieldType.PM, subBuilder: BanList_BanEntry.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
  ;

  BanList._() : super();
  factory BanList({
    $core.Iterable<BanList_BanEntry>? bans,
    $core.bool? query,
  }) {
    final _result = create();
    if (bans != null) {
      _result.bans.addAll(bans);
    }
    if (query != null) {
      _result.query = query;
    }
    return _result;
  }
  factory BanList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BanList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BanList clone() => BanList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BanList copyWith(void Function(BanList) updates) => super.copyWith((message) => updates(message as BanList)) as BanList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BanList create() => BanList._();
  BanList createEmptyInstance() => create();
  static $pb.PbList<BanList> createRepeated() => $pb.PbList<BanList>();
  @$core.pragma('dart2js:noInline')
  static BanList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanList>(create);
  static BanList? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TextMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actor', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.PU3)
    ..p<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.PU3)
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'treeId', $pb.PbFieldType.PU3)
    ..aQS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
  ;

  TextMessage._() : super();
  factory TextMessage({
    $core.int? actor,
    $core.Iterable<$core.int>? session,
    $core.Iterable<$core.int>? channelId,
    $core.Iterable<$core.int>? treeId,
    $core.String? message,
  }) {
    final _result = create();
    if (actor != null) {
      _result.actor = actor;
    }
    if (session != null) {
      _result.session.addAll(session);
    }
    if (channelId != null) {
      _result.channelId.addAll(channelId);
    }
    if (treeId != null) {
      _result.treeId.addAll(treeId);
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory TextMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextMessage clone() => TextMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextMessage copyWith(void Function(TextMessage) updates) => super.copyWith((message) => updates(message as TextMessage)) as TextMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TextMessage create() => TextMessage._();
  TextMessage createEmptyInstance() => create();
  static $pb.PbList<TextMessage> createRepeated() => $pb.PbList<TextMessage>();
  @$core.pragma('dart2js:noInline')
  static TextMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMessage>(create);
  static TextMessage? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PermissionDenied', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..e<PermissionDenied_DenyType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PermissionDenied_DenyType.Text, valueOf: PermissionDenied_DenyType.valueOf, enumValues: PermissionDenied_DenyType.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  PermissionDenied._() : super();
  factory PermissionDenied({
    $core.int? permission,
    $core.int? channelId,
    $core.int? session,
    $core.String? reason,
    PermissionDenied_DenyType? type,
    $core.String? name,
  }) {
    final _result = create();
    if (permission != null) {
      _result.permission = permission;
    }
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (session != null) {
      _result.session = session;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory PermissionDenied.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionDenied.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionDenied clone() => PermissionDenied()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionDenied copyWith(void Function(PermissionDenied) updates) => super.copyWith((message) => updates(message as PermissionDenied)) as PermissionDenied; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermissionDenied create() => PermissionDenied._();
  PermissionDenied createEmptyInstance() => create();
  static $pb.PbList<PermissionDenied> createRepeated() => $pb.PbList<PermissionDenied>();
  @$core.pragma('dart2js:noInline')
  static PermissionDenied getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionDenied>(create);
  static PermissionDenied? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ACL.ChanGroup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.bool>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inherited', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inherit', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inheritable', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..p<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'add', $pb.PbFieldType.PU3)
    ..p<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remove', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inheritedMembers', $pb.PbFieldType.PU3)
  ;

  ACL_ChanGroup._() : super();
  factory ACL_ChanGroup({
    $core.String? name,
    $core.bool? inherited,
    $core.bool? inherit,
    $core.bool? inheritable,
    $core.Iterable<$core.int>? add,
    $core.Iterable<$core.int>? remove,
    $core.Iterable<$core.int>? inheritedMembers,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (inherited != null) {
      _result.inherited = inherited;
    }
    if (inherit != null) {
      _result.inherit = inherit;
    }
    if (inheritable != null) {
      _result.inheritable = inheritable;
    }
    if (add != null) {
      _result.add.addAll(add);
    }
    if (remove != null) {
      _result.remove.addAll(remove);
    }
    if (inheritedMembers != null) {
      _result.inheritedMembers.addAll(inheritedMembers);
    }
    return _result;
  }
  factory ACL_ChanGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL_ChanGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ACL_ChanGroup clone() => ACL_ChanGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ACL_ChanGroup copyWith(void Function(ACL_ChanGroup) updates) => super.copyWith((message) => updates(message as ACL_ChanGroup)) as ACL_ChanGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ACL_ChanGroup create() => ACL_ChanGroup._();
  ACL_ChanGroup createEmptyInstance() => create();
  static $pb.PbList<ACL_ChanGroup> createRepeated() => $pb.PbList<ACL_ChanGroup>();
  @$core.pragma('dart2js:noInline')
  static ACL_ChanGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL_ChanGroup>(create);
  static ACL_ChanGroup? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ACL.ChanACL', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'applyHere', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'applySubs', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inherited', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.OU3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grant', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deny', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ACL_ChanACL._() : super();
  factory ACL_ChanACL({
    $core.bool? applyHere,
    $core.bool? applySubs,
    $core.bool? inherited,
    $core.int? userId,
    $core.String? group,
    $core.int? grant,
    $core.int? deny,
  }) {
    final _result = create();
    if (applyHere != null) {
      _result.applyHere = applyHere;
    }
    if (applySubs != null) {
      _result.applySubs = applySubs;
    }
    if (inherited != null) {
      _result.inherited = inherited;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (group != null) {
      _result.group = group;
    }
    if (grant != null) {
      _result.grant = grant;
    }
    if (deny != null) {
      _result.deny = deny;
    }
    return _result;
  }
  factory ACL_ChanACL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL_ChanACL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ACL_ChanACL clone() => ACL_ChanACL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ACL_ChanACL copyWith(void Function(ACL_ChanACL) updates) => super.copyWith((message) => updates(message as ACL_ChanACL)) as ACL_ChanACL; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ACL_ChanACL create() => ACL_ChanACL._();
  ACL_ChanACL createEmptyInstance() => create();
  static $pb.PbList<ACL_ChanACL> createRepeated() => $pb.PbList<ACL_ChanACL>();
  @$core.pragma('dart2js:noInline')
  static ACL_ChanACL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL_ChanACL>(create);
  static ACL_ChanACL? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ACL', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.QU3)
    ..a<$core.bool>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inheritAcls', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..pc<ACL_ChanGroup>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: ACL_ChanGroup.create)
    ..pc<ACL_ChanACL>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acls', $pb.PbFieldType.PM, subBuilder: ACL_ChanACL.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
  ;

  ACL._() : super();
  factory ACL({
    $core.int? channelId,
    $core.bool? inheritAcls,
    $core.Iterable<ACL_ChanGroup>? groups,
    $core.Iterable<ACL_ChanACL>? acls,
    $core.bool? query,
  }) {
    final _result = create();
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (inheritAcls != null) {
      _result.inheritAcls = inheritAcls;
    }
    if (groups != null) {
      _result.groups.addAll(groups);
    }
    if (acls != null) {
      _result.acls.addAll(acls);
    }
    if (query != null) {
      _result.query = query;
    }
    return _result;
  }
  factory ACL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ACL clone() => ACL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ACL copyWith(void Function(ACL) updates) => super.copyWith((message) => updates(message as ACL)) as ACL; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ACL create() => ACL._();
  ACL createEmptyInstance() => create();
  static $pb.PbList<ACL> createRepeated() => $pb.PbList<ACL>();
  @$core.pragma('dart2js:noInline')
  static ACL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL>(create);
  static ACL? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryUsers', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.PU3)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'names')
    ..hasRequiredFields = false
  ;

  QueryUsers._() : super();
  factory QueryUsers({
    $core.Iterable<$core.int>? ids,
    $core.Iterable<$core.String>? names,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    if (names != null) {
      _result.names.addAll(names);
    }
    return _result;
  }
  factory QueryUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryUsers clone() => QueryUsers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryUsers copyWith(void Function(QueryUsers) updates) => super.copyWith((message) => updates(message as QueryUsers)) as QueryUsers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryUsers create() => QueryUsers._();
  QueryUsers createEmptyInstance() => create();
  static $pb.PbList<QueryUsers> createRepeated() => $pb.PbList<QueryUsers>();
  @$core.pragma('dart2js:noInline')
  static QueryUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryUsers>(create);
  static QueryUsers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ids => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get names => $_getList(1);
}

class CryptSetup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CryptSetup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientNonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serverNonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  CryptSetup._() : super();
  factory CryptSetup({
    $core.List<$core.int>? key,
    $core.List<$core.int>? clientNonce,
    $core.List<$core.int>? serverNonce,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (clientNonce != null) {
      _result.clientNonce = clientNonce;
    }
    if (serverNonce != null) {
      _result.serverNonce = serverNonce;
    }
    return _result;
  }
  factory CryptSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CryptSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CryptSetup clone() => CryptSetup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CryptSetup copyWith(void Function(CryptSetup) updates) => super.copyWith((message) => updates(message as CryptSetup)) as CryptSetup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CryptSetup create() => CryptSetup._();
  CryptSetup createEmptyInstance() => create();
  static $pb.PbList<CryptSetup> createRepeated() => $pb.PbList<CryptSetup>();
  @$core.pragma('dart2js:noInline')
  static CryptSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CryptSetup>(create);
  static CryptSetup? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContextActionModify', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'action')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'context', $pb.PbFieldType.OU3)
    ..e<ContextActionModify_Operation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operation', $pb.PbFieldType.OE, defaultOrMaker: ContextActionModify_Operation.Add, valueOf: ContextActionModify_Operation.valueOf, enumValues: ContextActionModify_Operation.values)
  ;

  ContextActionModify._() : super();
  factory ContextActionModify({
    $core.String? action,
    $core.String? text,
    $core.int? context,
    ContextActionModify_Operation? operation,
  }) {
    final _result = create();
    if (action != null) {
      _result.action = action;
    }
    if (text != null) {
      _result.text = text;
    }
    if (context != null) {
      _result.context = context;
    }
    if (operation != null) {
      _result.operation = operation;
    }
    return _result;
  }
  factory ContextActionModify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextActionModify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContextActionModify clone() => ContextActionModify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContextActionModify copyWith(void Function(ContextActionModify) updates) => super.copyWith((message) => updates(message as ContextActionModify)) as ContextActionModify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextActionModify create() => ContextActionModify._();
  ContextActionModify createEmptyInstance() => create();
  static $pb.PbList<ContextActionModify> createRepeated() => $pb.PbList<ContextActionModify>();
  @$core.pragma('dart2js:noInline')
  static ContextActionModify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextActionModify>(create);
  static ContextActionModify? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContextAction', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'action')
  ;

  ContextAction._() : super();
  factory ContextAction({
    $core.int? session,
    $core.int? channelId,
    $core.String? action,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (action != null) {
      _result.action = action;
    }
    return _result;
  }
  factory ContextAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContextAction clone() => ContextAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContextAction copyWith(void Function(ContextAction) updates) => super.copyWith((message) => updates(message as ContextAction)) as ContextAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextAction create() => ContextAction._();
  ContextAction createEmptyInstance() => create();
  static $pb.PbList<ContextAction> createRepeated() => $pb.PbList<ContextAction>();
  @$core.pragma('dart2js:noInline')
  static ContextAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextAction>(create);
  static ContextAction? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserList.User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.QU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastSeen')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastChannel', $pb.PbFieldType.OU3)
  ;

  UserList_User._() : super();
  factory UserList_User({
    $core.int? userId,
    $core.String? name,
    $core.String? lastSeen,
    $core.int? lastChannel,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (lastSeen != null) {
      _result.lastSeen = lastSeen;
    }
    if (lastChannel != null) {
      _result.lastChannel = lastChannel;
    }
    return _result;
  }
  factory UserList_User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList_User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserList_User clone() => UserList_User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserList_User copyWith(void Function(UserList_User) updates) => super.copyWith((message) => updates(message as UserList_User)) as UserList_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList_User create() => UserList_User._();
  UserList_User createEmptyInstance() => create();
  static $pb.PbList<UserList_User> createRepeated() => $pb.PbList<UserList_User>();
  @$core.pragma('dart2js:noInline')
  static UserList_User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList_User>(create);
  static UserList_User? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..pc<UserList_User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserList_User.create)
  ;

  UserList._() : super();
  factory UserList({
    $core.Iterable<UserList_User>? users,
  }) {
    final _result = create();
    if (users != null) {
      _result.users.addAll(users);
    }
    return _result;
  }
  factory UserList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserList clone() => UserList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserList copyWith(void Function(UserList) updates) => super.copyWith((message) => updates(message as UserList)) as UserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  UserList createEmptyInstance() => create();
  static $pb.PbList<UserList> createRepeated() => $pb.PbList<UserList>();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserList_User> get users => $_getList(0);
}

class VoiceTarget_Target extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoiceTarget.Target', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.PU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'links')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'children')
    ..hasRequiredFields = false
  ;

  VoiceTarget_Target._() : super();
  factory VoiceTarget_Target({
    $core.Iterable<$core.int>? session,
    $core.int? channelId,
    $core.String? group,
    $core.bool? links,
    $core.bool? children,
  }) {
    final _result = create();
    if (session != null) {
      _result.session.addAll(session);
    }
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (group != null) {
      _result.group = group;
    }
    if (links != null) {
      _result.links = links;
    }
    if (children != null) {
      _result.children = children;
    }
    return _result;
  }
  factory VoiceTarget_Target.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceTarget_Target.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceTarget_Target clone() => VoiceTarget_Target()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceTarget_Target copyWith(void Function(VoiceTarget_Target) updates) => super.copyWith((message) => updates(message as VoiceTarget_Target)) as VoiceTarget_Target; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoiceTarget_Target create() => VoiceTarget_Target._();
  VoiceTarget_Target createEmptyInstance() => create();
  static $pb.PbList<VoiceTarget_Target> createRepeated() => $pb.PbList<VoiceTarget_Target>();
  @$core.pragma('dart2js:noInline')
  static VoiceTarget_Target getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceTarget_Target>(create);
  static VoiceTarget_Target? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoiceTarget', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OU3)
    ..pc<VoiceTarget_Target>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targets', $pb.PbFieldType.PM, subBuilder: VoiceTarget_Target.create)
    ..hasRequiredFields = false
  ;

  VoiceTarget._() : super();
  factory VoiceTarget({
    $core.int? id,
    $core.Iterable<VoiceTarget_Target>? targets,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (targets != null) {
      _result.targets.addAll(targets);
    }
    return _result;
  }
  factory VoiceTarget.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceTarget.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceTarget clone() => VoiceTarget()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceTarget copyWith(void Function(VoiceTarget) updates) => super.copyWith((message) => updates(message as VoiceTarget)) as VoiceTarget; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoiceTarget create() => VoiceTarget._();
  VoiceTarget createEmptyInstance() => create();
  static $pb.PbList<VoiceTarget> createRepeated() => $pb.PbList<VoiceTarget>();
  @$core.pragma('dart2js:noInline')
  static VoiceTarget getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceTarget>(create);
  static VoiceTarget? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PermissionQuery', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissions', $pb.PbFieldType.OU3)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flush')
    ..hasRequiredFields = false
  ;

  PermissionQuery._() : super();
  factory PermissionQuery({
    $core.int? channelId,
    $core.int? permissions,
    $core.bool? flush,
  }) {
    final _result = create();
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (permissions != null) {
      _result.permissions = permissions;
    }
    if (flush != null) {
      _result.flush = flush;
    }
    return _result;
  }
  factory PermissionQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionQuery clone() => PermissionQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionQuery copyWith(void Function(PermissionQuery) updates) => super.copyWith((message) => updates(message as PermissionQuery)) as PermissionQuery; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermissionQuery create() => PermissionQuery._();
  PermissionQuery createEmptyInstance() => create();
  static $pb.PbList<PermissionQuery> createRepeated() => $pb.PbList<PermissionQuery>();
  @$core.pragma('dart2js:noInline')
  static PermissionQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionQuery>(create);
  static PermissionQuery? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CodecVersion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alpha', $pb.PbFieldType.Q3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beta', $pb.PbFieldType.Q3)
    ..a<$core.bool>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferAlpha', $pb.PbFieldType.QB, defaultOrMaker: true)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opus')
  ;

  CodecVersion._() : super();
  factory CodecVersion({
    $core.int? alpha,
    $core.int? beta,
    $core.bool? preferAlpha,
    $core.bool? opus,
  }) {
    final _result = create();
    if (alpha != null) {
      _result.alpha = alpha;
    }
    if (beta != null) {
      _result.beta = beta;
    }
    if (preferAlpha != null) {
      _result.preferAlpha = preferAlpha;
    }
    if (opus != null) {
      _result.opus = opus;
    }
    return _result;
  }
  factory CodecVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodecVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CodecVersion clone() => CodecVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CodecVersion copyWith(void Function(CodecVersion) updates) => super.copyWith((message) => updates(message as CodecVersion)) as CodecVersion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodecVersion create() => CodecVersion._();
  CodecVersion createEmptyInstance() => create();
  static $pb.PbList<CodecVersion> createRepeated() => $pb.PbList<CodecVersion>();
  @$core.pragma('dart2js:noInline')
  static CodecVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodecVersion>(create);
  static CodecVersion? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserStats.Stats', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'good', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'late', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lost', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resync', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  UserStats_Stats._() : super();
  factory UserStats_Stats({
    $core.int? good,
    $core.int? late,
    $core.int? lost,
    $core.int? resync,
  }) {
    final _result = create();
    if (good != null) {
      _result.good = good;
    }
    if (late != null) {
      _result.late = late;
    }
    if (lost != null) {
      _result.lost = lost;
    }
    if (resync != null) {
      _result.resync = resync;
    }
    return _result;
  }
  factory UserStats_Stats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStats_Stats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserStats_Stats clone() => UserStats_Stats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserStats_Stats copyWith(void Function(UserStats_Stats) updates) => super.copyWith((message) => updates(message as UserStats_Stats)) as UserStats_Stats; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserStats_Stats create() => UserStats_Stats._();
  UserStats_Stats createEmptyInstance() => create();
  static $pb.PbList<UserStats_Stats> createRepeated() => $pb.PbList<UserStats_Stats>();
  @$core.pragma('dart2js:noInline')
  static UserStats_Stats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStats_Stats>(create);
  static UserStats_Stats? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserStats', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', $pb.PbFieldType.OU3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statsOnly')
    ..p<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'certificates', $pb.PbFieldType.PY)
    ..aOM<UserStats_Stats>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromClient', subBuilder: UserStats_Stats.create)
    ..aOM<UserStats_Stats>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromServer', subBuilder: UserStats_Stats.create)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'udpPackets', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tcpPackets', $pb.PbFieldType.OU3)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'udpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'udpPingVar', $pb.PbFieldType.OF)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tcpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tcpPingVar', $pb.PbFieldType.OF)
    ..aOM<Version>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version', subBuilder: Version.create)
    ..p<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'celtVersions', $pb.PbFieldType.P3)
    ..a<$core.List<$core.int>>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bandwidth', $pb.PbFieldType.OU3)
    ..a<$core.int>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onlinesecs', $pb.PbFieldType.OU3)
    ..a<$core.int>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idlesecs', $pb.PbFieldType.OU3)
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'strongCertificate')
    ..aOB(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opus')
    ..hasRequiredFields = false
  ;

  UserStats._() : super();
  factory UserStats({
    $core.int? session,
    $core.bool? statsOnly,
    $core.Iterable<$core.List<$core.int>>? certificates,
    UserStats_Stats? fromClient,
    UserStats_Stats? fromServer,
    $core.int? udpPackets,
    $core.int? tcpPackets,
    $core.double? udpPingAvg,
    $core.double? udpPingVar,
    $core.double? tcpPingAvg,
    $core.double? tcpPingVar,
    Version? version,
    $core.Iterable<$core.int>? celtVersions,
    $core.List<$core.int>? address,
    $core.int? bandwidth,
    $core.int? onlinesecs,
    $core.int? idlesecs,
    $core.bool? strongCertificate,
    $core.bool? opus,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    if (statsOnly != null) {
      _result.statsOnly = statsOnly;
    }
    if (certificates != null) {
      _result.certificates.addAll(certificates);
    }
    if (fromClient != null) {
      _result.fromClient = fromClient;
    }
    if (fromServer != null) {
      _result.fromServer = fromServer;
    }
    if (udpPackets != null) {
      _result.udpPackets = udpPackets;
    }
    if (tcpPackets != null) {
      _result.tcpPackets = tcpPackets;
    }
    if (udpPingAvg != null) {
      _result.udpPingAvg = udpPingAvg;
    }
    if (udpPingVar != null) {
      _result.udpPingVar = udpPingVar;
    }
    if (tcpPingAvg != null) {
      _result.tcpPingAvg = tcpPingAvg;
    }
    if (tcpPingVar != null) {
      _result.tcpPingVar = tcpPingVar;
    }
    if (version != null) {
      _result.version = version;
    }
    if (celtVersions != null) {
      _result.celtVersions.addAll(celtVersions);
    }
    if (address != null) {
      _result.address = address;
    }
    if (bandwidth != null) {
      _result.bandwidth = bandwidth;
    }
    if (onlinesecs != null) {
      _result.onlinesecs = onlinesecs;
    }
    if (idlesecs != null) {
      _result.idlesecs = idlesecs;
    }
    if (strongCertificate != null) {
      _result.strongCertificate = strongCertificate;
    }
    if (opus != null) {
      _result.opus = opus;
    }
    return _result;
  }
  factory UserStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserStats clone() => UserStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserStats copyWith(void Function(UserStats) updates) => super.copyWith((message) => updates(message as UserStats)) as UserStats; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserStats create() => UserStats._();
  UserStats createEmptyInstance() => create();
  static $pb.PbList<UserStats> createRepeated() => $pb.PbList<UserStats>();
  @$core.pragma('dart2js:noInline')
  static UserStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStats>(create);
  static UserStats? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestBlob', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionTexture', $pb.PbFieldType.PU3)
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionComment', $pb.PbFieldType.PU3)
    ..p<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelDescription', $pb.PbFieldType.PU3)
    ..hasRequiredFields = false
  ;

  RequestBlob._() : super();
  factory RequestBlob({
    $core.Iterable<$core.int>? sessionTexture,
    $core.Iterable<$core.int>? sessionComment,
    $core.Iterable<$core.int>? channelDescription,
  }) {
    final _result = create();
    if (sessionTexture != null) {
      _result.sessionTexture.addAll(sessionTexture);
    }
    if (sessionComment != null) {
      _result.sessionComment.addAll(sessionComment);
    }
    if (channelDescription != null) {
      _result.channelDescription.addAll(channelDescription);
    }
    return _result;
  }
  factory RequestBlob.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestBlob.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestBlob clone() => RequestBlob()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestBlob copyWith(void Function(RequestBlob) updates) => super.copyWith((message) => updates(message as RequestBlob)) as RequestBlob; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestBlob create() => RequestBlob._();
  RequestBlob createEmptyInstance() => create();
  static $pb.PbList<RequestBlob> createRepeated() => $pb.PbList<RequestBlob>();
  @$core.pragma('dart2js:noInline')
  static RequestBlob getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestBlob>(create);
  static RequestBlob? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get sessionTexture => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get sessionComment => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get channelDescription => $_getList(2);
}

class ServerConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerConfig', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxBandwidth', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'welcomeText')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowHtml')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageLength', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageMessageLength', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxUsers', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ServerConfig._() : super();
  factory ServerConfig({
    $core.int? maxBandwidth,
    $core.String? welcomeText,
    $core.bool? allowHtml,
    $core.int? messageLength,
    $core.int? imageMessageLength,
    $core.int? maxUsers,
  }) {
    final _result = create();
    if (maxBandwidth != null) {
      _result.maxBandwidth = maxBandwidth;
    }
    if (welcomeText != null) {
      _result.welcomeText = welcomeText;
    }
    if (allowHtml != null) {
      _result.allowHtml = allowHtml;
    }
    if (messageLength != null) {
      _result.messageLength = messageLength;
    }
    if (imageMessageLength != null) {
      _result.imageMessageLength = imageMessageLength;
    }
    if (maxUsers != null) {
      _result.maxUsers = maxUsers;
    }
    return _result;
  }
  factory ServerConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerConfig clone() => ServerConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerConfig copyWith(void Function(ServerConfig) updates) => super.copyWith((message) => updates(message as ServerConfig)) as ServerConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerConfig create() => ServerConfig._();
  ServerConfig createEmptyInstance() => create();
  static $pb.PbList<ServerConfig> createRepeated() => $pb.PbList<ServerConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerConfig>(create);
  static ServerConfig? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuggestConfig', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positional')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pushToTalk')
    ..hasRequiredFields = false
  ;

  SuggestConfig._() : super();
  factory SuggestConfig({
    $core.int? version,
    $core.bool? positional,
    $core.bool? pushToTalk,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (positional != null) {
      _result.positional = positional;
    }
    if (pushToTalk != null) {
      _result.pushToTalk = pushToTalk;
    }
    return _result;
  }
  factory SuggestConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestConfig clone() => SuggestConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestConfig copyWith(void Function(SuggestConfig) updates) => super.copyWith((message) => updates(message as SuggestConfig)) as SuggestConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestConfig create() => SuggestConfig._();
  SuggestConfig createEmptyInstance() => create();
  static $pb.PbList<SuggestConfig> createRepeated() => $pb.PbList<SuggestConfig>();
  @$core.pragma('dart2js:noInline')
  static SuggestConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestConfig>(create);
  static SuggestConfig? _defaultInstance;

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

class PluginDataTransmission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PluginDataTransmission', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderSession', $pb.PbFieldType.OU3, protoName: 'senderSession')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiverSessions', $pb.PbFieldType.KU3, protoName: 'receiverSessions')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dataID', protoName: 'dataID')
    ..hasRequiredFields = false
  ;

  PluginDataTransmission._() : super();
  factory PluginDataTransmission({
    $core.int? senderSession,
    $core.Iterable<$core.int>? receiverSessions,
    $core.List<$core.int>? data,
    $core.String? dataID,
  }) {
    final _result = create();
    if (senderSession != null) {
      _result.senderSession = senderSession;
    }
    if (receiverSessions != null) {
      _result.receiverSessions.addAll(receiverSessions);
    }
    if (data != null) {
      _result.data = data;
    }
    if (dataID != null) {
      _result.dataID = dataID;
    }
    return _result;
  }
  factory PluginDataTransmission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PluginDataTransmission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PluginDataTransmission clone() => PluginDataTransmission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PluginDataTransmission copyWith(void Function(PluginDataTransmission) updates) => super.copyWith((message) => updates(message as PluginDataTransmission)) as PluginDataTransmission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PluginDataTransmission create() => PluginDataTransmission._();
  PluginDataTransmission createEmptyInstance() => create();
  static $pb.PbList<PluginDataTransmission> createRepeated() => $pb.PbList<PluginDataTransmission>();
  @$core.pragma('dart2js:noInline')
  static PluginDataTransmission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PluginDataTransmission>(create);
  static PluginDataTransmission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get senderSession => $_getIZ(0);
  @$pb.TagNumber(1)
  set senderSession($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get receiverSessions => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dataID => $_getSZ(3);
  @$pb.TagNumber(4)
  set dataID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataID() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataID() => clearField(4);
}

