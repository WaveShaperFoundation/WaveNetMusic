//
//  Generated code. Do not modify.
//  source: wavenet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ActionResponse_Status extends $pb.ProtobufEnum {
  static const ActionResponse_Status OK = ActionResponse_Status._(0, _omitEnumNames ? '' : 'OK');
  static const ActionResponse_Status ERROR = ActionResponse_Status._(1, _omitEnumNames ? '' : 'ERROR');

  static const $core.List<ActionResponse_Status> values = <ActionResponse_Status> [
    OK,
    ERROR,
  ];

  static final $core.Map<$core.int, ActionResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ActionResponse_Status? valueOf($core.int value) => _byValue[value];

  const ActionResponse_Status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
