// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_polar_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StreamPolarParams {
  String get deviceId => throw _privateConstructorUsedError;
  Set<PolarDataType> get types => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreamPolarParamsCopyWith<StreamPolarParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamPolarParamsCopyWith<$Res> {
  factory $StreamPolarParamsCopyWith(
          StreamPolarParams value, $Res Function(StreamPolarParams) then) =
      _$StreamPolarParamsCopyWithImpl<$Res, StreamPolarParams>;
  @useResult
  $Res call({String deviceId, Set<PolarDataType> types});
}

/// @nodoc
class _$StreamPolarParamsCopyWithImpl<$Res, $Val extends StreamPolarParams>
    implements $StreamPolarParamsCopyWith<$Res> {
  _$StreamPolarParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamPolarParamsImplCopyWith<$Res>
    implements $StreamPolarParamsCopyWith<$Res> {
  factory _$$StreamPolarParamsImplCopyWith(_$StreamPolarParamsImpl value,
          $Res Function(_$StreamPolarParamsImpl) then) =
      __$$StreamPolarParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, Set<PolarDataType> types});
}

/// @nodoc
class __$$StreamPolarParamsImplCopyWithImpl<$Res>
    extends _$StreamPolarParamsCopyWithImpl<$Res, _$StreamPolarParamsImpl>
    implements _$$StreamPolarParamsImplCopyWith<$Res> {
  __$$StreamPolarParamsImplCopyWithImpl(_$StreamPolarParamsImpl _value,
      $Res Function(_$StreamPolarParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? types = null,
  }) {
    return _then(_$StreamPolarParamsImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>,
    ));
  }
}

/// @nodoc

class _$StreamPolarParamsImpl implements _StreamPolarParams {
  const _$StreamPolarParamsImpl(
      {required this.deviceId, final Set<PolarDataType> types = const {}})
      : _types = types;

  @override
  final String deviceId;
  final Set<PolarDataType> _types;
  @override
  @JsonKey()
  Set<PolarDataType> get types {
    if (_types is EqualUnmodifiableSetView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_types);
  }

  @override
  String toString() {
    return 'StreamPolarParams(deviceId: $deviceId, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamPolarParamsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamPolarParamsImplCopyWith<_$StreamPolarParamsImpl> get copyWith =>
      __$$StreamPolarParamsImplCopyWithImpl<_$StreamPolarParamsImpl>(
          this, _$identity);
}

abstract class _StreamPolarParams implements StreamPolarParams {
  const factory _StreamPolarParams(
      {required final String deviceId,
      final Set<PolarDataType> types}) = _$StreamPolarParamsImpl;

  @override
  String get deviceId;
  @override
  Set<PolarDataType> get types;
  @override
  @JsonKey(ignore: true)
  _$$StreamPolarParamsImplCopyWith<_$StreamPolarParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
