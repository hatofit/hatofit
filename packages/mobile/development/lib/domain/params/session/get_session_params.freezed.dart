// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_session_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSessionParams _$GetSessionParamsFromJson(Map<String, dynamic> json) {
  return _GetSessionParams.fromJson(json);
}

/// @nodoc
mixin _$GetSessionParams {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSessionParamsCopyWith<GetSessionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSessionParamsCopyWith<$Res> {
  factory $GetSessionParamsCopyWith(
          GetSessionParams value, $Res Function(GetSessionParams) then) =
      _$GetSessionParamsCopyWithImpl<$Res, GetSessionParams>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetSessionParamsCopyWithImpl<$Res, $Val extends GetSessionParams>
    implements $GetSessionParamsCopyWith<$Res> {
  _$GetSessionParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$GetSessionParamsImplCopyWith<$Res>
    implements $GetSessionParamsCopyWith<$Res> {
  factory _$$GetSessionParamsImplCopyWith(_$GetSessionParamsImpl value,
          $Res Function(_$GetSessionParamsImpl) then) =
      __$$GetSessionParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$GetSessionParamsImplCopyWithImpl<$Res>
    extends _$GetSessionParamsCopyWithImpl<$Res, _$GetSessionParamsImpl>
    implements _$$GetSessionParamsImplCopyWith<$Res> {
  __$$GetSessionParamsImplCopyWithImpl(_$GetSessionParamsImpl _value,
      $Res Function(_$GetSessionParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetSessionParamsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSessionParamsImpl implements _GetSessionParams {
  const _$GetSessionParamsImpl({this.id = ""});

  factory _$GetSessionParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSessionParamsImplFromJson(json);

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'GetSessionParams(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSessionParamsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSessionParamsImplCopyWith<_$GetSessionParamsImpl> get copyWith =>
      __$$GetSessionParamsImplCopyWithImpl<_$GetSessionParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSessionParamsImplToJson(
      this,
    );
  }
}

abstract class _GetSessionParams implements GetSessionParams {
  const factory _GetSessionParams({final String id}) = _$GetSessionParamsImpl;

  factory _GetSessionParams.fromJson(Map<String, dynamic> json) =
      _$GetSessionParamsImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$GetSessionParamsImplCopyWith<_$GetSessionParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
