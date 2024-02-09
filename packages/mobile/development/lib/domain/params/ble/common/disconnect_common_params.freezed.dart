// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disconnect_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DisconnectCommonParams {
  BluetoothDevice get device => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisconnectCommonParamsCopyWith<DisconnectCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisconnectCommonParamsCopyWith<$Res> {
  factory $DisconnectCommonParamsCopyWith(DisconnectCommonParams value,
          $Res Function(DisconnectCommonParams) then) =
      _$DisconnectCommonParamsCopyWithImpl<$Res, DisconnectCommonParams>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class _$DisconnectCommonParamsCopyWithImpl<$Res,
        $Val extends DisconnectCommonParams>
    implements $DisconnectCommonParamsCopyWith<$Res> {
  _$DisconnectCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisconnectCommonParamsImplCopyWith<$Res>
    implements $DisconnectCommonParamsCopyWith<$Res> {
  factory _$$DisconnectCommonParamsImplCopyWith(
          _$DisconnectCommonParamsImpl value,
          $Res Function(_$DisconnectCommonParamsImpl) then) =
      __$$DisconnectCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$DisconnectCommonParamsImplCopyWithImpl<$Res>
    extends _$DisconnectCommonParamsCopyWithImpl<$Res,
        _$DisconnectCommonParamsImpl>
    implements _$$DisconnectCommonParamsImplCopyWith<$Res> {
  __$$DisconnectCommonParamsImplCopyWithImpl(
      _$DisconnectCommonParamsImpl _value,
      $Res Function(_$DisconnectCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$DisconnectCommonParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
    ));
  }
}

/// @nodoc

class _$DisconnectCommonParamsImpl implements _DisconnectCommonParams {
  const _$DisconnectCommonParamsImpl({required this.device});

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'DisconnectCommonParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectCommonParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectCommonParamsImplCopyWith<_$DisconnectCommonParamsImpl>
      get copyWith => __$$DisconnectCommonParamsImplCopyWithImpl<
          _$DisconnectCommonParamsImpl>(this, _$identity);
}

abstract class _DisconnectCommonParams implements DisconnectCommonParams {
  const factory _DisconnectCommonParams(
      {required final BluetoothDevice device}) = _$DisconnectCommonParamsImpl;

  @override
  BluetoothDevice get device;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectCommonParamsImplCopyWith<_$DisconnectCommonParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
