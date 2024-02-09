// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_mtu_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestMtuCommonParams {
  BluetoothDevice get device => throw _privateConstructorUsedError;
  int get mtu => throw _privateConstructorUsedError;
  double get predelay => throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestMtuCommonParamsCopyWith<RequestMtuCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestMtuCommonParamsCopyWith<$Res> {
  factory $RequestMtuCommonParamsCopyWith(RequestMtuCommonParams value,
          $Res Function(RequestMtuCommonParams) then) =
      _$RequestMtuCommonParamsCopyWithImpl<$Res, RequestMtuCommonParams>;
  @useResult
  $Res call({BluetoothDevice device, int mtu, double predelay, int timeout});
}

/// @nodoc
class _$RequestMtuCommonParamsCopyWithImpl<$Res,
        $Val extends RequestMtuCommonParams>
    implements $RequestMtuCommonParamsCopyWith<$Res> {
  _$RequestMtuCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? mtu = null,
    Object? predelay = null,
    Object? timeout = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      mtu: null == mtu
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      predelay: null == predelay
          ? _value.predelay
          : predelay // ignore: cast_nullable_to_non_nullable
              as double,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestMtuCommonParamsImplCopyWith<$Res>
    implements $RequestMtuCommonParamsCopyWith<$Res> {
  factory _$$RequestMtuCommonParamsImplCopyWith(
          _$RequestMtuCommonParamsImpl value,
          $Res Function(_$RequestMtuCommonParamsImpl) then) =
      __$$RequestMtuCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothDevice device, int mtu, double predelay, int timeout});
}

/// @nodoc
class __$$RequestMtuCommonParamsImplCopyWithImpl<$Res>
    extends _$RequestMtuCommonParamsCopyWithImpl<$Res,
        _$RequestMtuCommonParamsImpl>
    implements _$$RequestMtuCommonParamsImplCopyWith<$Res> {
  __$$RequestMtuCommonParamsImplCopyWithImpl(
      _$RequestMtuCommonParamsImpl _value,
      $Res Function(_$RequestMtuCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? mtu = null,
    Object? predelay = null,
    Object? timeout = null,
  }) {
    return _then(_$RequestMtuCommonParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      mtu: null == mtu
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      predelay: null == predelay
          ? _value.predelay
          : predelay // ignore: cast_nullable_to_non_nullable
              as double,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestMtuCommonParamsImpl implements _RequestMtuCommonParams {
  const _$RequestMtuCommonParamsImpl(
      {required this.device,
      required this.mtu,
      this.predelay = 0.35,
      this.timeout = 15});

  @override
  final BluetoothDevice device;
  @override
  final int mtu;
  @override
  @JsonKey()
  final double predelay;
  @override
  @JsonKey()
  final int timeout;

  @override
  String toString() {
    return 'RequestMtuCommonParams(device: $device, mtu: $mtu, predelay: $predelay, timeout: $timeout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestMtuCommonParamsImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.mtu, mtu) || other.mtu == mtu) &&
            (identical(other.predelay, predelay) ||
                other.predelay == predelay) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, mtu, predelay, timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestMtuCommonParamsImplCopyWith<_$RequestMtuCommonParamsImpl>
      get copyWith => __$$RequestMtuCommonParamsImplCopyWithImpl<
          _$RequestMtuCommonParamsImpl>(this, _$identity);
}

abstract class _RequestMtuCommonParams implements RequestMtuCommonParams {
  const factory _RequestMtuCommonParams(
      {required final BluetoothDevice device,
      required final int mtu,
      final double predelay,
      final int timeout}) = _$RequestMtuCommonParamsImpl;

  @override
  BluetoothDevice get device;
  @override
  int get mtu;
  @override
  double get predelay;
  @override
  int get timeout;
  @override
  @JsonKey(ignore: true)
  _$$RequestMtuCommonParamsImplCopyWith<_$RequestMtuCommonParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
