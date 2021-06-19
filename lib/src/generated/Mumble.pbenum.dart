///
//  Generated code. Do not modify.
//  source: Mumble.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Reject_RejectType extends $pb.ProtobufEnum {
  static const Reject_RejectType None = Reject_RejectType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'None');
  static const Reject_RejectType WrongVersion = Reject_RejectType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WrongVersion');
  static const Reject_RejectType InvalidUsername = Reject_RejectType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'InvalidUsername');
  static const Reject_RejectType WrongUserPW = Reject_RejectType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WrongUserPW');
  static const Reject_RejectType WrongServerPW = Reject_RejectType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WrongServerPW');
  static const Reject_RejectType UsernameInUse = Reject_RejectType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UsernameInUse');
  static const Reject_RejectType ServerFull = Reject_RejectType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ServerFull');
  static const Reject_RejectType NoCertificate = Reject_RejectType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NoCertificate');
  static const Reject_RejectType AuthenticatorFail = Reject_RejectType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AuthenticatorFail');
  static const Reject_RejectType UsernameCertMissmatch = Reject_RejectType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UsernameCertMissmatch');

  static const $core.List<Reject_RejectType> values = <Reject_RejectType> [
    None,
    WrongVersion,
    InvalidUsername,
    WrongUserPW,
    WrongServerPW,
    UsernameInUse,
    ServerFull,
    NoCertificate,
    AuthenticatorFail,
    UsernameCertMissmatch,
  ];

  static final $core.Map<$core.int, Reject_RejectType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Reject_RejectType? valueOf($core.int value) => _byValue[value];

  const Reject_RejectType._($core.int v, $core.String n) : super(v, n);
}

class PermissionDenied_DenyType extends $pb.ProtobufEnum {
  static const PermissionDenied_DenyType Text = PermissionDenied_DenyType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Text');
  static const PermissionDenied_DenyType Permission = PermissionDenied_DenyType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Permission');
  static const PermissionDenied_DenyType SuperUser = PermissionDenied_DenyType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SuperUser');
  static const PermissionDenied_DenyType ChannelName = PermissionDenied_DenyType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ChannelName');
  static const PermissionDenied_DenyType TextTooLong = PermissionDenied_DenyType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TextTooLong');
  static const PermissionDenied_DenyType H9K = PermissionDenied_DenyType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'H9K');
  static const PermissionDenied_DenyType TemporaryChannel = PermissionDenied_DenyType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TemporaryChannel');
  static const PermissionDenied_DenyType MissingCertificate = PermissionDenied_DenyType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MissingCertificate');
  static const PermissionDenied_DenyType UserName = PermissionDenied_DenyType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UserName');
  static const PermissionDenied_DenyType ChannelFull = PermissionDenied_DenyType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ChannelFull');
  static const PermissionDenied_DenyType NestingLimit = PermissionDenied_DenyType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NestingLimit');
  static const PermissionDenied_DenyType ChannelCountLimit = PermissionDenied_DenyType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ChannelCountLimit');
  static const PermissionDenied_DenyType ChannelListenerLimit = PermissionDenied_DenyType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ChannelListenerLimit');
  static const PermissionDenied_DenyType UserListenerLimit = PermissionDenied_DenyType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UserListenerLimit');

  static const $core.List<PermissionDenied_DenyType> values = <PermissionDenied_DenyType> [
    Text,
    Permission,
    SuperUser,
    ChannelName,
    TextTooLong,
    H9K,
    TemporaryChannel,
    MissingCertificate,
    UserName,
    ChannelFull,
    NestingLimit,
    ChannelCountLimit,
    ChannelListenerLimit,
    UserListenerLimit,
  ];

  static final $core.Map<$core.int, PermissionDenied_DenyType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PermissionDenied_DenyType? valueOf($core.int value) => _byValue[value];

  const PermissionDenied_DenyType._($core.int v, $core.String n) : super(v, n);
}

class ContextActionModify_Context extends $pb.ProtobufEnum {
  static const ContextActionModify_Context Server = ContextActionModify_Context._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Server');
  static const ContextActionModify_Context Channel = ContextActionModify_Context._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Channel');
  static const ContextActionModify_Context User = ContextActionModify_Context._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'User');

  static const $core.List<ContextActionModify_Context> values = <ContextActionModify_Context> [
    Server,
    Channel,
    User,
  ];

  static final $core.Map<$core.int, ContextActionModify_Context> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextActionModify_Context? valueOf($core.int value) => _byValue[value];

  const ContextActionModify_Context._($core.int v, $core.String n) : super(v, n);
}

class ContextActionModify_Operation extends $pb.ProtobufEnum {
  static const ContextActionModify_Operation Add = ContextActionModify_Operation._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Add');
  static const ContextActionModify_Operation Remove = ContextActionModify_Operation._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Remove');

  static const $core.List<ContextActionModify_Operation> values = <ContextActionModify_Operation> [
    Add,
    Remove,
  ];

  static final $core.Map<$core.int, ContextActionModify_Operation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextActionModify_Operation? valueOf($core.int value) => _byValue[value];

  const ContextActionModify_Operation._($core.int v, $core.String n) : super(v, n);
}

