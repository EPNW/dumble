import 'dart:convert' show base64;
import 'dart:io' show InternetAddress;
import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../utils/utils.dart' show JsonString, ByteAddress;
import '../generated/Mumble.pb.dart' as Proto;
import 'stats.dart';

@protected
UserStats userStatsFromProto({required Proto.UserStats stats}) {
  InternetAddress? address;
  if (stats.hasAddress() &&
      (stats.address.length == 4 || stats.address.length == 16)) {
    address = ByteAddress.fromBytes(new Uint8List.fromList(stats.address),
        asIPv4IfPossible: true);
  }

  VersionInformation? info;
  if (stats.hasVersion()) {
    info = versionInformationFromProto(stats.version);
  }

  PacketStats? fromServer;
  if (stats.hasFromServer()) {
    fromServer = packetStatsFromProto(stats.fromServer);
  }

  PacketStats? fromClient;
  if (stats.hasFromClient()) {
    fromServer = packetStatsFromProto(stats.fromClient);
  }

  PingStats pingStats = pingStatsFromValues(
      tcpPingAverage: stats.hasTcpPingAvg() ? stats.tcpPingAvg : null,
      tcpPingVariance: stats.hasTcpPingVar() ? stats.tcpPingVar : null,
      udpPingAverage: stats.hasUdpPackets() ? stats.udpPingAvg : null,
      udpPingVariance: stats.hasUdpPingVar() ? stats.udpPingVar : null);

  List<Uint8List> certificates = <Uint8List>[];
  for (List<int> cert in stats.certificates) {
    certificates.add(new Uint8List.fromList(cert));
  }

  return new UserStats._(
      certificates: certificates,
      pingStats: pingStats,
      fromClient: fromClient,
      fromServer: fromServer,
      clientVersion: info,
      strongCertificate: stats.strongCertificate,
      celtVersions: stats.celtVersions,
      bandwidth: stats.bandwidth,
      udpPacketCount: stats.udpPackets,
      tcpPacketCount: stats.tcpPackets,
      opus: stats.opus,
      address: address,
      onlineTime: (stats.hasOnlinesecs())
          ? new Duration(seconds: stats.onlinesecs)
          : null,
      idleTime:
          (stats.hasIdlesecs()) ? new Duration(seconds: stats.idlesecs) : null);
}

class UserStats with JsonString {
  final List<Uint8List> certificates;
  final PacketStats? fromClient;
  final PacketStats? fromServer;
  final int? udpPacketCount;
  final int? tcpPacketCount;
  final PingStats pingStats;
  final VersionInformation? clientVersion;
  final List<int>? celtVersions;
  final InternetAddress? address;
  final int? bandwidth;
  final Duration? onlineTime;
  final Duration? idleTime;
  final bool? strongCertificate;
  final bool? opus;

  UserStats._(
      {List<Uint8List>? certificates,
      this.fromClient,
      this.fromServer,
      this.udpPacketCount,
      this.tcpPacketCount,
      required this.pingStats,
      this.clientVersion,
      this.celtVersions,
      this.address,
      this.bandwidth,
      this.onlineTime,
      this.idleTime,
      this.strongCertificate,
      this.opus})
      : this.certificates =
            certificates ?? new List<Uint8List>.unmodifiable(<Uint8List>[]);

  ///If withCertificates is true and the stats contain certificates, they are printed in binary.
  ///If withCertificates is false and the stats contain certificates, their count is printed.
  @override
  Map<String, Object> jsonMap({bool withCertificates: false}) {
    Map<String, Object> map = new Map<String, Object>();
    map['pingStats'] = pingStats.jsonMap();
    if (certificates.isNotEmpty) {
      map['certificates'] = (withCertificates
          ? certificates.map((Uint8List bytes) => base64.encode)
          : certificates.length);
    }
    if (fromClient != null) {
      map['fromClient'] = fromClient!.jsonMap();
    }
    if (fromServer != null) {
      map['fromServer'] = fromServer!.jsonMap();
    }
    if (udpPacketCount != null) {
      map['udpPacketCount'] = udpPacketCount!;
    }
    if (tcpPacketCount != null) {
      map['tcpPacketCount'] = tcpPacketCount!;
    }
    if (clientVersion != null) {
      map['clientVersion'] = clientVersion!.jsonMap();
    }
    if (celtVersions != null) {
      map['celtVersions'] = celtVersions!;
    }
    if (address != null) {
      map['address'] = address!.toString();
    }
    if (bandwidth != null) {
      map['bandwidth'] = bandwidth!;
    }
    if (onlineTime != null) {
      map['onlineTime'] = onlineTime!.toString();
    }
    if (idleTime != null) {
      map['idleTime'] = idleTime!.toString();
    }
    if (strongCertificate != null) {
      map['strongCertificate'] = strongCertificate!;
    }
    if (opus != null) {
      map['opus'] = opus!;
    }
    return map;
  }
}
