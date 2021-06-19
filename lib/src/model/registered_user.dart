import '../generated/Mumble.pb.dart' as Proto;
import 'channel.dart';
import '../utils.dart' show JsonString;
import 'package:meta/meta.dart';

@protected
RegisteredUser registeredUserFromProto(
    Proto.UserList_User user, Channel? channel) {
  if (user.hasUserId()) {
    return new RegisteredUser._(
        userId: user.userId,
        name: user.hasName() ? user.name : null,
        lastSeen: user.hasLastSeen() && user.lastSeen.isNotEmpty
            ? DateTime.parse(user.lastSeen)
            : null,
        lastChannel: channel);
  } else {
    throw new ArgumentError('Required field userId not set in proto message!');
  }
}

class RegisteredUser with JsonString {
  final int userId;
  final String? name;
  final DateTime? lastSeen;
  final Channel? lastChannel;

  const RegisteredUser._(
      {required this.userId, this.name, this.lastSeen, this.lastChannel});

  @override
  Map<String, Object> jsonMap({bool serializeChannel: false}) {
    Map<String, Object> map = new Map<String, Object>()..['userId'] = userId;
    if (name != null) {
      map['name'] = name!;
    }
    if (lastSeen != null) {
      map['lastSeen'] = lastSeen!.toIso8601String();
    }
    if (lastChannel != null) {
      map['channel'] =
          (serializeChannel ? lastChannel!.jsonMap() : lastChannel!.channelId);
    }
    return map;
  }
}
