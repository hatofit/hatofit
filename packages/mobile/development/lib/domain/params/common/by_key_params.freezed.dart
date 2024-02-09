// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'by_key_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ByKeyParams _$ByKeyParamsFromJson(Map<String, dynamic> json) {
  return _ByKeyParams.fromJson(json);
}

/// @nodoc
mixin _$ByKeyParams {
  int get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ByKeyParamsCopyWith<ByKeyParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ByKeyParamsCopyWith<$Res> {
  factory $ByKeyParamsCopyWith(
          ByKeyParams value, $Res Function(ByKeyParams) then) =
      _$ByKeyParamsCopyWithImpl<$Res, ByKeyParams>;
  @useResult
  $Res call({int key});
}

/// @nodoc
class _$ByKeyParamsCopyWithImpl<$Res, $Val extends ByKeyParams>
    implements $ByKeyParamsCopyWith<$Res> {
  _$ByKeyParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ByKeyParamsImplCopyWith<$Res>
    implements $ByKeyParamsCopyWith<$Res> {
  factory _$$ByKeyParamsImplCopyWith(
          _$ByKeyParamsImpl value, $Res Function(_$ByKeyParamsImpl) then) =
      __$$ByKeyParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int key});
}

/// @nodoc
class __$$ByKeyParamsImplCopyWithImpl<$Res>
    extends _$ByKeyParamsCopyWithImpl<$Res, _$ByKeyParamsImpl>
    implements _$$ByKeyParamsImplCopyWith<$Res> {
  __$$ByKeyParamsImplCopyWithImpl(
      _$ByKeyParamsImpl _value, $Res Function(_$ByKeyParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$ByKeyParamsImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ByKeyParamsImpl implements _ByKeyParams {
  const _$ByKeyParamsImpl({this.key = 0});

  factory _$ByKeyParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ByKeyParamsImplFromJson(json);

  @override
  @JsonKey()
  final int key;

  @override
  String toString() {
    return 'ByKeyParams(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByKeyParamsImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ByKeyParamsImplCopyWith<_$ByKeyParamsImpl> get copyWith =>
      __$$ByKeyParamsImplCopyWithImpl<_$ByKeyParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ByKeyParamsImplToJson(
      this,
    );
  }
}

abstract class _ByKeyParams implements ByKeyParams {
  const factory _ByKeyParams({final int key}) = _$ByKeyParamsImpl;

  factory _ByKeyParams.fromJson(Map<String, dynamic> json) =
      _$ByKeyParamsImpl.fromJson;

  @override
  int get key;
  @override
  @JsonKey(ignore: true)
  _$$ByKeyParamsImplCopyWith<_$ByKeyParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
