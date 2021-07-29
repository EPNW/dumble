import 'channel.dart';
import 'user.dart';
import '../utils/utils.dart' show JsonString;
import 'package:meta/meta.dart';

abstract class TextMessage with JsonString {
  final List<User> clients;
  final List<Channel> channels;
  final List<Channel> trees;
  final String message;

  TextMessage(
      {List<User>? clients,
      List<Channel>? channels,
      List<Channel>? trees,
      required this.message})
      : this.clients = new List<User>.from(clients ?? <User>[]),
        this.channels = new List<Channel>.from(channels ?? <Channel>[]),
        this.trees = new List<Channel>.from(trees ?? <Channel>[]);

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['channels'] = channels.map((Channel channel) => channel.channelId)
    ..['trees'] = trees.map((Channel channel) => channel.channelId)
    ..['message'] = message;
}

class OutgoingTextMessage extends TextMessage {
  OutgoingTextMessage(
      {List<User>? clients,
      List<Channel>? channels,
      List<Channel>? trees,
      required String message})
      : super(
            message: message,
            clients: clients,
            trees: trees,
            channels: channels);
}

class IncomingTextMessage extends TextMessage {
  final User? actor;
  IncomingTextMessage._(
      {this.actor,
      List<User>? clients,
      List<Channel>? channels,
      List<Channel>? trees,
      required String message})
      : super(
            message: message,
            clients: clients,
            trees: trees,
            channels: channels);
  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = super.jsonMap();
    if (actor != null) {
      map['actor'] = actor!.session;
    }
    return map;
  }
}

// This function is actually a exception from the rule where a file that declares
// a type is responsible for decoding it from proto. This is due to the many id lookups
// required, that only a client could do.
@protected
IncomingTextMessage incomingTextMessageFromProto(
    {User? actor,
    List<User>? clients,
    List<Channel>? channels,
    List<Channel>? trees,
    required String message}) {
  return new IncomingTextMessage._(
      actor: actor,
      clients: clients,
      channels: channels,
      trees: trees,
      message: message);
}
