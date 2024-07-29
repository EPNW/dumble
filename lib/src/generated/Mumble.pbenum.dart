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

import 'package:protobuf/protobuf.dart' as $pb;

class Reject_RejectType extends $pb.ProtobufEnum {
  static const Reject_RejectType None = Reject_RejectType._(0, _omitEnumNames ? '' : 'None');
  static const Reject_RejectType WrongVersion = Reject_RejectType._(1, _omitEnumNames ? '' : 'WrongVersion');
  static const Reject_RejectType InvalidUsername = Reject_RejectType._(2, _omitEnumNames ? '' : 'InvalidUsername');
  static const Reject_RejectType WrongUserPW = Reject_RejectType._(3, _omitEnumNames ? '' : 'WrongUserPW');
  static const Reject_RejectType WrongServerPW = Reject_RejectType._(4, _omitEnumNames ? '' : 'WrongServerPW');
  static const Reject_RejectType UsernameInUse = Reject_RejectType._(5, _omitEnumNames ? '' : 'UsernameInUse');
  static const Reject_RejectType ServerFull = Reject_RejectType._(6, _omitEnumNames ? '' : 'ServerFull');
  static const Reject_RejectType NoCertificate = Reject_RejectType._(7, _omitEnumNames ? '' : 'NoCertificate');
  static const Reject_RejectType AuthenticatorFail = Reject_RejectType._(8, _omitEnumNames ? '' : 'AuthenticatorFail');
  static const Reject_RejectType UsernameCertMissmatch = Reject_RejectType._(9, _omitEnumNames ? '' : 'UsernameCertMissmatch');

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
  static const PermissionDenied_DenyType Text = PermissionDenied_DenyType._(0, _omitEnumNames ? '' : 'Text');
  static const PermissionDenied_DenyType Permission = PermissionDenied_DenyType._(1, _omitEnumNames ? '' : 'Permission');
  static const PermissionDenied_DenyType SuperUser = PermissionDenied_DenyType._(2, _omitEnumNames ? '' : 'SuperUser');
  static const PermissionDenied_DenyType ChannelName = PermissionDenied_DenyType._(3, _omitEnumNames ? '' : 'ChannelName');
  static const PermissionDenied_DenyType TextTooLong = PermissionDenied_DenyType._(4, _omitEnumNames ? '' : 'TextTooLong');
  static const PermissionDenied_DenyType H9K = PermissionDenied_DenyType._(5, _omitEnumNames ? '' : 'H9K');
  static const PermissionDenied_DenyType TemporaryChannel = PermissionDenied_DenyType._(6, _omitEnumNames ? '' : 'TemporaryChannel');
  static const PermissionDenied_DenyType MissingCertificate = PermissionDenied_DenyType._(7, _omitEnumNames ? '' : 'MissingCertificate');
  static const PermissionDenied_DenyType UserName = PermissionDenied_DenyType._(8, _omitEnumNames ? '' : 'UserName');
  static const PermissionDenied_DenyType ChannelFull = PermissionDenied_DenyType._(9, _omitEnumNames ? '' : 'ChannelFull');
  static const PermissionDenied_DenyType NestingLimit = PermissionDenied_DenyType._(10, _omitEnumNames ? '' : 'NestingLimit');
  static const PermissionDenied_DenyType ChannelCountLimit = PermissionDenied_DenyType._(11, _omitEnumNames ? '' : 'ChannelCountLimit');
  static const PermissionDenied_DenyType ChannelListenerLimit = PermissionDenied_DenyType._(12, _omitEnumNames ? '' : 'ChannelListenerLimit');
  static const PermissionDenied_DenyType UserListenerLimit = PermissionDenied_DenyType._(13, _omitEnumNames ? '' : 'UserListenerLimit');

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
  static const ContextActionModify_Context Server = ContextActionModify_Context._(1, _omitEnumNames ? '' : 'Server');
  static const ContextActionModify_Context Channel = ContextActionModify_Context._(2, _omitEnumNames ? '' : 'Channel');
  static const ContextActionModify_Context User = ContextActionModify_Context._(4, _omitEnumNames ? '' : 'User');

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
  static const ContextActionModify_Operation Add = ContextActionModify_Operation._(0, _omitEnumNames ? '' : 'Add');
  static const ContextActionModify_Operation Remove = ContextActionModify_Operation._(1, _omitEnumNames ? '' : 'Remove');

  static const $core.List<ContextActionModify_Operation> values = <ContextActionModify_Operation> [
    Add,
    Remove,
  ];

  static final $core.Map<$core.int, ContextActionModify_Operation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextActionModify_Operation? valueOf($core.int value) => _byValue[value];

  const ContextActionModify_Operation._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
