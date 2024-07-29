//
//  Generated code. Do not modify.
//  source: Mumble.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Mumble.pbenum.dart';

export 'Mumble.pbenum.dart';

class Version extends $pb.GeneratedMessage {
  factory Version({
    $core.int? version,
    $core.String? release,
    $core.String? os,
    $core.String? osVersion,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (release != null) {
      $result.release = release;
    }
    if (os != null) {
      $result.os = os;
    }
    if (osVersion != null) {
      $result.osVersion = osVersion;
    }
    return $result;
  }
  Version._() : super();
  factory Version.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Version.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Version', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'release')
    ..aOS(3, _omitFieldNames ? '' : 'os')
    ..aOS(4, _omitFieldNames ? '' : 'osVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Version clone() => Version()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Version copyWith(void Function(Version) updates) => super.copyWith((message) => updates(message as Version)) as Version;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Version create() => Version._();
  Version createEmptyInstance() => create();
  static $pb.PbList<Version> createRepeated() => $pb.PbList<Version>();
  @$core.pragma('dart2js:noInline')
  static Version getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Version>(create);
  static Version? _defaultInstance;

  /// 2-byte Major, 1-byte Minor and 1-byte Patch version number.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// Client release name.
  @$pb.TagNumber(2)
  $core.String get release => $_getSZ(1);
  @$pb.TagNumber(2)
  set release($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRelease() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelease() => clearField(2);

  /// Client OS name.
  @$pb.TagNumber(3)
  $core.String get os => $_getSZ(2);
  @$pb.TagNumber(3)
  set os($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOs() => $_has(2);
  @$pb.TagNumber(3)
  void clearOs() => clearField(3);

  /// Client OS version.
  @$pb.TagNumber(4)
  $core.String get osVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set osVersion($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOsVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearOsVersion() => clearField(4);
}

/// Not used. Not even for tunneling UDP through TCP.
class UDPTunnel extends $pb.GeneratedMessage {
  factory UDPTunnel({
    $core.List<$core.int>? packet,
  }) {
    final $result = create();
    if (packet != null) {
      $result.packet = packet;
    }
    return $result;
  }
  UDPTunnel._() : super();
  factory UDPTunnel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UDPTunnel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UDPTunnel', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'packet', $pb.PbFieldType.QY)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UDPTunnel clone() => UDPTunnel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UDPTunnel copyWith(void Function(UDPTunnel) updates) => super.copyWith((message) => updates(message as UDPTunnel)) as UDPTunnel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UDPTunnel create() => UDPTunnel._();
  UDPTunnel createEmptyInstance() => create();
  static $pb.PbList<UDPTunnel> createRepeated() => $pb.PbList<UDPTunnel>();
  @$core.pragma('dart2js:noInline')
  static UDPTunnel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UDPTunnel>(create);
  static UDPTunnel? _defaultInstance;

  /// Not used.
  @$pb.TagNumber(1)
  $core.List<$core.int> get packet => $_getN(0);
  @$pb.TagNumber(1)
  set packet($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPacket() => $_has(0);
  @$pb.TagNumber(1)
  void clearPacket() => clearField(1);
}

/// Used by the client to send the authentication credentials to the server.
class Authenticate extends $pb.GeneratedMessage {
  factory Authenticate({
    $core.String? username,
    $core.String? password,
    $core.Iterable<$core.String>? tokens,
    $core.Iterable<$core.int>? celtVersions,
    $core.bool? opus,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (tokens != null) {
      $result.tokens.addAll(tokens);
    }
    if (celtVersions != null) {
      $result.celtVersions.addAll(celtVersions);
    }
    if (opus != null) {
      $result.opus = opus;
    }
    return $result;
  }
  Authenticate._() : super();
  factory Authenticate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Authenticate', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..pPS(3, _omitFieldNames ? '' : 'tokens')
    ..p<$core.int>(4, _omitFieldNames ? '' : 'celtVersions', $pb.PbFieldType.P3)
    ..aOB(5, _omitFieldNames ? '' : 'opus')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticate clone() => Authenticate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticate copyWith(void Function(Authenticate) updates) => super.copyWith((message) => updates(message as Authenticate)) as Authenticate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Authenticate create() => Authenticate._();
  Authenticate createEmptyInstance() => create();
  static $pb.PbList<Authenticate> createRepeated() => $pb.PbList<Authenticate>();
  @$core.pragma('dart2js:noInline')
  static Authenticate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate>(create);
  static Authenticate? _defaultInstance;

  /// UTF-8 encoded username.
  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  /// Server or user password.
  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  /// Additional access tokens for server ACL groups.
  @$pb.TagNumber(3)
  $core.List<$core.String> get tokens => $_getList(2);

  /// A list of CELT bitstream version constants supported by the client.
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

/// Sent by the client to notify the server that the client is still alive.
/// Server must reply to the packet with the same timestamp and its own
/// good/late/lost/resync numbers. None of the fields is strictly required.
class Ping extends $pb.GeneratedMessage {
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
    final $result = create();
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (good != null) {
      $result.good = good;
    }
    if (late != null) {
      $result.late = late;
    }
    if (lost != null) {
      $result.lost = lost;
    }
    if (resync != null) {
      $result.resync = resync;
    }
    if (udpPackets != null) {
      $result.udpPackets = udpPackets;
    }
    if (tcpPackets != null) {
      $result.tcpPackets = tcpPackets;
    }
    if (udpPingAvg != null) {
      $result.udpPingAvg = udpPingAvg;
    }
    if (udpPingVar != null) {
      $result.udpPingVar = udpPingVar;
    }
    if (tcpPingAvg != null) {
      $result.tcpPingAvg = tcpPingAvg;
    }
    if (tcpPingVar != null) {
      $result.tcpPingVar = tcpPingVar;
    }
    return $result;
  }
  Ping._() : super();
  factory Ping.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ping.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ping', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'timestamp', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'good', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'late', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'lost', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'resync', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'udpPackets', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'tcpPackets', $pb.PbFieldType.OU3)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'udpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'udpPingVar', $pb.PbFieldType.OF)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'tcpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'tcpPingVar', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ping clone() => Ping()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ping copyWith(void Function(Ping) updates) => super.copyWith((message) => updates(message as Ping)) as Ping;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ping create() => Ping._();
  Ping createEmptyInstance() => create();
  static $pb.PbList<Ping> createRepeated() => $pb.PbList<Ping>();
  @$core.pragma('dart2js:noInline')
  static Ping getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping? _defaultInstance;

  /// Client timestamp. Server should not attempt to decode.
  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  /// The amount of good packets received.
  @$pb.TagNumber(2)
  $core.int get good => $_getIZ(1);
  @$pb.TagNumber(2)
  set good($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGood() => $_has(1);
  @$pb.TagNumber(2)
  void clearGood() => clearField(2);

  /// The amount of late packets received.
  @$pb.TagNumber(3)
  $core.int get late => $_getIZ(2);
  @$pb.TagNumber(3)
  set late($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLate() => $_has(2);
  @$pb.TagNumber(3)
  void clearLate() => clearField(3);

  /// The amount of packets never received.
  @$pb.TagNumber(4)
  $core.int get lost => $_getIZ(3);
  @$pb.TagNumber(4)
  set lost($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLost() => $_has(3);
  @$pb.TagNumber(4)
  void clearLost() => clearField(4);

  /// The amount of nonce resyncs.
  @$pb.TagNumber(5)
  $core.int get resync => $_getIZ(4);
  @$pb.TagNumber(5)
  set resync($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResync() => $_has(4);
  @$pb.TagNumber(5)
  void clearResync() => clearField(5);

  /// The total amount of UDP packets received.
  @$pb.TagNumber(6)
  $core.int get udpPackets => $_getIZ(5);
  @$pb.TagNumber(6)
  set udpPackets($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUdpPackets() => $_has(5);
  @$pb.TagNumber(6)
  void clearUdpPackets() => clearField(6);

  /// The total amount of TCP packets received.
  @$pb.TagNumber(7)
  $core.int get tcpPackets => $_getIZ(6);
  @$pb.TagNumber(7)
  set tcpPackets($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTcpPackets() => $_has(6);
  @$pb.TagNumber(7)
  void clearTcpPackets() => clearField(7);

  /// UDP ping average.
  @$pb.TagNumber(8)
  $core.double get udpPingAvg => $_getN(7);
  @$pb.TagNumber(8)
  set udpPingAvg($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUdpPingAvg() => $_has(7);
  @$pb.TagNumber(8)
  void clearUdpPingAvg() => clearField(8);

  /// UDP ping variance.
  @$pb.TagNumber(9)
  $core.double get udpPingVar => $_getN(8);
  @$pb.TagNumber(9)
  set udpPingVar($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUdpPingVar() => $_has(8);
  @$pb.TagNumber(9)
  void clearUdpPingVar() => clearField(9);

  /// TCP ping average.
  @$pb.TagNumber(10)
  $core.double get tcpPingAvg => $_getN(9);
  @$pb.TagNumber(10)
  set tcpPingAvg($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTcpPingAvg() => $_has(9);
  @$pb.TagNumber(10)
  void clearTcpPingAvg() => clearField(10);

  /// TCP ping variance.
  @$pb.TagNumber(11)
  $core.double get tcpPingVar => $_getN(10);
  @$pb.TagNumber(11)
  set tcpPingVar($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTcpPingVar() => $_has(10);
  @$pb.TagNumber(11)
  void clearTcpPingVar() => clearField(11);
}

/// Sent by the server when it rejects the user connection.
class Reject extends $pb.GeneratedMessage {
  factory Reject({
    Reject_RejectType? type,
    $core.String? reason,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  Reject._() : super();
  factory Reject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reject', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..e<Reject_RejectType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Reject_RejectType.None, valueOf: Reject_RejectType.valueOf, enumValues: Reject_RejectType.values)
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reject clone() => Reject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reject copyWith(void Function(Reject) updates) => super.copyWith((message) => updates(message as Reject)) as Reject;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reject create() => Reject._();
  Reject createEmptyInstance() => create();
  static $pb.PbList<Reject> createRepeated() => $pb.PbList<Reject>();
  @$core.pragma('dart2js:noInline')
  static Reject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reject>(create);
  static Reject? _defaultInstance;

  /// Rejection type.
  @$pb.TagNumber(1)
  Reject_RejectType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Reject_RejectType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  /// Human readable rejection reason.
  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);
}

/// ServerSync message is sent by the server when it has authenticated the user
/// and finished synchronizing the server state.
class ServerSync extends $pb.GeneratedMessage {
  factory ServerSync({
    $core.int? session,
    $core.int? maxBandwidth,
    $core.String? welcomeText,
    $fixnum.Int64? permissions,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (maxBandwidth != null) {
      $result.maxBandwidth = maxBandwidth;
    }
    if (welcomeText != null) {
      $result.welcomeText = welcomeText;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    return $result;
  }
  ServerSync._() : super();
  factory ServerSync.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerSync.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerSync', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxBandwidth', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'welcomeText')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerSync clone() => ServerSync()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerSync copyWith(void Function(ServerSync) updates) => super.copyWith((message) => updates(message as ServerSync)) as ServerSync;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerSync create() => ServerSync._();
  ServerSync createEmptyInstance() => create();
  static $pb.PbList<ServerSync> createRepeated() => $pb.PbList<ServerSync>();
  @$core.pragma('dart2js:noInline')
  static ServerSync getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerSync>(create);
  static ServerSync? _defaultInstance;

  /// The session of the current user.
  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  /// Maximum bandwidth that the user should use.
  @$pb.TagNumber(2)
  $core.int get maxBandwidth => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxBandwidth($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxBandwidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxBandwidth() => clearField(2);

  /// Server welcome text.
  @$pb.TagNumber(3)
  $core.String get welcomeText => $_getSZ(2);
  @$pb.TagNumber(3)
  set welcomeText($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWelcomeText() => $_has(2);
  @$pb.TagNumber(3)
  void clearWelcomeText() => clearField(3);

  /// Current user permissions in the root channel.
  @$pb.TagNumber(4)
  $fixnum.Int64 get permissions => $_getI64(3);
  @$pb.TagNumber(4)
  set permissions($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermissions() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermissions() => clearField(4);
}

/// Sent by the client when it wants a channel removed. Sent by the server when
/// a channel has been removed and clients should be notified.
class ChannelRemove extends $pb.GeneratedMessage {
  factory ChannelRemove({
    $core.int? channelId,
  }) {
    final $result = create();
    if (channelId != null) {
      $result.channelId = channelId;
    }
    return $result;
  }
  ChannelRemove._() : super();
  factory ChannelRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChannelRemove', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.QU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelRemove clone() => ChannelRemove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelRemove copyWith(void Function(ChannelRemove) updates) => super.copyWith((message) => updates(message as ChannelRemove)) as ChannelRemove;

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

/// Used to communicate channel properties between the client and the server.
/// Sent by the server during the login process or when channel properties are
/// updated. Client may use this message to update said channel properties.
class ChannelState extends $pb.GeneratedMessage {
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
    final $result = create();
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    if (name != null) {
      $result.name = name;
    }
    if (links != null) {
      $result.links.addAll(links);
    }
    if (description != null) {
      $result.description = description;
    }
    if (linksAdd != null) {
      $result.linksAdd.addAll(linksAdd);
    }
    if (linksRemove != null) {
      $result.linksRemove.addAll(linksRemove);
    }
    if (temporary != null) {
      $result.temporary = temporary;
    }
    if (position != null) {
      $result.position = position;
    }
    if (descriptionHash != null) {
      $result.descriptionHash = descriptionHash;
    }
    if (maxUsers != null) {
      $result.maxUsers = maxUsers;
    }
    if (isEnterRestricted != null) {
      $result.isEnterRestricted = isEnterRestricted;
    }
    if (canEnter != null) {
      $result.canEnter = canEnter;
    }
    return $result;
  }
  ChannelState._() : super();
  factory ChannelState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChannelState', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'parent', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..p<$core.int>(4, _omitFieldNames ? '' : 'links', $pb.PbFieldType.PU3)
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..p<$core.int>(6, _omitFieldNames ? '' : 'linksAdd', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'linksRemove', $pb.PbFieldType.PU3)
    ..aOB(8, _omitFieldNames ? '' : 'temporary')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'position', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'descriptionHash', $pb.PbFieldType.OY)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'maxUsers', $pb.PbFieldType.OU3)
    ..aOB(12, _omitFieldNames ? '' : 'isEnterRestricted')
    ..aOB(13, _omitFieldNames ? '' : 'canEnter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelState clone() => ChannelState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelState copyWith(void Function(ChannelState) updates) => super.copyWith((message) => updates(message as ChannelState)) as ChannelState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelState create() => ChannelState._();
  ChannelState createEmptyInstance() => create();
  static $pb.PbList<ChannelState> createRepeated() => $pb.PbList<ChannelState>();
  @$core.pragma('dart2js:noInline')
  static ChannelState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelState>(create);
  static ChannelState? _defaultInstance;

  /// Unique ID for the channel within the server.
  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);

  /// channel_id of the parent channel.
  @$pb.TagNumber(2)
  $core.int get parent => $_getIZ(1);
  @$pb.TagNumber(2)
  set parent($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

  /// UTF-8 encoded channel name.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  /// A collection of channel id values of the linked channels. Absent during
  /// the first channel listing.
  @$pb.TagNumber(4)
  $core.List<$core.int> get links => $_getList(3);

  /// UTF-8 encoded channel description. Only if the description is less than
  /// 128 bytes
  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  /// A collection of channel_id values that should be added to links.
  @$pb.TagNumber(6)
  $core.List<$core.int> get linksAdd => $_getList(5);

  /// A collection of channel_id values that should be removed from links.
  @$pb.TagNumber(7)
  $core.List<$core.int> get linksRemove => $_getList(6);

  /// True if the channel is temporary.
  @$pb.TagNumber(8)
  $core.bool get temporary => $_getBF(7);
  @$pb.TagNumber(8)
  set temporary($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTemporary() => $_has(7);
  @$pb.TagNumber(8)
  void clearTemporary() => clearField(8);

  /// Position weight to tweak the channel position in the channel list.
  @$pb.TagNumber(9)
  $core.int get position => $_getIZ(8);
  @$pb.TagNumber(9)
  set position($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPosition() => $_has(8);
  @$pb.TagNumber(9)
  void clearPosition() => clearField(9);

  /// SHA1 hash of the description if the description is 128 bytes or more.
  @$pb.TagNumber(10)
  $core.List<$core.int> get descriptionHash => $_getN(9);
  @$pb.TagNumber(10)
  set descriptionHash($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDescriptionHash() => $_has(9);
  @$pb.TagNumber(10)
  void clearDescriptionHash() => clearField(10);

  /// Maximum number of users allowed in the channel. If this value is zero,
  /// the maximum number of users allowed in the channel is given by the
  /// server's "usersperchannel" setting.
  @$pb.TagNumber(11)
  $core.int get maxUsers => $_getIZ(10);
  @$pb.TagNumber(11)
  set maxUsers($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMaxUsers() => $_has(10);
  @$pb.TagNumber(11)
  void clearMaxUsers() => clearField(11);

  /// Whether this channel has enter restrictions (ACL denying ENTER) set
  @$pb.TagNumber(12)
  $core.bool get isEnterRestricted => $_getBF(11);
  @$pb.TagNumber(12)
  set isEnterRestricted($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsEnterRestricted() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsEnterRestricted() => clearField(12);

  /// Whether the receiver of this msg is considered to be able to enter this channel
  @$pb.TagNumber(13)
  $core.bool get canEnter => $_getBF(12);
  @$pb.TagNumber(13)
  set canEnter($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCanEnter() => $_has(12);
  @$pb.TagNumber(13)
  void clearCanEnter() => clearField(13);
}

/// Used to communicate user leaving or being kicked. May be sent by the client
/// when it attempts to kick a user. Sent by the server when it informs the
/// clients that a user is not present anymore.
class UserRemove extends $pb.GeneratedMessage {
  factory UserRemove({
    $core.int? session,
    $core.int? actor,
    $core.String? reason,
    $core.bool? ban,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (actor != null) {
      $result.actor = actor;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (ban != null) {
      $result.ban = ban;
    }
    return $result;
  }
  UserRemove._() : super();
  factory UserRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserRemove', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'session', $pb.PbFieldType.QU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'actor', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..aOB(4, _omitFieldNames ? '' : 'ban')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRemove clone() => UserRemove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRemove copyWith(void Function(UserRemove) updates) => super.copyWith((message) => updates(message as UserRemove)) as UserRemove;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRemove create() => UserRemove._();
  UserRemove createEmptyInstance() => create();
  static $pb.PbList<UserRemove> createRepeated() => $pb.PbList<UserRemove>();
  @$core.pragma('dart2js:noInline')
  static UserRemove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRemove>(create);
  static UserRemove? _defaultInstance;

  /// The user who is being kicked, identified by their session, not present
  /// when no one is being kicked.
  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  /// The user who initiated the removal. Either the user who performs the kick
  /// or the user who is currently leaving.
  @$pb.TagNumber(2)
  $core.int get actor => $_getIZ(1);
  @$pb.TagNumber(2)
  set actor($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActor() => $_has(1);
  @$pb.TagNumber(2)
  void clearActor() => clearField(2);

  /// Reason for the kick, stored as the ban reason if the user is banned.
  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);

  /// True if the kick should result in a ban.
  @$pb.TagNumber(4)
  $core.bool get ban => $_getBF(3);
  @$pb.TagNumber(4)
  set ban($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBan() => $_has(3);
  @$pb.TagNumber(4)
  void clearBan() => clearField(4);
}

/// Sent by the server when it communicates new and changed users to client.
/// First seen during login procedure. May be sent by the client when it wishes
/// to alter its state.
class UserState extends $pb.GeneratedMessage {
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
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (actor != null) {
      $result.actor = actor;
    }
    if (name != null) {
      $result.name = name;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (mute != null) {
      $result.mute = mute;
    }
    if (deaf != null) {
      $result.deaf = deaf;
    }
    if (suppress != null) {
      $result.suppress = suppress;
    }
    if (selfMute != null) {
      $result.selfMute = selfMute;
    }
    if (selfDeaf != null) {
      $result.selfDeaf = selfDeaf;
    }
    if (texture != null) {
      $result.texture = texture;
    }
    if (pluginContext != null) {
      $result.pluginContext = pluginContext;
    }
    if (pluginIdentity != null) {
      $result.pluginIdentity = pluginIdentity;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (hash != null) {
      $result.hash = hash;
    }
    if (commentHash != null) {
      $result.commentHash = commentHash;
    }
    if (textureHash != null) {
      $result.textureHash = textureHash;
    }
    if (prioritySpeaker != null) {
      $result.prioritySpeaker = prioritySpeaker;
    }
    if (recording != null) {
      $result.recording = recording;
    }
    if (temporaryAccessTokens != null) {
      $result.temporaryAccessTokens.addAll(temporaryAccessTokens);
    }
    if (listeningChannelAdd != null) {
      $result.listeningChannelAdd.addAll(listeningChannelAdd);
    }
    if (listeningChannelRemove != null) {
      $result.listeningChannelRemove.addAll(listeningChannelRemove);
    }
    return $result;
  }
  UserState._() : super();
  factory UserState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserState', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'actor', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..aOB(6, _omitFieldNames ? '' : 'mute')
    ..aOB(7, _omitFieldNames ? '' : 'deaf')
    ..aOB(8, _omitFieldNames ? '' : 'suppress')
    ..aOB(9, _omitFieldNames ? '' : 'selfMute')
    ..aOB(10, _omitFieldNames ? '' : 'selfDeaf')
    ..a<$core.List<$core.int>>(11, _omitFieldNames ? '' : 'texture', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'pluginContext', $pb.PbFieldType.OY)
    ..aOS(13, _omitFieldNames ? '' : 'pluginIdentity')
    ..aOS(14, _omitFieldNames ? '' : 'comment')
    ..aOS(15, _omitFieldNames ? '' : 'hash')
    ..a<$core.List<$core.int>>(16, _omitFieldNames ? '' : 'commentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(17, _omitFieldNames ? '' : 'textureHash', $pb.PbFieldType.OY)
    ..aOB(18, _omitFieldNames ? '' : 'prioritySpeaker')
    ..aOB(19, _omitFieldNames ? '' : 'recording')
    ..pPS(20, _omitFieldNames ? '' : 'temporaryAccessTokens')
    ..p<$core.int>(21, _omitFieldNames ? '' : 'listeningChannelAdd', $pb.PbFieldType.PU3)
    ..p<$core.int>(22, _omitFieldNames ? '' : 'listeningChannelRemove', $pb.PbFieldType.PU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserState clone() => UserState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserState copyWith(void Function(UserState) updates) => super.copyWith((message) => updates(message as UserState)) as UserState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserState create() => UserState._();
  UserState createEmptyInstance() => create();
  static $pb.PbList<UserState> createRepeated() => $pb.PbList<UserState>();
  @$core.pragma('dart2js:noInline')
  static UserState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserState>(create);
  static UserState? _defaultInstance;

  /// Unique user session ID of the user whose state this is, may change on
  /// reconnect.
  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  /// The session of the user who is updating this user.
  @$pb.TagNumber(2)
  $core.int get actor => $_getIZ(1);
  @$pb.TagNumber(2)
  set actor($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActor() => $_has(1);
  @$pb.TagNumber(2)
  void clearActor() => clearField(2);

  /// User name, UTF-8 encoded.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  /// Registered user ID if the user is registered.
  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  /// Channel on which the user is.
  @$pb.TagNumber(5)
  $core.int get channelId => $_getIZ(4);
  @$pb.TagNumber(5)
  set channelId($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChannelId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannelId() => clearField(5);

  /// True if the user is muted by admin.
  @$pb.TagNumber(6)
  $core.bool get mute => $_getBF(5);
  @$pb.TagNumber(6)
  set mute($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMute() => $_has(5);
  @$pb.TagNumber(6)
  void clearMute() => clearField(6);

  /// True if the user is deafened by admin.
  @$pb.TagNumber(7)
  $core.bool get deaf => $_getBF(6);
  @$pb.TagNumber(7)
  set deaf($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeaf() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeaf() => clearField(7);

  /// True if the user has been suppressed from talking by a reason other than
  /// being muted.
  @$pb.TagNumber(8)
  $core.bool get suppress => $_getBF(7);
  @$pb.TagNumber(8)
  set suppress($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSuppress() => $_has(7);
  @$pb.TagNumber(8)
  void clearSuppress() => clearField(8);

  /// True if the user has muted self.
  @$pb.TagNumber(9)
  $core.bool get selfMute => $_getBF(8);
  @$pb.TagNumber(9)
  set selfMute($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSelfMute() => $_has(8);
  @$pb.TagNumber(9)
  void clearSelfMute() => clearField(9);

  /// True if the user has deafened self.
  @$pb.TagNumber(10)
  $core.bool get selfDeaf => $_getBF(9);
  @$pb.TagNumber(10)
  set selfDeaf($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSelfDeaf() => $_has(9);
  @$pb.TagNumber(10)
  void clearSelfDeaf() => clearField(10);

  /// User image if it is less than 128 bytes.
  @$pb.TagNumber(11)
  $core.List<$core.int> get texture => $_getN(10);
  @$pb.TagNumber(11)
  set texture($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTexture() => $_has(10);
  @$pb.TagNumber(11)
  void clearTexture() => clearField(11);

  ///  The positional audio plugin identifier.
  ///  Positional audio information is only sent to users who share
  ///  identical plugin contexts.
  ///
  ///  This value is not transmitted to clients.
  @$pb.TagNumber(12)
  $core.List<$core.int> get pluginContext => $_getN(11);
  @$pb.TagNumber(12)
  set pluginContext($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPluginContext() => $_has(11);
  @$pb.TagNumber(12)
  void clearPluginContext() => clearField(12);

  /// The user's plugin-specific identity.
  /// This value is not transmitted to clients.
  @$pb.TagNumber(13)
  $core.String get pluginIdentity => $_getSZ(12);
  @$pb.TagNumber(13)
  set pluginIdentity($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPluginIdentity() => $_has(12);
  @$pb.TagNumber(13)
  void clearPluginIdentity() => clearField(13);

  /// User comment if it is less than 128 bytes.
  @$pb.TagNumber(14)
  $core.String get comment => $_getSZ(13);
  @$pb.TagNumber(14)
  set comment($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasComment() => $_has(13);
  @$pb.TagNumber(14)
  void clearComment() => clearField(14);

  /// The hash of the user certificate.
  @$pb.TagNumber(15)
  $core.String get hash => $_getSZ(14);
  @$pb.TagNumber(15)
  set hash($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasHash() => $_has(14);
  @$pb.TagNumber(15)
  void clearHash() => clearField(15);

  /// SHA1 hash of the user comment if it 128 bytes or more.
  @$pb.TagNumber(16)
  $core.List<$core.int> get commentHash => $_getN(15);
  @$pb.TagNumber(16)
  set commentHash($core.List<$core.int> v) { $_setBytes(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCommentHash() => $_has(15);
  @$pb.TagNumber(16)
  void clearCommentHash() => clearField(16);

  /// SHA1 hash of the user picture if it 128 bytes or more.
  @$pb.TagNumber(17)
  $core.List<$core.int> get textureHash => $_getN(16);
  @$pb.TagNumber(17)
  set textureHash($core.List<$core.int> v) { $_setBytes(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasTextureHash() => $_has(16);
  @$pb.TagNumber(17)
  void clearTextureHash() => clearField(17);

  /// True if the user is a priority speaker.
  @$pb.TagNumber(18)
  $core.bool get prioritySpeaker => $_getBF(17);
  @$pb.TagNumber(18)
  set prioritySpeaker($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasPrioritySpeaker() => $_has(17);
  @$pb.TagNumber(18)
  void clearPrioritySpeaker() => clearField(18);

  /// True if the user is currently recording.
  @$pb.TagNumber(19)
  $core.bool get recording => $_getBF(18);
  @$pb.TagNumber(19)
  set recording($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasRecording() => $_has(18);
  @$pb.TagNumber(19)
  void clearRecording() => clearField(19);

  /// A list of temporary access tokens to be respected when processing this request.
  @$pb.TagNumber(20)
  $core.List<$core.String> get temporaryAccessTokens => $_getList(19);

  /// A list of channels the user wants to start listening to.
  @$pb.TagNumber(21)
  $core.List<$core.int> get listeningChannelAdd => $_getList(20);

  /// a list of channels the user does no longer want to listen to.
  @$pb.TagNumber(22)
  $core.List<$core.int> get listeningChannelRemove => $_getList(21);
}

class BanList_BanEntry extends $pb.GeneratedMessage {
  factory BanList_BanEntry({
    $core.List<$core.int>? address,
    $core.int? mask,
    $core.String? name,
    $core.String? hash,
    $core.String? reason,
    $core.String? start,
    $core.int? duration,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (mask != null) {
      $result.mask = mask;
    }
    if (name != null) {
      $result.name = name;
    }
    if (hash != null) {
      $result.hash = hash;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (start != null) {
      $result.start = start;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  BanList_BanEntry._() : super();
  factory BanList_BanEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BanList_BanEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BanList.BanEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.QY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'mask', $pb.PbFieldType.QU3)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'hash')
    ..aOS(5, _omitFieldNames ? '' : 'reason')
    ..aOS(6, _omitFieldNames ? '' : 'start')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BanList_BanEntry clone() => BanList_BanEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BanList_BanEntry copyWith(void Function(BanList_BanEntry) updates) => super.copyWith((message) => updates(message as BanList_BanEntry)) as BanList_BanEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanList_BanEntry create() => BanList_BanEntry._();
  BanList_BanEntry createEmptyInstance() => create();
  static $pb.PbList<BanList_BanEntry> createRepeated() => $pb.PbList<BanList_BanEntry>();
  @$core.pragma('dart2js:noInline')
  static BanList_BanEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanList_BanEntry>(create);
  static BanList_BanEntry? _defaultInstance;

  /// Banned IP address.
  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  /// The length of the subnet mask for the ban.
  @$pb.TagNumber(2)
  $core.int get mask => $_getIZ(1);
  @$pb.TagNumber(2)
  set mask($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearMask() => clearField(2);

  /// User name for identification purposes (does not affect the ban).
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  /// The certificate hash of the banned user.
  @$pb.TagNumber(4)
  $core.String get hash => $_getSZ(3);
  @$pb.TagNumber(4)
  set hash($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearHash() => clearField(4);

  /// Reason for the ban (does not affect the ban).
  @$pb.TagNumber(5)
  $core.String get reason => $_getSZ(4);
  @$pb.TagNumber(5)
  set reason($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearReason() => clearField(5);

  /// Ban start time.
  @$pb.TagNumber(6)
  $core.String get start => $_getSZ(5);
  @$pb.TagNumber(6)
  set start($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStart() => $_has(5);
  @$pb.TagNumber(6)
  void clearStart() => clearField(6);

  /// Ban duration in seconds.
  @$pb.TagNumber(7)
  $core.int get duration => $_getIZ(6);
  @$pb.TagNumber(7)
  set duration($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);
}

/// Relays information on the bans. The client may send the BanList message to
/// either modify the list of bans or query them from the server. The server
/// sends this list only after a client queries for it.
class BanList extends $pb.GeneratedMessage {
  factory BanList({
    $core.Iterable<BanList_BanEntry>? bans,
    $core.bool? query,
  }) {
    final $result = create();
    if (bans != null) {
      $result.bans.addAll(bans);
    }
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  BanList._() : super();
  factory BanList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BanList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BanList', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..pc<BanList_BanEntry>(1, _omitFieldNames ? '' : 'bans', $pb.PbFieldType.PM, subBuilder: BanList_BanEntry.create)
    ..aOB(2, _omitFieldNames ? '' : 'query')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BanList clone() => BanList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BanList copyWith(void Function(BanList) updates) => super.copyWith((message) => updates(message as BanList)) as BanList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanList create() => BanList._();
  BanList createEmptyInstance() => create();
  static $pb.PbList<BanList> createRepeated() => $pb.PbList<BanList>();
  @$core.pragma('dart2js:noInline')
  static BanList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanList>(create);
  static BanList? _defaultInstance;

  /// List of ban entries currently in place.
  @$pb.TagNumber(1)
  $core.List<BanList_BanEntry> get bans => $_getList(0);

  /// True if the server should return the list, false if it should replace old
  /// ban list with the one provided.
  @$pb.TagNumber(2)
  $core.bool get query => $_getBF(1);
  @$pb.TagNumber(2)
  set query($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);
}

/// Used to send and broadcast text messages.
class TextMessage extends $pb.GeneratedMessage {
  factory TextMessage({
    $core.int? actor,
    $core.Iterable<$core.int>? session,
    $core.Iterable<$core.int>? channelId,
    $core.Iterable<$core.int>? treeId,
    $core.String? message,
  }) {
    final $result = create();
    if (actor != null) {
      $result.actor = actor;
    }
    if (session != null) {
      $result.session.addAll(session);
    }
    if (channelId != null) {
      $result.channelId.addAll(channelId);
    }
    if (treeId != null) {
      $result.treeId.addAll(treeId);
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  TextMessage._() : super();
  factory TextMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'actor', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'session', $pb.PbFieldType.PU3)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.PU3)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'treeId', $pb.PbFieldType.PU3)
    ..aQS(5, _omitFieldNames ? '' : 'message')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextMessage clone() => TextMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextMessage copyWith(void Function(TextMessage) updates) => super.copyWith((message) => updates(message as TextMessage)) as TextMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextMessage create() => TextMessage._();
  TextMessage createEmptyInstance() => create();
  static $pb.PbList<TextMessage> createRepeated() => $pb.PbList<TextMessage>();
  @$core.pragma('dart2js:noInline')
  static TextMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMessage>(create);
  static TextMessage? _defaultInstance;

  /// The message sender, identified by its session.
  @$pb.TagNumber(1)
  $core.int get actor => $_getIZ(0);
  @$pb.TagNumber(1)
  set actor($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActor() => $_has(0);
  @$pb.TagNumber(1)
  void clearActor() => clearField(1);

  /// Target users for the message, identified by their session.
  @$pb.TagNumber(2)
  $core.List<$core.int> get session => $_getList(1);

  /// The channels to which the message is sent, identified by their
  /// channel_ids.
  @$pb.TagNumber(3)
  $core.List<$core.int> get channelId => $_getList(2);

  /// The root channels when sending message recursively to several channels,
  /// identified by their channel_ids.
  @$pb.TagNumber(4)
  $core.List<$core.int> get treeId => $_getList(3);

  /// The UTF-8 encoded message. May be HTML if the server allows.
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
  factory PermissionDenied({
    $core.int? permission,
    $core.int? channelId,
    $core.int? session,
    $core.String? reason,
    PermissionDenied_DenyType? type,
    $core.String? name,
  }) {
    final $result = create();
    if (permission != null) {
      $result.permission = permission;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (session != null) {
      $result.session = session;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (type != null) {
      $result.type = type;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  PermissionDenied._() : super();
  factory PermissionDenied.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionDenied.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PermissionDenied', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'permission', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'session', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'reason')
    ..e<PermissionDenied_DenyType>(5, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PermissionDenied_DenyType.Text, valueOf: PermissionDenied_DenyType.valueOf, enumValues: PermissionDenied_DenyType.values)
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionDenied clone() => PermissionDenied()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionDenied copyWith(void Function(PermissionDenied) updates) => super.copyWith((message) => updates(message as PermissionDenied)) as PermissionDenied;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionDenied create() => PermissionDenied._();
  PermissionDenied createEmptyInstance() => create();
  static $pb.PbList<PermissionDenied> createRepeated() => $pb.PbList<PermissionDenied>();
  @$core.pragma('dart2js:noInline')
  static PermissionDenied getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionDenied>(create);
  static PermissionDenied? _defaultInstance;

  /// The denied permission when type is Permission.
  @$pb.TagNumber(1)
  $core.int get permission => $_getIZ(0);
  @$pb.TagNumber(1)
  set permission($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermission() => clearField(1);

  /// channel_id for the channel where the permission was denied when type is
  /// Permission.
  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  /// The user who was denied permissions, identified by session.
  @$pb.TagNumber(3)
  $core.int get session => $_getIZ(2);
  @$pb.TagNumber(3)
  set session($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);

  /// Textual reason for the denial.
  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => clearField(4);

  /// Type of the denial.
  @$pb.TagNumber(5)
  PermissionDenied_DenyType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(PermissionDenied_DenyType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  /// The name that is invalid when type is UserName.
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
  factory ACL_ChanGroup({
    $core.String? name,
    $core.bool? inherited,
    $core.bool? inherit,
    $core.bool? inheritable,
    $core.Iterable<$core.int>? add,
    $core.Iterable<$core.int>? remove,
    $core.Iterable<$core.int>? inheritedMembers,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (inherited != null) {
      $result.inherited = inherited;
    }
    if (inherit != null) {
      $result.inherit = inherit;
    }
    if (inheritable != null) {
      $result.inheritable = inheritable;
    }
    if (add != null) {
      $result.add.addAll(add);
    }
    if (remove != null) {
      $result.remove.addAll(remove);
    }
    if (inheritedMembers != null) {
      $result.inheritedMembers.addAll(inheritedMembers);
    }
    return $result;
  }
  ACL_ChanGroup._() : super();
  factory ACL_ChanGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL_ChanGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ACL.ChanGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'inherited', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'inherit', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(4, _omitFieldNames ? '' : 'inheritable', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..p<$core.int>(5, _omitFieldNames ? '' : 'add', $pb.PbFieldType.PU3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'remove', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'inheritedMembers', $pb.PbFieldType.PU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ACL_ChanGroup clone() => ACL_ChanGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ACL_ChanGroup copyWith(void Function(ACL_ChanGroup) updates) => super.copyWith((message) => updates(message as ACL_ChanGroup)) as ACL_ChanGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ACL_ChanGroup create() => ACL_ChanGroup._();
  ACL_ChanGroup createEmptyInstance() => create();
  static $pb.PbList<ACL_ChanGroup> createRepeated() => $pb.PbList<ACL_ChanGroup>();
  @$core.pragma('dart2js:noInline')
  static ACL_ChanGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL_ChanGroup>(create);
  static ACL_ChanGroup? _defaultInstance;

  /// Name of the channel group, UTF-8 encoded.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// True if the group has been inherited from the parent (Read only).
  @$pb.TagNumber(2)
  $core.bool get inherited => $_getB(1, true);
  @$pb.TagNumber(2)
  set inherited($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInherited() => $_has(1);
  @$pb.TagNumber(2)
  void clearInherited() => clearField(2);

  /// True if the group members are inherited.
  @$pb.TagNumber(3)
  $core.bool get inherit => $_getB(2, true);
  @$pb.TagNumber(3)
  set inherit($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInherit() => $_has(2);
  @$pb.TagNumber(3)
  void clearInherit() => clearField(3);

  /// True if the group can be inherited by sub channels.
  @$pb.TagNumber(4)
  $core.bool get inheritable => $_getB(3, true);
  @$pb.TagNumber(4)
  set inheritable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInheritable() => $_has(3);
  @$pb.TagNumber(4)
  void clearInheritable() => clearField(4);

  /// Users explicitly included in this group, identified by user_id.
  @$pb.TagNumber(5)
  $core.List<$core.int> get add => $_getList(4);

  /// Users explicitly removed from this group in this channel if the group
  /// has been inherited, identified by user_id.
  @$pb.TagNumber(6)
  $core.List<$core.int> get remove => $_getList(5);

  /// Users inherited, identified by user_id.
  @$pb.TagNumber(7)
  $core.List<$core.int> get inheritedMembers => $_getList(6);
}

class ACL_ChanACL extends $pb.GeneratedMessage {
  factory ACL_ChanACL({
    $core.bool? applyHere,
    $core.bool? applySubs,
    $core.bool? inherited,
    $core.int? userId,
    $core.String? group,
    $core.int? grant,
    $core.int? deny,
  }) {
    final $result = create();
    if (applyHere != null) {
      $result.applyHere = applyHere;
    }
    if (applySubs != null) {
      $result.applySubs = applySubs;
    }
    if (inherited != null) {
      $result.inherited = inherited;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (group != null) {
      $result.group = group;
    }
    if (grant != null) {
      $result.grant = grant;
    }
    if (deny != null) {
      $result.deny = deny;
    }
    return $result;
  }
  ACL_ChanACL._() : super();
  factory ACL_ChanACL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL_ChanACL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ACL.ChanACL', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.bool>(1, _omitFieldNames ? '' : 'applyHere', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'applySubs', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'inherited', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'group')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'grant', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'deny', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ACL_ChanACL clone() => ACL_ChanACL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ACL_ChanACL copyWith(void Function(ACL_ChanACL) updates) => super.copyWith((message) => updates(message as ACL_ChanACL)) as ACL_ChanACL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ACL_ChanACL create() => ACL_ChanACL._();
  ACL_ChanACL createEmptyInstance() => create();
  static $pb.PbList<ACL_ChanACL> createRepeated() => $pb.PbList<ACL_ChanACL>();
  @$core.pragma('dart2js:noInline')
  static ACL_ChanACL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL_ChanACL>(create);
  static ACL_ChanACL? _defaultInstance;

  /// True if this ACL applies to the current channel.
  @$pb.TagNumber(1)
  $core.bool get applyHere => $_getB(0, true);
  @$pb.TagNumber(1)
  set applyHere($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApplyHere() => $_has(0);
  @$pb.TagNumber(1)
  void clearApplyHere() => clearField(1);

  /// True if this ACL applies to the sub channels.
  @$pb.TagNumber(2)
  $core.bool get applySubs => $_getB(1, true);
  @$pb.TagNumber(2)
  set applySubs($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApplySubs() => $_has(1);
  @$pb.TagNumber(2)
  void clearApplySubs() => clearField(2);

  /// True if the ACL has been inherited from the parent.
  @$pb.TagNumber(3)
  $core.bool get inherited => $_getB(2, true);
  @$pb.TagNumber(3)
  set inherited($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInherited() => $_has(2);
  @$pb.TagNumber(3)
  void clearInherited() => clearField(3);

  /// ID of the user that is affected by this ACL.
  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  /// ID of the group that is affected by this ACL.
  @$pb.TagNumber(5)
  $core.String get group => $_getSZ(4);
  @$pb.TagNumber(5)
  set group($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroup() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroup() => clearField(5);

  /// Bit flag field of the permissions granted by this ACL.
  @$pb.TagNumber(6)
  $core.int get grant => $_getIZ(5);
  @$pb.TagNumber(6)
  set grant($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGrant() => $_has(5);
  @$pb.TagNumber(6)
  void clearGrant() => clearField(6);

  /// Bit flag field of the permissions denied by this ACL.
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
  factory ACL({
    $core.int? channelId,
    $core.bool? inheritAcls,
    $core.Iterable<ACL_ChanGroup>? groups,
    $core.Iterable<ACL_ChanACL>? acls,
    $core.bool? query,
  }) {
    final $result = create();
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (inheritAcls != null) {
      $result.inheritAcls = inheritAcls;
    }
    if (groups != null) {
      $result.groups.addAll(groups);
    }
    if (acls != null) {
      $result.acls.addAll(acls);
    }
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  ACL._() : super();
  factory ACL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ACL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ACL', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.QU3)
    ..a<$core.bool>(2, _omitFieldNames ? '' : 'inheritAcls', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..pc<ACL_ChanGroup>(3, _omitFieldNames ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: ACL_ChanGroup.create)
    ..pc<ACL_ChanACL>(4, _omitFieldNames ? '' : 'acls', $pb.PbFieldType.PM, subBuilder: ACL_ChanACL.create)
    ..aOB(5, _omitFieldNames ? '' : 'query')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ACL clone() => ACL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ACL copyWith(void Function(ACL) updates) => super.copyWith((message) => updates(message as ACL)) as ACL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ACL create() => ACL._();
  ACL createEmptyInstance() => create();
  static $pb.PbList<ACL> createRepeated() => $pb.PbList<ACL>();
  @$core.pragma('dart2js:noInline')
  static ACL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ACL>(create);
  static ACL? _defaultInstance;

  /// Channel ID of the channel this message affects.
  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);

  /// True if the channel inherits its parent's ACLs.
  @$pb.TagNumber(2)
  $core.bool get inheritAcls => $_getB(1, true);
  @$pb.TagNumber(2)
  set inheritAcls($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInheritAcls() => $_has(1);
  @$pb.TagNumber(2)
  void clearInheritAcls() => clearField(2);

  /// User group specifications.
  @$pb.TagNumber(3)
  $core.List<ACL_ChanGroup> get groups => $_getList(2);

  /// ACL specifications.
  @$pb.TagNumber(4)
  $core.List<ACL_ChanACL> get acls => $_getList(3);

  /// True if the message is a query for ACLs instead of setting them.
  @$pb.TagNumber(5)
  $core.bool get query => $_getBF(4);
  @$pb.TagNumber(5)
  set query($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuery() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuery() => clearField(5);
}

/// Client may use this message to refresh its registered user information. The
/// client should fill the IDs or Names of the users it wants to refresh. The
/// server fills the missing parts and sends the message back.
class QueryUsers extends $pb.GeneratedMessage {
  factory QueryUsers({
    $core.Iterable<$core.int>? ids,
    $core.Iterable<$core.String>? names,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (names != null) {
      $result.names.addAll(names);
    }
    return $result;
  }
  QueryUsers._() : super();
  factory QueryUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QueryUsers', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.PU3)
    ..pPS(2, _omitFieldNames ? '' : 'names')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryUsers clone() => QueryUsers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryUsers copyWith(void Function(QueryUsers) updates) => super.copyWith((message) => updates(message as QueryUsers)) as QueryUsers;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryUsers create() => QueryUsers._();
  QueryUsers createEmptyInstance() => create();
  static $pb.PbList<QueryUsers> createRepeated() => $pb.PbList<QueryUsers>();
  @$core.pragma('dart2js:noInline')
  static QueryUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryUsers>(create);
  static QueryUsers? _defaultInstance;

  /// user_ids.
  @$pb.TagNumber(1)
  $core.List<$core.int> get ids => $_getList(0);

  /// User names in the same order as ids.
  @$pb.TagNumber(2)
  $core.List<$core.String> get names => $_getList(1);
}

/// Used to initialize and resync the UDP encryption. Either side may request a
/// resync by sending the message without any values filled. The resync is
/// performed by sending the message with only the client or server nonce
/// filled.
class CryptSetup extends $pb.GeneratedMessage {
  factory CryptSetup({
    $core.List<$core.int>? key,
    $core.List<$core.int>? clientNonce,
    $core.List<$core.int>? serverNonce,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (clientNonce != null) {
      $result.clientNonce = clientNonce;
    }
    if (serverNonce != null) {
      $result.serverNonce = serverNonce;
    }
    return $result;
  }
  CryptSetup._() : super();
  factory CryptSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CryptSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CryptSetup', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'key', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'clientNonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'serverNonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CryptSetup clone() => CryptSetup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CryptSetup copyWith(void Function(CryptSetup) updates) => super.copyWith((message) => updates(message as CryptSetup)) as CryptSetup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CryptSetup create() => CryptSetup._();
  CryptSetup createEmptyInstance() => create();
  static $pb.PbList<CryptSetup> createRepeated() => $pb.PbList<CryptSetup>();
  @$core.pragma('dart2js:noInline')
  static CryptSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CryptSetup>(create);
  static CryptSetup? _defaultInstance;

  /// Encryption key.
  @$pb.TagNumber(1)
  $core.List<$core.int> get key => $_getN(0);
  @$pb.TagNumber(1)
  set key($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  /// Client nonce.
  @$pb.TagNumber(2)
  $core.List<$core.int> get clientNonce => $_getN(1);
  @$pb.TagNumber(2)
  set clientNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientNonce() => clearField(2);

  /// Server nonce.
  @$pb.TagNumber(3)
  $core.List<$core.int> get serverNonce => $_getN(2);
  @$pb.TagNumber(3)
  set serverNonce($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServerNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerNonce() => clearField(3);
}

/// Used to add or remove custom context menu item on client-side.
class ContextActionModify extends $pb.GeneratedMessage {
  factory ContextActionModify({
    $core.String? action,
    $core.String? text,
    $core.int? context,
    ContextActionModify_Operation? operation,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (text != null) {
      $result.text = text;
    }
    if (context != null) {
      $result.context = context;
    }
    if (operation != null) {
      $result.operation = operation;
    }
    return $result;
  }
  ContextActionModify._() : super();
  factory ContextActionModify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextActionModify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContextActionModify', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'action')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'context', $pb.PbFieldType.OU3)
    ..e<ContextActionModify_Operation>(4, _omitFieldNames ? '' : 'operation', $pb.PbFieldType.OE, defaultOrMaker: ContextActionModify_Operation.Add, valueOf: ContextActionModify_Operation.valueOf, enumValues: ContextActionModify_Operation.values)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContextActionModify clone() => ContextActionModify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContextActionModify copyWith(void Function(ContextActionModify) updates) => super.copyWith((message) => updates(message as ContextActionModify)) as ContextActionModify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContextActionModify create() => ContextActionModify._();
  ContextActionModify createEmptyInstance() => create();
  static $pb.PbList<ContextActionModify> createRepeated() => $pb.PbList<ContextActionModify>();
  @$core.pragma('dart2js:noInline')
  static ContextActionModify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextActionModify>(create);
  static ContextActionModify? _defaultInstance;

  /// The action identifier. Used later to initiate an action.
  @$pb.TagNumber(1)
  $core.String get action => $_getSZ(0);
  @$pb.TagNumber(1)
  set action($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  /// The display name of the action.
  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  /// Context bit flags defining where the action should be displayed.
  /// Flags can be OR-ed to combine different types.
  @$pb.TagNumber(3)
  $core.int get context => $_getIZ(2);
  @$pb.TagNumber(3)
  set context($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContext() => $_has(2);
  @$pb.TagNumber(3)
  void clearContext() => clearField(3);

  /// Choose either to add or to remove the context action.
  /// Note: This field only exists after Mumble 1.2.4-beta1 release.
  ///       The message will be recognized as Add regardless of this field
  ///       before said release.
  @$pb.TagNumber(4)
  ContextActionModify_Operation get operation => $_getN(3);
  @$pb.TagNumber(4)
  set operation(ContextActionModify_Operation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOperation() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperation() => clearField(4);
}

/// Sent by the client when it wants to initiate a Context action.
class ContextAction extends $pb.GeneratedMessage {
  factory ContextAction({
    $core.int? session,
    $core.int? channelId,
    $core.String? action,
  }) {
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  ContextAction._() : super();
  factory ContextAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContextAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'session', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..aQS(3, _omitFieldNames ? '' : 'action')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContextAction clone() => ContextAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContextAction copyWith(void Function(ContextAction) updates) => super.copyWith((message) => updates(message as ContextAction)) as ContextAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContextAction create() => ContextAction._();
  ContextAction createEmptyInstance() => create();
  static $pb.PbList<ContextAction> createRepeated() => $pb.PbList<ContextAction>();
  @$core.pragma('dart2js:noInline')
  static ContextAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextAction>(create);
  static ContextAction? _defaultInstance;

  /// The target User for the action, identified by session.
  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  /// The target Channel for the action, identified by channel_id.
  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  /// The action that should be executed.
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
  factory UserList_User({
    $core.int? userId,
    $core.String? name,
    $core.String? lastSeen,
    $core.int? lastChannel,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (lastSeen != null) {
      $result.lastSeen = lastSeen;
    }
    if (lastChannel != null) {
      $result.lastChannel = lastChannel;
    }
    return $result;
  }
  UserList_User._() : super();
  factory UserList_User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList_User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserList.User', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.QU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'lastSeen')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'lastChannel', $pb.PbFieldType.OU3)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserList_User clone() => UserList_User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserList_User copyWith(void Function(UserList_User) updates) => super.copyWith((message) => updates(message as UserList_User)) as UserList_User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserList_User create() => UserList_User._();
  UserList_User createEmptyInstance() => create();
  static $pb.PbList<UserList_User> createRepeated() => $pb.PbList<UserList_User>();
  @$core.pragma('dart2js:noInline')
  static UserList_User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList_User>(create);
  static UserList_User? _defaultInstance;

  /// Registered user ID.
  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// Registered user name.
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

/// Lists the registered users.
class UserList extends $pb.GeneratedMessage {
  factory UserList({
    $core.Iterable<UserList_User>? users,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    return $result;
  }
  UserList._() : super();
  factory UserList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserList', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..pc<UserList_User>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserList_User.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserList clone() => UserList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserList copyWith(void Function(UserList) updates) => super.copyWith((message) => updates(message as UserList)) as UserList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  UserList createEmptyInstance() => create();
  static $pb.PbList<UserList> createRepeated() => $pb.PbList<UserList>();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList? _defaultInstance;

  /// A list of registered users.
  @$pb.TagNumber(1)
  $core.List<UserList_User> get users => $_getList(0);
}

class VoiceTarget_Target extends $pb.GeneratedMessage {
  factory VoiceTarget_Target({
    $core.Iterable<$core.int>? session,
    $core.int? channelId,
    $core.String? group,
    $core.bool? links,
    $core.bool? children,
  }) {
    final $result = create();
    if (session != null) {
      $result.session.addAll(session);
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (group != null) {
      $result.group = group;
    }
    if (links != null) {
      $result.links = links;
    }
    if (children != null) {
      $result.children = children;
    }
    return $result;
  }
  VoiceTarget_Target._() : super();
  factory VoiceTarget_Target.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceTarget_Target.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceTarget.Target', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'session', $pb.PbFieldType.PU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'group')
    ..aOB(4, _omitFieldNames ? '' : 'links')
    ..aOB(5, _omitFieldNames ? '' : 'children')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceTarget_Target clone() => VoiceTarget_Target()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceTarget_Target copyWith(void Function(VoiceTarget_Target) updates) => super.copyWith((message) => updates(message as VoiceTarget_Target)) as VoiceTarget_Target;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceTarget_Target create() => VoiceTarget_Target._();
  VoiceTarget_Target createEmptyInstance() => create();
  static $pb.PbList<VoiceTarget_Target> createRepeated() => $pb.PbList<VoiceTarget_Target>();
  @$core.pragma('dart2js:noInline')
  static VoiceTarget_Target getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceTarget_Target>(create);
  static VoiceTarget_Target? _defaultInstance;

  /// Users that are included as targets.
  @$pb.TagNumber(1)
  $core.List<$core.int> get session => $_getList(0);

  /// Channel that is included as a target.
  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  /// ACL group that is included as a target.
  @$pb.TagNumber(3)
  $core.String get group => $_getSZ(2);
  @$pb.TagNumber(3)
  set group($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => clearField(3);

  /// True if the voice should follow links from the specified channel.
  @$pb.TagNumber(4)
  $core.bool get links => $_getBF(3);
  @$pb.TagNumber(4)
  set links($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLinks() => $_has(3);
  @$pb.TagNumber(4)
  void clearLinks() => clearField(4);

  /// True if the voice should also be sent to children of the specific
  /// channel.
  @$pb.TagNumber(5)
  $core.bool get children => $_getBF(4);
  @$pb.TagNumber(5)
  set children($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChildren() => $_has(4);
  @$pb.TagNumber(5)
  void clearChildren() => clearField(5);
}

///  Sent by the client when it wants to register or clear whisper targets.
///
///  Note: The first available target ID is 1 as 0 is reserved for normal
///  talking. Maximum target ID is 30.
class VoiceTarget extends $pb.GeneratedMessage {
  factory VoiceTarget({
    $core.int? id,
    $core.Iterable<VoiceTarget_Target>? targets,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (targets != null) {
      $result.targets.addAll(targets);
    }
    return $result;
  }
  VoiceTarget._() : super();
  factory VoiceTarget.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceTarget.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceTarget', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..pc<VoiceTarget_Target>(2, _omitFieldNames ? '' : 'targets', $pb.PbFieldType.PM, subBuilder: VoiceTarget_Target.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceTarget clone() => VoiceTarget()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceTarget copyWith(void Function(VoiceTarget) updates) => super.copyWith((message) => updates(message as VoiceTarget)) as VoiceTarget;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceTarget create() => VoiceTarget._();
  VoiceTarget createEmptyInstance() => create();
  static $pb.PbList<VoiceTarget> createRepeated() => $pb.PbList<VoiceTarget>();
  @$core.pragma('dart2js:noInline')
  static VoiceTarget getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceTarget>(create);
  static VoiceTarget? _defaultInstance;

  /// Voice target ID.
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// The receivers that this voice target includes.
  @$pb.TagNumber(2)
  $core.List<VoiceTarget_Target> get targets => $_getList(1);
}

/// Sent by the client when it wants permissions for a certain channel. Sent by
/// the server when it replies to the query or wants the user to resync all
/// channel permissions.
class PermissionQuery extends $pb.GeneratedMessage {
  factory PermissionQuery({
    $core.int? channelId,
    $core.int? permissions,
    $core.bool? flush,
  }) {
    final $result = create();
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (permissions != null) {
      $result.permissions = permissions;
    }
    if (flush != null) {
      $result.flush = flush;
    }
    return $result;
  }
  PermissionQuery._() : super();
  factory PermissionQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PermissionQuery', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'flush')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionQuery clone() => PermissionQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionQuery copyWith(void Function(PermissionQuery) updates) => super.copyWith((message) => updates(message as PermissionQuery)) as PermissionQuery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionQuery create() => PermissionQuery._();
  PermissionQuery createEmptyInstance() => create();
  static $pb.PbList<PermissionQuery> createRepeated() => $pb.PbList<PermissionQuery>();
  @$core.pragma('dart2js:noInline')
  static PermissionQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionQuery>(create);
  static PermissionQuery? _defaultInstance;

  /// channel_id of the channel for which the permissions are queried.
  @$pb.TagNumber(1)
  $core.int get channelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => clearField(1);

  /// Channel permissions.
  @$pb.TagNumber(2)
  $core.int get permissions => $_getIZ(1);
  @$pb.TagNumber(2)
  set permissions($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissions() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissions() => clearField(2);

  /// True if the client should drop its current permission information for all
  /// channels.
  @$pb.TagNumber(3)
  $core.bool get flush => $_getBF(2);
  @$pb.TagNumber(3)
  set flush($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFlush() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlush() => clearField(3);
}

/// Sent by the server to notify the users of the version of the CELT codec they
/// should use. This may change during the connection when new users join.
class CodecVersion extends $pb.GeneratedMessage {
  factory CodecVersion({
    $core.int? alpha,
    $core.int? beta,
    $core.bool? preferAlpha,
    $core.bool? opus,
  }) {
    final $result = create();
    if (alpha != null) {
      $result.alpha = alpha;
    }
    if (beta != null) {
      $result.beta = beta;
    }
    if (preferAlpha != null) {
      $result.preferAlpha = preferAlpha;
    }
    if (opus != null) {
      $result.opus = opus;
    }
    return $result;
  }
  CodecVersion._() : super();
  factory CodecVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodecVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CodecVersion', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'alpha', $pb.PbFieldType.Q3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'beta', $pb.PbFieldType.Q3)
    ..a<$core.bool>(3, _omitFieldNames ? '' : 'preferAlpha', $pb.PbFieldType.QB, defaultOrMaker: true)
    ..aOB(4, _omitFieldNames ? '' : 'opus')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CodecVersion clone() => CodecVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CodecVersion copyWith(void Function(CodecVersion) updates) => super.copyWith((message) => updates(message as CodecVersion)) as CodecVersion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CodecVersion create() => CodecVersion._();
  CodecVersion createEmptyInstance() => create();
  static $pb.PbList<CodecVersion> createRepeated() => $pb.PbList<CodecVersion>();
  @$core.pragma('dart2js:noInline')
  static CodecVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodecVersion>(create);
  static CodecVersion? _defaultInstance;

  /// The version of the CELT Alpha codec.
  @$pb.TagNumber(1)
  $core.int get alpha => $_getIZ(0);
  @$pb.TagNumber(1)
  set alpha($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlpha() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlpha() => clearField(1);

  /// The version of the CELT Beta codec.
  @$pb.TagNumber(2)
  $core.int get beta => $_getIZ(1);
  @$pb.TagNumber(2)
  set beta($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearBeta() => clearField(2);

  /// True if the user should prefer Alpha over Beta.
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
  factory UserStats_Stats({
    $core.int? good,
    $core.int? late,
    $core.int? lost,
    $core.int? resync,
  }) {
    final $result = create();
    if (good != null) {
      $result.good = good;
    }
    if (late != null) {
      $result.late = late;
    }
    if (lost != null) {
      $result.lost = lost;
    }
    if (resync != null) {
      $result.resync = resync;
    }
    return $result;
  }
  UserStats_Stats._() : super();
  factory UserStats_Stats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStats_Stats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserStats.Stats', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'good', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'late', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lost', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'resync', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserStats_Stats clone() => UserStats_Stats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserStats_Stats copyWith(void Function(UserStats_Stats) updates) => super.copyWith((message) => updates(message as UserStats_Stats)) as UserStats_Stats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserStats_Stats create() => UserStats_Stats._();
  UserStats_Stats createEmptyInstance() => create();
  static $pb.PbList<UserStats_Stats> createRepeated() => $pb.PbList<UserStats_Stats>();
  @$core.pragma('dart2js:noInline')
  static UserStats_Stats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStats_Stats>(create);
  static UserStats_Stats? _defaultInstance;

  /// The amount of good packets received.
  @$pb.TagNumber(1)
  $core.int get good => $_getIZ(0);
  @$pb.TagNumber(1)
  set good($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGood() => $_has(0);
  @$pb.TagNumber(1)
  void clearGood() => clearField(1);

  /// The amount of late packets received.
  @$pb.TagNumber(2)
  $core.int get late => $_getIZ(1);
  @$pb.TagNumber(2)
  set late($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLate() => clearField(2);

  /// The amount of packets never received.
  @$pb.TagNumber(3)
  $core.int get lost => $_getIZ(2);
  @$pb.TagNumber(3)
  set lost($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLost() => $_has(2);
  @$pb.TagNumber(3)
  void clearLost() => clearField(3);

  /// The amount of nonce resyncs.
  @$pb.TagNumber(4)
  $core.int get resync => $_getIZ(3);
  @$pb.TagNumber(4)
  set resync($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResync() => $_has(3);
  @$pb.TagNumber(4)
  void clearResync() => clearField(4);
}

/// Used to communicate user stats between the server and clients.
class UserStats extends $pb.GeneratedMessage {
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
    final $result = create();
    if (session != null) {
      $result.session = session;
    }
    if (statsOnly != null) {
      $result.statsOnly = statsOnly;
    }
    if (certificates != null) {
      $result.certificates.addAll(certificates);
    }
    if (fromClient != null) {
      $result.fromClient = fromClient;
    }
    if (fromServer != null) {
      $result.fromServer = fromServer;
    }
    if (udpPackets != null) {
      $result.udpPackets = udpPackets;
    }
    if (tcpPackets != null) {
      $result.tcpPackets = tcpPackets;
    }
    if (udpPingAvg != null) {
      $result.udpPingAvg = udpPingAvg;
    }
    if (udpPingVar != null) {
      $result.udpPingVar = udpPingVar;
    }
    if (tcpPingAvg != null) {
      $result.tcpPingAvg = tcpPingAvg;
    }
    if (tcpPingVar != null) {
      $result.tcpPingVar = tcpPingVar;
    }
    if (version != null) {
      $result.version = version;
    }
    if (celtVersions != null) {
      $result.celtVersions.addAll(celtVersions);
    }
    if (address != null) {
      $result.address = address;
    }
    if (bandwidth != null) {
      $result.bandwidth = bandwidth;
    }
    if (onlinesecs != null) {
      $result.onlinesecs = onlinesecs;
    }
    if (idlesecs != null) {
      $result.idlesecs = idlesecs;
    }
    if (strongCertificate != null) {
      $result.strongCertificate = strongCertificate;
    }
    if (opus != null) {
      $result.opus = opus;
    }
    return $result;
  }
  UserStats._() : super();
  factory UserStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserStats', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'session', $pb.PbFieldType.OU3)
    ..aOB(2, _omitFieldNames ? '' : 'statsOnly')
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'certificates', $pb.PbFieldType.PY)
    ..aOM<UserStats_Stats>(4, _omitFieldNames ? '' : 'fromClient', subBuilder: UserStats_Stats.create)
    ..aOM<UserStats_Stats>(5, _omitFieldNames ? '' : 'fromServer', subBuilder: UserStats_Stats.create)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'udpPackets', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'tcpPackets', $pb.PbFieldType.OU3)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'udpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'udpPingVar', $pb.PbFieldType.OF)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'tcpPingAvg', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'tcpPingVar', $pb.PbFieldType.OF)
    ..aOM<Version>(12, _omitFieldNames ? '' : 'version', subBuilder: Version.create)
    ..p<$core.int>(13, _omitFieldNames ? '' : 'celtVersions', $pb.PbFieldType.P3)
    ..a<$core.List<$core.int>>(14, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(15, _omitFieldNames ? '' : 'bandwidth', $pb.PbFieldType.OU3)
    ..a<$core.int>(16, _omitFieldNames ? '' : 'onlinesecs', $pb.PbFieldType.OU3)
    ..a<$core.int>(17, _omitFieldNames ? '' : 'idlesecs', $pb.PbFieldType.OU3)
    ..aOB(18, _omitFieldNames ? '' : 'strongCertificate')
    ..aOB(19, _omitFieldNames ? '' : 'opus')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserStats clone() => UserStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserStats copyWith(void Function(UserStats) updates) => super.copyWith((message) => updates(message as UserStats)) as UserStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserStats create() => UserStats._();
  UserStats createEmptyInstance() => create();
  static $pb.PbList<UserStats> createRepeated() => $pb.PbList<UserStats>();
  @$core.pragma('dart2js:noInline')
  static UserStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStats>(create);
  static UserStats? _defaultInstance;

  /// User whose stats these are.
  @$pb.TagNumber(1)
  $core.int get session => $_getIZ(0);
  @$pb.TagNumber(1)
  set session($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  /// True if the message contains only mutable stats (packets, ping).
  @$pb.TagNumber(2)
  $core.bool get statsOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set statsOnly($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatsOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatsOnly() => clearField(2);

  /// Full user certificate chain of the user certificate in DER format.
  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get certificates => $_getList(2);

  /// Packet statistics for packets received from the client.
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

  /// Packet statistics for packets sent by the server.
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

  /// Amount of UDP packets sent.
  @$pb.TagNumber(6)
  $core.int get udpPackets => $_getIZ(5);
  @$pb.TagNumber(6)
  set udpPackets($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUdpPackets() => $_has(5);
  @$pb.TagNumber(6)
  void clearUdpPackets() => clearField(6);

  /// Amount of TCP packets sent.
  @$pb.TagNumber(7)
  $core.int get tcpPackets => $_getIZ(6);
  @$pb.TagNumber(7)
  set tcpPackets($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTcpPackets() => $_has(6);
  @$pb.TagNumber(7)
  void clearTcpPackets() => clearField(7);

  /// UDP ping average.
  @$pb.TagNumber(8)
  $core.double get udpPingAvg => $_getN(7);
  @$pb.TagNumber(8)
  set udpPingAvg($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUdpPingAvg() => $_has(7);
  @$pb.TagNumber(8)
  void clearUdpPingAvg() => clearField(8);

  /// UDP ping variance.
  @$pb.TagNumber(9)
  $core.double get udpPingVar => $_getN(8);
  @$pb.TagNumber(9)
  set udpPingVar($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUdpPingVar() => $_has(8);
  @$pb.TagNumber(9)
  void clearUdpPingVar() => clearField(9);

  /// TCP ping average.
  @$pb.TagNumber(10)
  $core.double get tcpPingAvg => $_getN(9);
  @$pb.TagNumber(10)
  set tcpPingAvg($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTcpPingAvg() => $_has(9);
  @$pb.TagNumber(10)
  void clearTcpPingAvg() => clearField(10);

  /// TCP ping variance.
  @$pb.TagNumber(11)
  $core.double get tcpPingVar => $_getN(10);
  @$pb.TagNumber(11)
  set tcpPingVar($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTcpPingVar() => $_has(10);
  @$pb.TagNumber(11)
  void clearTcpPingVar() => clearField(11);

  /// Client version.
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

  /// A list of CELT bitstream version constants supported by the client of this
  /// user.
  @$pb.TagNumber(13)
  $core.List<$core.int> get celtVersions => $_getList(12);

  /// Client IP address.
  @$pb.TagNumber(14)
  $core.List<$core.int> get address => $_getN(13);
  @$pb.TagNumber(14)
  set address($core.List<$core.int> v) { $_setBytes(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAddress() => $_has(13);
  @$pb.TagNumber(14)
  void clearAddress() => clearField(14);

  /// Bandwidth used by this client.
  @$pb.TagNumber(15)
  $core.int get bandwidth => $_getIZ(14);
  @$pb.TagNumber(15)
  set bandwidth($core.int v) { $_setUnsignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasBandwidth() => $_has(14);
  @$pb.TagNumber(15)
  void clearBandwidth() => clearField(15);

  /// Connection duration.
  @$pb.TagNumber(16)
  $core.int get onlinesecs => $_getIZ(15);
  @$pb.TagNumber(16)
  set onlinesecs($core.int v) { $_setUnsignedInt32(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasOnlinesecs() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnlinesecs() => clearField(16);

  /// Duration since last activity.
  @$pb.TagNumber(17)
  $core.int get idlesecs => $_getIZ(16);
  @$pb.TagNumber(17)
  set idlesecs($core.int v) { $_setUnsignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasIdlesecs() => $_has(16);
  @$pb.TagNumber(17)
  void clearIdlesecs() => clearField(17);

  /// True if the user has a strong certificate.
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

/// Used by the client to request binary data from the server. By default large
/// comments or textures are not sent within standard messages but instead the
/// hash is. If the client does not recognize the hash it may request the
/// resource when it needs it. The client does so by sending a RequestBlob
/// message with the correct fields filled with the user sessions or channel_ids
/// it wants to receive. The server replies to this by sending a new
/// UserState/ChannelState message with the resources filled even if they would
/// normally be transmitted as hashes.
class RequestBlob extends $pb.GeneratedMessage {
  factory RequestBlob({
    $core.Iterable<$core.int>? sessionTexture,
    $core.Iterable<$core.int>? sessionComment,
    $core.Iterable<$core.int>? channelDescription,
  }) {
    final $result = create();
    if (sessionTexture != null) {
      $result.sessionTexture.addAll(sessionTexture);
    }
    if (sessionComment != null) {
      $result.sessionComment.addAll(sessionComment);
    }
    if (channelDescription != null) {
      $result.channelDescription.addAll(channelDescription);
    }
    return $result;
  }
  RequestBlob._() : super();
  factory RequestBlob.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestBlob.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestBlob', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'sessionTexture', $pb.PbFieldType.PU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'sessionComment', $pb.PbFieldType.PU3)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'channelDescription', $pb.PbFieldType.PU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestBlob clone() => RequestBlob()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestBlob copyWith(void Function(RequestBlob) updates) => super.copyWith((message) => updates(message as RequestBlob)) as RequestBlob;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestBlob create() => RequestBlob._();
  RequestBlob createEmptyInstance() => create();
  static $pb.PbList<RequestBlob> createRepeated() => $pb.PbList<RequestBlob>();
  @$core.pragma('dart2js:noInline')
  static RequestBlob getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestBlob>(create);
  static RequestBlob? _defaultInstance;

  /// sessions of the requested UserState textures.
  @$pb.TagNumber(1)
  $core.List<$core.int> get sessionTexture => $_getList(0);

  /// sessions of the requested UserState comments.
  @$pb.TagNumber(2)
  $core.List<$core.int> get sessionComment => $_getList(1);

  /// channel_ids of the requested ChannelState descriptions.
  @$pb.TagNumber(3)
  $core.List<$core.int> get channelDescription => $_getList(2);
}

/// Sent by the server when it informs the clients on server configuration
/// details.
class ServerConfig extends $pb.GeneratedMessage {
  factory ServerConfig({
    $core.int? maxBandwidth,
    $core.String? welcomeText,
    $core.bool? allowHtml,
    $core.int? messageLength,
    $core.int? imageMessageLength,
    $core.int? maxUsers,
  }) {
    final $result = create();
    if (maxBandwidth != null) {
      $result.maxBandwidth = maxBandwidth;
    }
    if (welcomeText != null) {
      $result.welcomeText = welcomeText;
    }
    if (allowHtml != null) {
      $result.allowHtml = allowHtml;
    }
    if (messageLength != null) {
      $result.messageLength = messageLength;
    }
    if (imageMessageLength != null) {
      $result.imageMessageLength = imageMessageLength;
    }
    if (maxUsers != null) {
      $result.maxUsers = maxUsers;
    }
    return $result;
  }
  ServerConfig._() : super();
  factory ServerConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'maxBandwidth', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'welcomeText')
    ..aOB(3, _omitFieldNames ? '' : 'allowHtml')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'messageLength', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'imageMessageLength', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'maxUsers', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerConfig clone() => ServerConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerConfig copyWith(void Function(ServerConfig) updates) => super.copyWith((message) => updates(message as ServerConfig)) as ServerConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerConfig create() => ServerConfig._();
  ServerConfig createEmptyInstance() => create();
  static $pb.PbList<ServerConfig> createRepeated() => $pb.PbList<ServerConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerConfig>(create);
  static ServerConfig? _defaultInstance;

  /// The maximum bandwidth the clients should use.
  @$pb.TagNumber(1)
  $core.int get maxBandwidth => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxBandwidth($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxBandwidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxBandwidth() => clearField(1);

  /// Server welcome text.
  @$pb.TagNumber(2)
  $core.String get welcomeText => $_getSZ(1);
  @$pb.TagNumber(2)
  set welcomeText($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWelcomeText() => $_has(1);
  @$pb.TagNumber(2)
  void clearWelcomeText() => clearField(2);

  /// True if the server allows HTML.
  @$pb.TagNumber(3)
  $core.bool get allowHtml => $_getBF(2);
  @$pb.TagNumber(3)
  set allowHtml($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowHtml() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowHtml() => clearField(3);

  /// Maximum text message length.
  @$pb.TagNumber(4)
  $core.int get messageLength => $_getIZ(3);
  @$pb.TagNumber(4)
  set messageLength($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageLength() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageLength() => clearField(4);

  /// Maximum image message length.
  @$pb.TagNumber(5)
  $core.int get imageMessageLength => $_getIZ(4);
  @$pb.TagNumber(5)
  set imageMessageLength($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageMessageLength() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageMessageLength() => clearField(5);

  /// The maximum number of users allowed on the server.
  @$pb.TagNumber(6)
  $core.int get maxUsers => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxUsers($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxUsers() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxUsers() => clearField(6);
}

/// Sent by the server to inform the clients of suggested client configuration
/// specified by the server administrator.
class SuggestConfig extends $pb.GeneratedMessage {
  factory SuggestConfig({
    $core.int? version,
    $core.bool? positional,
    $core.bool? pushToTalk,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (positional != null) {
      $result.positional = positional;
    }
    if (pushToTalk != null) {
      $result.pushToTalk = pushToTalk;
    }
    return $result;
  }
  SuggestConfig._() : super();
  factory SuggestConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SuggestConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOB(2, _omitFieldNames ? '' : 'positional')
    ..aOB(3, _omitFieldNames ? '' : 'pushToTalk')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestConfig clone() => SuggestConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestConfig copyWith(void Function(SuggestConfig) updates) => super.copyWith((message) => updates(message as SuggestConfig)) as SuggestConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuggestConfig create() => SuggestConfig._();
  SuggestConfig createEmptyInstance() => create();
  static $pb.PbList<SuggestConfig> createRepeated() => $pb.PbList<SuggestConfig>();
  @$core.pragma('dart2js:noInline')
  static SuggestConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestConfig>(create);
  static SuggestConfig? _defaultInstance;

  /// Suggested client version.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// True if the administrator suggests positional audio to be used on this
  /// server.
  @$pb.TagNumber(2)
  $core.bool get positional => $_getBF(1);
  @$pb.TagNumber(2)
  set positional($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPositional() => $_has(1);
  @$pb.TagNumber(2)
  void clearPositional() => clearField(2);

  /// True if the administrator suggests push to talk to be used on this server.
  @$pb.TagNumber(3)
  $core.bool get pushToTalk => $_getBF(2);
  @$pb.TagNumber(3)
  set pushToTalk($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPushToTalk() => $_has(2);
  @$pb.TagNumber(3)
  void clearPushToTalk() => clearField(3);
}

/// Used to send plugin messages between clients
class PluginDataTransmission extends $pb.GeneratedMessage {
  factory PluginDataTransmission({
    $core.int? senderSession,
    $core.Iterable<$core.int>? receiverSessions,
    $core.List<$core.int>? data,
    $core.String? dataID,
  }) {
    final $result = create();
    if (senderSession != null) {
      $result.senderSession = senderSession;
    }
    if (receiverSessions != null) {
      $result.receiverSessions.addAll(receiverSessions);
    }
    if (data != null) {
      $result.data = data;
    }
    if (dataID != null) {
      $result.dataID = dataID;
    }
    return $result;
  }
  PluginDataTransmission._() : super();
  factory PluginDataTransmission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PluginDataTransmission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PluginDataTransmission', package: const $pb.PackageName(_omitMessageNames ? '' : 'MumbleProto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'senderSession', $pb.PbFieldType.OU3, protoName: 'senderSession')
    ..p<$core.int>(2, _omitFieldNames ? '' : 'receiverSessions', $pb.PbFieldType.KU3, protoName: 'receiverSessions')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'dataID', protoName: 'dataID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PluginDataTransmission clone() => PluginDataTransmission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PluginDataTransmission copyWith(void Function(PluginDataTransmission) updates) => super.copyWith((message) => updates(message as PluginDataTransmission)) as PluginDataTransmission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PluginDataTransmission create() => PluginDataTransmission._();
  PluginDataTransmission createEmptyInstance() => create();
  static $pb.PbList<PluginDataTransmission> createRepeated() => $pb.PbList<PluginDataTransmission>();
  @$core.pragma('dart2js:noInline')
  static PluginDataTransmission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PluginDataTransmission>(create);
  static PluginDataTransmission? _defaultInstance;

  /// The session ID of the client this message was sent from
  @$pb.TagNumber(1)
  $core.int get senderSession => $_getIZ(0);
  @$pb.TagNumber(1)
  set senderSession($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderSession() => clearField(1);

  /// The session IDs of the clients that should receive this message
  @$pb.TagNumber(2)
  $core.List<$core.int> get receiverSessions => $_getList(1);

  /// The data that is sent
  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);

  /// The ID of the sent data. This will be used by plugins to check whether they will
  /// process it or not
  @$pb.TagNumber(4)
  $core.String get dataID => $_getSZ(3);
  @$pb.TagNumber(4)
  set dataID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataID() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataID() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
