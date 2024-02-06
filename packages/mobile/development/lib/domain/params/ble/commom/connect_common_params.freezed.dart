// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectCommonParams {
  BluetoothDevice get device => throw _privateConstructorUsedError;
  Duration get timeout => throw _privateConstructorUsedError;
  int get mtu => throw _privateConstructorUsedError;
  bool get autoConnect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectCommonParamsCopyWith<ConnectCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectCommonParamsCopyWith<$Res> {
  factory $ConnectCommonParamsCopyWith(
          ConnectCommonParams value, $Res Function(ConnectCommonParams) then) =
      _$ConnectCommonParamsCopyWithImpl<$Res, ConnectCommonParams>;
  @useResult
  $Res call(
      {BluetoothDevice device, Duration timeout, int mtu, bool autoConnect});
}

/// @nodoc
class _$ConnectCommonParamsCopyWithImpl<$Res, $Val extends ConnectCommonParams>
    implements $ConnectCommonParamsCopyWith<$Res> {
  _$ConnectCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? timeout = null,
    Object? mtu = null,
    Object? autoConnect = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration,
      mtu: null == mtu
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      autoConnect: null == autoConnect
          ? _value.autoConnect
          : autoConnect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectCommonParamsImplCopyWith<$Res>
    implements $ConnectCommonParamsCopyWith<$Res> {
  factory _$$ConnectCommonParamsImplCopyWith(_$ConnectCommonParamsImpl value,
          $Res Function(_$ConnectCommonParamsImpl) then) =
      __$$ConnectCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothDevice device, Duration timeout, int mtu, bool autoConnect});
}

/// @nodoc
class __$$ConnectCommonParamsImplCopyWithImpl<$Res>
    extends _$ConnectCommonParamsCopyWithImpl<$Res, _$ConnectCommonParamsImpl>
    implements _$$ConnectCommonParamsImplCopyWith<$Res> {
  __$$ConnectCommonParamsImplCopyWithImpl(_$ConnectCommonParamsImpl _value,
      $Res Function(_$ConnectCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? timeout = null,
    Object? mtu = null,
    Object? autoConnect = null,
  }) {
    return _then(_$ConnectCommonParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration,
      mtu: null == mtu
          ? _value.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int,
      autoConnect: null == autoConnect
          ? _value.autoConnect
          : autoConnect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectCommonParamsImpl implements _ConnectCommonParams {
  const _$ConnectCommonParamsImpl(
      {required this.device,
      this.timeout = const Duration(seconds: 40),
      this.mtu = 512,
      this.autoConnect = false});

  @override
  final BluetoothDevice device;
  @override
  @JsonKey()
  final Duration timeout;
  @override
  @JsonKey()
  final int mtu;
  @override
  @JsonKey()
  final bool autoConnect;

  @override
  String toString() {
    return 'ConnectCommonParams(device: $device, timeout: $timeout, mtu: $mtu, autoConnect: $autoConnect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectCommonParamsImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.mtu, mtu) || other.mtu == mtu) &&
            (identical(other.autoConnect, autoConnect) ||
                other.autoConnect == autoConnect));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, device, timeout, mtu, autoConnect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectCommonParamsImplCopyWith<_$ConnectCommonParamsImpl> get copyWith =>
      __$$ConnectCommonParamsImplCopyWithImpl<_$ConnectCommonParamsImpl>(
          this, _$identity);
}

abstract class _ConnectCommonParams implements ConnectCommonParams {
  const factory _ConnectCommonParams(
      {required final BluetoothDevice device,
      final Duration timeout,
      final int mtu,
      final bool autoConnect}) = _$ConnectCommonParamsImpl;

  @override
  BluetoothDevice get device;
  @override
  Duration get timeout;
  @override
  int get mtu;
  @override
  bool get autoConnect;
  @override
  @JsonKey(ignore: true)
  _$$ConnectCommonParamsImplCopyWith<_$ConnectCommonParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
