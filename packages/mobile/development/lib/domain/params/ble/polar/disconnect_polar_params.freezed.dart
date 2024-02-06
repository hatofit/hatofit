// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disconnect_polar_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DisconnectPolarParams {
  String get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisconnectPolarParamsCopyWith<DisconnectPolarParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisconnectPolarParamsCopyWith<$Res> {
  factory $DisconnectPolarParamsCopyWith(DisconnectPolarParams value,
          $Res Function(DisconnectPolarParams) then) =
      _$DisconnectPolarParamsCopyWithImpl<$Res, DisconnectPolarParams>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class _$DisconnectPolarParamsCopyWithImpl<$Res,
        $Val extends DisconnectPolarParams>
    implements $DisconnectPolarParamsCopyWith<$Res> {
  _$DisconnectPolarParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisconnectPolarParamsImplCopyWith<$Res>
    implements $DisconnectPolarParamsCopyWith<$Res> {
  factory _$$DisconnectPolarParamsImplCopyWith(
          _$DisconnectPolarParamsImpl value,
          $Res Function(_$DisconnectPolarParamsImpl) then) =
      __$$DisconnectPolarParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$DisconnectPolarParamsImplCopyWithImpl<$Res>
    extends _$DisconnectPolarParamsCopyWithImpl<$Res,
        _$DisconnectPolarParamsImpl>
    implements _$$DisconnectPolarParamsImplCopyWith<$Res> {
  __$$DisconnectPolarParamsImplCopyWithImpl(_$DisconnectPolarParamsImpl _value,
      $Res Function(_$DisconnectPolarParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$DisconnectPolarParamsImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DisconnectPolarParamsImpl implements _DisconnectPolarParams {
  const _$DisconnectPolarParamsImpl({required this.deviceId});

  @override
  final String deviceId;

  @override
  String toString() {
    return 'DisconnectPolarParams(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectPolarParamsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectPolarParamsImplCopyWith<_$DisconnectPolarParamsImpl>
      get copyWith => __$$DisconnectPolarParamsImplCopyWithImpl<
          _$DisconnectPolarParamsImpl>(this, _$identity);
}

abstract class _DisconnectPolarParams implements DisconnectPolarParams {
  const factory _DisconnectPolarParams({required final String deviceId}) =
      _$DisconnectPolarParamsImpl;

  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectPolarParamsImplCopyWith<_$DisconnectPolarParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
