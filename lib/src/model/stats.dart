import '../utils/utils.dart' show JsonString;
import 'package:meta/meta.dart';
import '../generated/Mumble.pb.dart' as Proto;

@protected
PacketStats packetStatsFromProto(Proto.UserStats_Stats stats) {
  return new PacketStats._(
      goodPacketCount: stats.hasGood() ? stats.good : null,
      latePacketCount: stats.hasLate() ? stats.late : null,
      lostPacketCount: stats.hasLost() ? stats.lost : null,
      resync: stats.hasRequiredFields() ? stats.resync : null);
}

@protected
PacketStats packetStatsFromValues(
    {int? goodPacketCount,
    int? latePacketCount,
    int? lostPacketCount,
    int? resync}) {
  return new PacketStats._(
      goodPacketCount: goodPacketCount,
      latePacketCount: latePacketCount,
      lostPacketCount: lostPacketCount,
      resync: resync);
}

class PacketStats with JsonString {
  final int? goodPacketCount;
  final int? latePacketCount;
  final int? lostPacketCount;
  final int? resync;

  const PacketStats._(
      {this.goodPacketCount,
      this.latePacketCount,
      this.lostPacketCount,
      this.resync});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    if (goodPacketCount != null) {
      map['goodPacketCount'] = goodPacketCount!;
    }
    if (latePacketCount != null) {
      map['latePacketCount'] = latePacketCount!;
    }
    if (lostPacketCount != null) {
      map['lostPacketCount'] = lostPacketCount!;
    }
    if (resync != null) {
      map['resync'] = resync!;
    }
    return map;
  }
}

@protected
VersionInformation versionInformationFromProto(Proto.Version version) {
  return new VersionInformation._(
      os: version.hasOs() ? version.os : null,
      osVersion: version.hasOsVersion() ? version.osVersion : null,
      release: version.hasRelease() ? version.release : null,
      version: version.hasVersion() ? version.version : null);
}

class VersionInformation with JsonString {
  final int? version;
  final String? release;
  final String? os;
  final String? osVersion;

  const VersionInformation._(
      {this.version, this.release, this.os, this.osVersion});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    if (version != null) {
      map['version'] = version!;
    }
    if (release != null) {
      map['release'] = release!;
    }
    if (os != null) {
      map['os'] = os!;
    }
    if (osVersion != null) {
      map['osVersion'] = osVersion!;
    }
    return map;
  }
}

@protected
PingStats pingStatsFromValues(
    {double? tcpPingAverage,
    double? tcpPingVariance,
    double? udpPingAverage,
    double? udpPingVariance}) {
  return new PingStats._(
      tcpPingAverage: tcpPingAverage,
      tcpPingVariance: tcpPingAverage,
      udpPingAverage: udpPingAverage,
      udpPingVariance: udpPingVariance);
}

class PingStats with JsonString {
  final double? udpPingAverage;
  final double? udpPingVariance;
  final double? tcpPingAverage;
  final double? tcpPingVariance;

  const PingStats._(
      {this.tcpPingAverage,
      this.tcpPingVariance,
      this.udpPingAverage,
      this.udpPingVariance});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    if (udpPingAverage != null) {
      map['udpPingAverage'] = udpPingAverage!;
    }
    if (udpPingVariance != null) {
      map['udpPingVariance'] = udpPingVariance!;
    }
    if (tcpPingAverage != null) {
      map['tcpPingAverage'] = tcpPingAverage!;
    }
    if (tcpPingVariance != null) {
      map['tcpPingVariance'] = tcpPingVariance!;
    }
    return map;
  }
}
