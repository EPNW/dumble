import 'package:meta/meta.dart';

import '../utils.dart' show JsonString, adjustNetworkBandwidth;
import 'stats.dart';
import '../generated/Mumble.pb.dart' as Proto;

class ServerSuggestedClientConfig with JsonString {
  final int? suggestedClientVersion;
  final bool? usePositionalAudio;
  final bool? usePushToTalk;

  const ServerSuggestedClientConfig._(
      {this.suggestedClientVersion,
      this.usePositionalAudio,
      this.usePushToTalk});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    if (suggestedClientVersion != null) {
      map['suggestedClientVersion'] = suggestedClientVersion!;
    }
    if (usePositionalAudio != null) {
      map['usePositionalAudio'] = usePositionalAudio!;
    }
    if (usePushToTalk != null) {
      map['usePushToTalk'] = usePushToTalk!;
    }
    return map;
  }
}

@protected
ServerSuggestedClientConfig serverSuggestedClientConfigFromProto(
    Proto.SuggestConfig suggested) {
  return new ServerSuggestedClientConfig._(
      suggestedClientVersion: suggested.hasVersion() ? suggested.version : null,
      usePositionalAudio:
          suggested.hasPositional() ? suggested.positional : null,
      usePushToTalk: suggested.hasPushToTalk() ? suggested.pushToTalk : null);
}

/// Readonly how the server is configured
class ServerConfig with JsonString {
  final bool? allowHtml;
  final int? maxMessageLength;
  final int? maxImageMessageLength;
  final int? maxUsers;
  final int? suggestedOpusBitrate;
  final int? maxBandwidth;
  final String? welcomeText;

  const ServerConfig._(
      {this.allowHtml,
      this.maxImageMessageLength,
      this.maxMessageLength,
      this.maxUsers,
      this.suggestedOpusBitrate,
      this.maxBandwidth,
      this.welcomeText});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    if (allowHtml != null) {
      map['allowHtml'] = allowHtml!;
    }
    if (maxMessageLength != null) {
      map['maxMessageLength'] = maxMessageLength!;
    }
    if (maxImageMessageLength != null) {
      map['maxImageMessageLength'] = maxImageMessageLength!;
    }
    if (maxUsers != null) {
      map['maxUsers'] = maxUsers!;
    }
    if (suggestedOpusBitrate != null) {
      map['suggestedOpusBitrate'] = suggestedOpusBitrate!;
    }
    if (maxBandwidth != null) {
      map['maxBandwidth'] = maxBandwidth!;
    }
    if (welcomeText != null) {
      map['welcomeText'] = welcomeText!;
    }
    return map;
  }
}

@protected
ServerConfig serverConfigFromProto(Proto.ServerConfig config) {
  return new ServerConfig._(
      allowHtml: config.hasAllowHtml() ? config.allowHtml : null,
      maxImageMessageLength:
          config.hasImageMessageLength() ? config.imageMessageLength : null,
      maxMessageLength: config.hasMessageLength() ? config.messageLength : null,
      maxUsers: config.hasMaxUsers() ? config.maxUsers : null,
      maxBandwidth: config.hasMaxBandwidth() ? config.maxBandwidth : null,
      welcomeText: config.hasWelcomeText() ? config.welcomeText : null,
      suggestedOpusBitrate: config.hasMaxBandwidth()
          ? adjustNetworkBandwidth(config.maxBandwidth)
          : null);
}

@protected
ServerConfig updatedServerConfigFromProto(
    Proto.ServerSync syncMessage, ServerConfig? current) {
  return new ServerConfig._(
      allowHtml: current?.allowHtml,
      maxImageMessageLength: current?.maxImageMessageLength,
      maxMessageLength: current?.maxMessageLength,
      maxUsers: current?.maxUsers,
      welcomeText: syncMessage.hasWelcomeText()
          ? syncMessage.welcomeText
          : current?.welcomeText,
      maxBandwidth: syncMessage.hasMaxBandwidth()
          ? syncMessage.maxBandwidth
          : current?.maxBandwidth,
      suggestedOpusBitrate: syncMessage.hasMaxBandwidth()
          ? adjustNetworkBandwidth(syncMessage.maxBandwidth)
          : current?.suggestedOpusBitrate);
}

/// Stats about the connection to the server
class ServerConnectionStats with JsonString {
  final PacketStats packetStats;
  final int? tcpPacketCount;
  final int? udpPacketCount;
  final PingStats pingStats;

  const ServerConnectionStats._(
      {required this.packetStats,
      this.tcpPacketCount,
      this.udpPacketCount,
      required this.pingStats});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()
      ..['packetStats'] = packetStats.jsonMap()
      ..['pingStats'] = pingStats.jsonMap();
    if (tcpPacketCount != null) {
      map['tcpPacketCount'] = tcpPacketCount!;
    }
    if (udpPacketCount != null) {
      map['udpPacketCount'] = udpPacketCount!;
    }
    return map;
  }
}

@protected
ServerConnectionStats serverConnectionStatsFromProto(Proto.Ping ping) {
  return new ServerConnectionStats._(
      packetStats: packetStatsFromValues(
        goodPacketCount: ping.hasGood() ? ping.good : null,
        latePacketCount: ping.hasLate() ? ping.late : null,
        lostPacketCount: ping.hasLost() ? ping.lost : null,
        resync: ping.hasResync() ? ping.resync : null,
      ),
      tcpPacketCount: ping.hasTcpPackets() ? ping.tcpPackets : null,
      udpPacketCount: ping.hasUdpPackets() ? ping.udpPackets : null,
      pingStats: pingStatsFromValues(
          tcpPingAverage: ping.hasTcpPingAvg() ? ping.tcpPingAvg : null,
          tcpPingVariance: ping.hasTcpPingVar() ? ping.tcpPingVar : null,
          udpPingAverage: ping.hasUdpPingAvg() ? ping.udpPingAvg : null,
          udpPingVariance: ping.hasUdpPingAvg() ? ping.udpPingVar : null));
}

class ServerCodecVersion with JsonString {
  final int celtAlphaVersion;
  final int celtBetaVersion;
  final bool preferAlpha;
  final bool? opus;

  const ServerCodecVersion._(
      {required this.celtAlphaVersion,
      required this.celtBetaVersion,
      required this.preferAlpha,
      this.opus});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()
      ..['celtAlphaVersion'] = celtAlphaVersion
      ..['celtBetaVersion'] = celtBetaVersion
      ..['preferAlpha'] = preferAlpha;
    if (opus != null) {
      map['opus'] = opus!;
    }
    return map;
  }
}

@protected
ServerCodecVersion serverCodecVersionFromProto(Proto.CodecVersion codec) {
  if (!codec.hasAlpha()) {
    throw new ArgumentError(
        'The proto message does not contain the required field \'alpha\' and is thus invalid!');
  }
  if (!codec.hasBeta()) {
    throw new ArgumentError(
        'The proto message does not contain the required field \'beta\' and is thus invalid!');
  }
  if (!codec.hasPreferAlpha()) {
    throw new ArgumentError(
        'The proto message does not contain the required field \'preferAlpha\' and is thus invalid!');
  }
  return new ServerCodecVersion._(
      celtAlphaVersion: codec.alpha,
      celtBetaVersion: codec.beta,
      preferAlpha: codec.preferAlpha,
      opus: codec.hasOpus() ? codec.opus : null);
}
