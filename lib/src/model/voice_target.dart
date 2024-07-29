import 'package:meta/meta.dart';
import '../generated/Mumble.pb.dart' as Proto;

import '../utils/utils.dart' show JsonString;
import 'user.dart';
import 'channel.dart';

class VoiceTarget with JsonString {
  final List<User> _users;
  final List<Channel> _channels;
  final List<bool> _channelLinks;
  final List<bool> _channelRecursive;
  final List<String> _aclGroups;
  final int id;

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>();
    map['users'] = _users.map((User user) => user.session);
    map['aclGroups'] = _aclGroups;
    map['id'] = id;
    List<Map<String, Object>> channels = <Map<String, Object>>[];
    for (int i = 0; i < _channels.length; i++) {
      Map<String, Object> channel = new Map<String, Object>();
      channel['channelId'] = _channels[i].channelId;
      channel['followLinks'] = _channelLinks[i];
      channel['recursive'] = _channelRecursive[i];
      channels.add(channel);
    }
    map['channels'] = channels;
    return map;
  }

  VoiceTarget({required int id})
      : this.id = _assertInRange(id),
        this._users = <User>[],
        this._channels = <Channel>[],
        this._channelLinks = <bool>[],
        this._channelRecursive = <bool>[],
        this._aclGroups = <String>[];

  void withUser({required User user}) {
    _users.add(user);
  }

  void withChannel(
      {required Channel channel,
      bool followLinks = false,
      bool recursive = false}) {
    _channels.add(channel);
    _channelLinks.add(followLinks);
    _channelRecursive.add(recursive);
  }

  void withAclGroup({required String aclGroup}) {
    _aclGroups.add(aclGroup);
  }

  static int _assertInRange(int id) {
    if (id < 1 || id > 30) {
      throw new RangeError.range(id, 1, 30);
    } else {
      return id;
    }
  }
}

@protected
Proto.VoiceTarget serializeVoiceTarget(VoiceTarget voiceTarget) {
  Proto.VoiceTarget target = new Proto.VoiceTarget();
  target.id = voiceTarget.id;
  target.targets.add(new Proto.VoiceTarget_Target()
    ..session.addAll(voiceTarget._users.map((User u) => u.session)));
  for (int i = 0; i < voiceTarget._channels.length; i++) {
    target.targets.add(new Proto.VoiceTarget_Target()
      ..channelId = voiceTarget._channels[i].channelId
      ..children = voiceTarget._channelLinks[i]
      ..children = voiceTarget._channelRecursive[i]);
  }
  for (String aclGroup in voiceTarget._aclGroups) {
    target.targets.add(new Proto.VoiceTarget_Target()..group = aclGroup);
  }
  return target;
}
