// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clear_gatt_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClearGattCommonParams {
  BluetoothDevice get device => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClearGattCommonParamsCopyWith<ClearGattCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClearGattCommonParamsCopyWith<$Res> {
  factory $ClearGattCommonParamsCopyWith(ClearGattCommonParams value,
          $Res Function(ClearGattCommonParams) then) =
      _$ClearGattCommonParamsCopyWithImpl<$Res, ClearGattCommonParams>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class _$ClearGattCommonParamsCopyWithImpl<$Res,
        $Val extends ClearGattCommonParams>
    implements $ClearGattCommonParamsCopyWith<$Res> {
  _$ClearGattCommonParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$ClearGattCommonParamsImplCopyWith<$Res>
    implements $ClearGattCommonParamsCopyWith<$Res> {
  factory _$$ClearGattCommonParamsImplCopyWith(
          _$ClearGattCommonParamsImpl value,
          $Res Function(_$ClearGattCommonParamsImpl) then) =
      __$$ClearGattCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$ClearGattCommonParamsImplCopyWithImpl<$Res>
    extends _$ClearGattCommonParamsCopyWithImpl<$Res,
        _$ClearGattCommonParamsImpl>
    implements _$$ClearGattCommonParamsImplCopyWith<$Res> {
  __$$ClearGattCommonParamsImplCopyWithImpl(_$ClearGattCommonParamsImpl _value,
      $Res Function(_$ClearGattCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$ClearGattCommonParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
    ));
  }
}

/// @nodoc

class _$ClearGattCommonParamsImpl implements _ClearGattCommonParams {
  const _$ClearGattCommonParamsImpl({required this.device});

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'ClearGattCommonParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearGattCommonParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearGattCommonParamsImplCopyWith<_$ClearGattCommonParamsImpl>
      get copyWith => __$$ClearGattCommonParamsImplCopyWithImpl<
          _$ClearGattCommonParamsImpl>(this, _$identity);
}

abstract class _ClearGattCommonParams implements ClearGattCommonParams {
  const factory _ClearGattCommonParams(
      {required final BluetoothDevice device}) = _$ClearGattCommonParamsImpl;

  @override
  BluetoothDevice get device;
  @override
  @JsonKey(ignore: true)
  _$$ClearGattCommonParamsImplCopyWith<_$ClearGattCommonParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
