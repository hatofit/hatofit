// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_exercise_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetExerciseParams _$GetExerciseParamsFromJson(Map<String, dynamic> json) {
  return _GetExerciseParams.fromJson(json);
}

/// @nodoc
mixin _$GetExerciseParams {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetExerciseParamsCopyWith<GetExerciseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExerciseParamsCopyWith<$Res> {
  factory $GetExerciseParamsCopyWith(
          GetExerciseParams value, $Res Function(GetExerciseParams) then) =
      _$GetExerciseParamsCopyWithImpl<$Res, GetExerciseParams>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetExerciseParamsCopyWithImpl<$Res, $Val extends GetExerciseParams>
    implements $GetExerciseParamsCopyWith<$Res> {
  _$GetExerciseParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$GetExerciseParamsImplCopyWith<$Res>
    implements $GetExerciseParamsCopyWith<$Res> {
  factory _$$GetExerciseParamsImplCopyWith(_$GetExerciseParamsImpl value,
          $Res Function(_$GetExerciseParamsImpl) then) =
      __$$GetExerciseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$GetExerciseParamsImplCopyWithImpl<$Res>
    extends _$GetExerciseParamsCopyWithImpl<$Res, _$GetExerciseParamsImpl>
    implements _$$GetExerciseParamsImplCopyWith<$Res> {
  __$$GetExerciseParamsImplCopyWithImpl(_$GetExerciseParamsImpl _value,
      $Res Function(_$GetExerciseParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetExerciseParamsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetExerciseParamsImpl implements _GetExerciseParams {
  const _$GetExerciseParamsImpl({this.id = ""});

  factory _$GetExerciseParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetExerciseParamsImplFromJson(json);

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'GetExerciseParams(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExerciseParamsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExerciseParamsImplCopyWith<_$GetExerciseParamsImpl> get copyWith =>
      __$$GetExerciseParamsImplCopyWithImpl<_$GetExerciseParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetExerciseParamsImplToJson(
      this,
    );
  }
}

abstract class _GetExerciseParams implements GetExerciseParams {
  const factory _GetExerciseParams({final String id}) = _$GetExerciseParamsImpl;

  factory _GetExerciseParams.fromJson(Map<String, dynamic> json) =
      _$GetExerciseParamsImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$GetExerciseParamsImplCopyWith<_$GetExerciseParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
