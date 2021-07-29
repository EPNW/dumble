import 'package:meta/meta.dart';
import 'permission.dart';

import '../generated/Mumble.pb.dart' as Proto;
import '../exceptions.dart';

enum RejectType {
  /// The rejection reason is unknown (details should be available in Reject.reason).
  none,

  /// The client attempted to connect with an incompatible version.
  wrongVersion,

  /// The user name supplied by the client was invalid.
  invalidUsername,

  /// The client attempted to authenticate as a user with a password but it was wrong.
  wrongUserPassword,

  /// The client attempted to connect to a passworded server but the password was wrong.
  wrongServerPassword,

  /// Supplied username is already in use.
  usernameInUse,

  /// Server is currently full and cannot accept more users.
  serverFull,

  /// The user did not provide a certificate but one is required.
  noCertificate,

  authenticatorFail,

  usernameCertMissmatch
}

@protected
RejectException rejectExceptionFromProto(Proto.Reject reject) {
  if (reject.hasType()) {
    return new RejectException._(
        reason: reject.reason,
        rejectType: RejectType.values[reject.type.value]);
  } else {
    throw new ProtocolException('Expected value type not set!');
  }
}

class RejectException implements Exception {
  final String? reason;
  final RejectType rejectType;
  const RejectException._({this.reason, required this.rejectType});

  @override
  String toString() {
    String string = 'RejectException ($rejectType)';
    if (reason != null) {
      string = string + ': $reason';
    }
    return string;
  }
}

enum DenyType {
  /// Operation denied for other reason, see reason field.
  text,

  /// Permissions were denied.
  permission,

  /// Cannot modify SuperUser.
  superUser,

  /// Invalid channel name.
  channelName,

  /// Text message too long.
  textTooLong,

  /// The flux capacitor was spelled wrong.
  h9K,

  /// Operation not permitted in temporary channel.
  temporaryChannel,

  /// Operation requires certificate.
  missingCertificate,

  /// Invalid username.
  userName,

  /// Channel is full.
  channelFull,

  /// Channels are nested too deeply.
  nestingLimit,

  /// Maximum channel count reached.
  channelCountLimit,

  /// Amount of listener objects for this channel has been reached
  channelListenerLimit,

  /// Amount of listener proxies for the user has been reached
  userListenerLimit
}

PermissionDeniedException permissionDeniedExceptionFromProto(
    Proto.PermissionDenied denied) {
  if (!denied.hasType()) {
    throw new ProtocolException('Expected field type not set!');
  }
  return new PermissionDeniedException._(
      denyType: DenyType.values[denied.type.value],
      deniedPermission: denied.hasPermission()
          ? new Permission.fromInt(denied.permission)
          : null,
      invalidUserName: denied.hasName() ? denied.name : null,
      reason: denied.hasReason() ? denied.reason : null,
      channel: denied.hasChannelId() ? denied.channelId : null,
      user: denied.hasSession() ? denied.session : null);
}

class PermissionDeniedException implements Exception {
  final DenyType denyType;
  final Permission? deniedPermission;
  final int? channel;
  final int? user;
  final String? reason;
  final String? invalidUserName;

  const PermissionDeniedException._(
      {required this.denyType,
      this.deniedPermission,
      required this.channel,
      this.user,
      this.reason,
      this.invalidUserName});

  @override
  String toString() {
    String string =
        'PermissionDeniedException for user session $user with reason $denyType';
    switch (denyType) {
      case DenyType.permission:
        string =
            '$string in channel with id $channel and denied permission $deniedPermission';
        break;
      case DenyType.userName:
        string = '$string; tried using name $invalidUserName';
        break;
      default:
        break;
    }
    if (reason != null && reason!.isNotEmpty) {
      string = '$string\r\nReason: $reason';
    }
    return string;
  }
}
