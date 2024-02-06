// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_polar_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectPolarParams {
  String get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectPolarParamsCopyWith<ConnectPolarParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectPolarParamsCopyWith<$Res> {
  factory $ConnectPolarParamsCopyWith(
          ConnectPolarParams value, $Res Function(ConnectPolarParams) then) =
      _$ConnectPolarParamsCopyWithImpl<$Res, ConnectPolarParams>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class _$ConnectPolarParamsCopyWithImpl<$Res, $Val extends ConnectPolarParams>
    implements $ConnectPolarParamsCopyWith<$Res> {
  _$ConnectPolarParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$ConnectPolarParamsImplCopyWith<$Res>
    implements $ConnectPolarParamsCopyWith<$Res> {
  factory _$$ConnectPolarParamsImplCopyWith(_$ConnectPolarParamsImpl value,
          $Res Function(_$ConnectPolarParamsImpl) then) =
      __$$ConnectPolarParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$ConnectPolarParamsImplCopyWithImpl<$Res>
    extends _$ConnectPolarParamsCopyWithImpl<$Res, _$ConnectPolarParamsImpl>
    implements _$$ConnectPolarParamsImplCopyWith<$Res> {
  __$$ConnectPolarParamsImplCopyWithImpl(_$ConnectPolarParamsImpl _value,
      $Res Function(_$ConnectPolarParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$ConnectPolarParamsImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectPolarParamsImpl implements _ConnectPolarParams {
  const _$ConnectPolarParamsImpl({required this.deviceId});

  @override
  final String deviceId;

  @override
  String toString() {
    return 'ConnectPolarParams(deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectPolarParamsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectPolarParamsImplCopyWith<_$ConnectPolarParamsImpl> get copyWith =>
      __$$ConnectPolarParamsImplCopyWithImpl<_$ConnectPolarParamsImpl>(
          this, _$identity);
}

abstract class _ConnectPolarParams implements ConnectPolarParams {
  const factory _ConnectPolarParams({required final String deviceId}) =
      _$ConnectPolarParamsImpl;

  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$ConnectPolarParamsImplCopyWith<_$ConnectPolarParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
