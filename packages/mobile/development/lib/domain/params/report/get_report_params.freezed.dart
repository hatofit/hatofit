// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_report_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetReportParams _$GetReportParamsFromJson(Map<String, dynamic> json) {
  return _GetReportParams.fromJson(json);
}

/// @nodoc
mixin _$GetReportParams {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetReportParamsCopyWith<GetReportParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReportParamsCopyWith<$Res> {
  factory $GetReportParamsCopyWith(
          GetReportParams value, $Res Function(GetReportParams) then) =
      _$GetReportParamsCopyWithImpl<$Res, GetReportParams>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetReportParamsCopyWithImpl<$Res, $Val extends GetReportParams>
    implements $GetReportParamsCopyWith<$Res> {
  _$GetReportParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetReportParamsImplCopyWith<$Res>
    implements $GetReportParamsCopyWith<$Res> {
  factory _$$GetReportParamsImplCopyWith(_$GetReportParamsImpl value,
          $Res Function(_$GetReportParamsImpl) then) =
      __$$GetReportParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$GetReportParamsImplCopyWithImpl<$Res>
    extends _$GetReportParamsCopyWithImpl<$Res, _$GetReportParamsImpl>
    implements _$$GetReportParamsImplCopyWith<$Res> {
  __$$GetReportParamsImplCopyWithImpl(
      _$GetReportParamsImpl _value, $Res Function(_$GetReportParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetReportParamsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetReportParamsImpl implements _GetReportParams {
  const _$GetReportParamsImpl({this.id = ""});

  factory _$GetReportParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReportParamsImplFromJson(json);

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'GetReportParams(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReportParamsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReportParamsImplCopyWith<_$GetReportParamsImpl> get copyWith =>
      __$$GetReportParamsImplCopyWithImpl<_$GetReportParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetReportParamsImplToJson(
      this,
    );
  }
}

abstract class _GetReportParams implements GetReportParams {
  const factory _GetReportParams({final String id}) = _$GetReportParamsImpl;

  factory _GetReportParams.fromJson(Map<String, dynamic> json) =
      _$GetReportParamsImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$GetReportParamsImplCopyWith<_$GetReportParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
