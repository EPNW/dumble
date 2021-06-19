import 'dart:typed_data';

import 'text_message.dart';
import '../client_base.dart';
import '../listeners.dart';
import 'package:meta/meta.dart';
import '../generated/Mumble.pb.dart' as Proto;
import 'permission.dart';
import 'voice_target.dart';
import '../utils.dart' show JsonString;

@protected
const ChannelChanges linksChanged = const ChannelChanges._(
    parent: false,
    links: true,
    description: false,
    temporary: false,
    position: false,
    descriptionHash: false,
    maxUsers: false,
    name: false,
    canEnter: false,
    isEnterRestricted: false);

@protected
Channel createNewChannel(
    {required MumbleClientBase client, required int channelId}) {
  return new Channel._(channelId, client);
}

@protected
ChannelChanges updateChannel(
    {required Channel channel,
    Channel? parent,
    List<Channel>? links,
    required Proto.ChannelState state}) {
  if (parent != null) channel._parent = parent;
  if (links != null) channel._links = links;
  if (state.hasName()) channel._name = state.name;
  if (state.hasDescription()) channel._description = state.description;
  if (state.hasTemporary()) channel._temporary = state.temporary;
  if (state.hasPosition()) channel._position = state.position;
  if (state.hasIsEnterRestricted())
    channel._isEnterRestricted = state.isEnterRestricted;
  if (state.hasCanEnter()) channel._canEnter = state.canEnter;
  if (state.hasDescriptionHash())
    channel._descriptionHash = new Uint8List.fromList(state.descriptionHash);
  if (state.hasMaxUsers()) channel._maxUsers = state.maxUsers;
  return new ChannelChanges._(
      parent: parent != null,
      links: links != null,
      description: state.hasDescription(),
      temporary: state.hasTemporary(),
      position: state.hasPosition(),
      descriptionHash: state.hasDescriptionHash(),
      maxUsers: state.hasMaxUsers(),
      name: state.hasName(),
      canEnter: state.hasCanEnter(),
      isEnterRestricted: state.hasIsEnterRestricted());
}

@protected
void notifyChannelUpdate(
    {required Channel channel, required ChannelChanges changes}) {
  channel._notifyChannelUpdate(changes: changes);
}

@protected
void notifyChannelRemoved({required Channel channel}) {
  channel._notifyChannelRemoved();
}

@protected
void notifyChannelPermissions(
    {required Channel channel, required Permission permissions}) {
  channel._notifyChannelPermissions(permissions: permissions);
}

class ChannelChanges with JsonString {
  final bool parent,
      links,
      name,
      description,
      temporary,
      position,
      descriptionHash,
      maxUsers,
      canEnter,
      isEnterRestricted;
  const ChannelChanges._(
      {required this.parent,
      required this.links,
      required this.description,
      required this.temporary,
      required this.position,
      required this.descriptionHash,
      required this.maxUsers,
      required this.name,
      required this.canEnter,
      required this.isEnterRestricted});

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['parent'] = parent
    ..['links'] = links
    ..['name'] = name
    ..['description'] = description
    ..['temporary'] = temporary
    ..['position'] = position
    ..['descriptionHash'] = descriptionHash
    ..['maxUsers'] = maxUsers;
}

class Channel with Notifier<ChannelListener>, JsonString {
  final MumbleClientBase _client;
  final int channelId;

  List<Channel> _links;

  int? _maxUsers;
  Channel? _parent;
  String? _name;
  String? _description;
  bool? _temporary;
  int? _position;
  Uint8List? _descriptionHash;
  bool? _isEnterRestricted;
  bool? _canEnter;

  Channel? get parent => _parent;
  String? get name => _name;
  List<Channel> get links => new List<Channel>.unmodifiable(_links);
  String? get description => _description;
  bool? get temporary => _temporary;
  int? get position => _position;
  Uint8List? get descriptionHash => _descriptionHash;
  int? get maxUsers => _maxUsers;
  bool? get canEnter => _canEnter;
  bool? get isEnterRestricted => _isEnterRestricted;

  Channel._(this.channelId, this._client) : this._links = <Channel>[];

  @override
  Map<String, Object> jsonMap({int serializeParentRecursionDepth: 0}) {
    Map<String, Object> map = new Map<String, Object>()
      ..['channelId'] = channelId;
    if (parent != null) {
      map['parent'] = ((serializeParentRecursionDepth != 0)
          ? parent!.jsonMap(
              serializeParentRecursionDepth: serializeParentRecursionDepth - 1)
          : parent!.channelId);
    }
    if (links.isNotEmpty) {
      map['links'] = links.map((Channel channel) => channel.channelId).toList();
    }
    if (name != null) {
      map['name'] = name!;
    }
    if (description != null) {
      map['description'] = description!;
    }
    if (temporary != null) {
      map['temporary'] = temporary!;
    }
    if (position != null) {
      map['position'] = position!;
    }
    if (descriptionHash != null) {
      map['descriptionHash'] = descriptionHash!;
    }
    if (maxUsers != null) {
      map['maxUsers'] = maxUsers!;
    }
    return map;
  }

  void _notifyChannelPermissions({required Permission permissions}) {
    {
      listeners.forEach((ChannelListener listener) =>
          listener.onChannelPermissionsReceived(this, permissions));
    }
  }

  void _notifyChannelUpdate({required ChannelChanges changes}) {
    listeners.forEach(
        (ChannelListener listener) => listener.onChannelChanged(this, changes));
  }

  void _notifyChannelRemoved() {
    listeners
        .forEach((ChannelListener listener) => listener.onChannelRemoved(this));
  }

  void queryPermissions() =>
      _client.writeMessage(new Proto.PermissionQuery()..channelId = channelId);

  void setChannelName({required String name}) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..name = name);

  void setChannelParent({required Channel parent}) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..parent = parent.channelId);

  void setChannelDescription({required String description}) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..description = description);

  void setChannelPosition({required int position}) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..position = position);

  void setMaxUsers({required int maxUsers}) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..maxUsers = maxUsers);

  void registerAsVoiceTarget(
          {required int id, bool recursive: false, bool followLinks: false}) =>
      _client.registerVoiceTarget(
          target: new VoiceTarget(id: id)
            ..withChannel(
                channel: this, recursive: recursive, followLinks: followLinks));

  void sendMessageToChannel({required String message, bool recursive: false}) {
    OutgoingTextMessage msg;
    if (recursive) {
      msg = new OutgoingTextMessage(message: message, trees: <Channel>[this]);
    } else {
      msg =
          new OutgoingTextMessage(message: message, channels: <Channel>[this]);
    }
    _client.sendMessage(message: msg);
  }

  void removeChannel() =>
      _client.writeMessage(new Proto.ChannelRemove()..channelId = channelId);

  void removeLinksTo(List<Channel> channels) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..linksRemove.addAll(channels.map((Channel c) => c.channelId)));

  void addLinksTo(List<Channel> channels) =>
      _client.writeMessage(new Proto.ChannelState()
        ..channelId = channelId
        ..linksAdd.addAll(channels.map((Channel c) => c.channelId)));
}
