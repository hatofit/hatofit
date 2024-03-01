// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  CubitStatus get status => throw _privateConstructorUsedError;
  set status(CubitStatus value) => throw _privateConstructorUsedError;
  bool? get isScanning => throw _privateConstructorUsedError;
  set isScanning(bool? value) => throw _privateConstructorUsedError;
  BluetoothAdapterState? get state => throw _privateConstructorUsedError;
  set state(BluetoothAdapterState? value) => throw _privateConstructorUsedError;
  List<BleEntity> get fDevices => throw _privateConstructorUsedError;
  set fDevices(List<BleEntity> value) => throw _privateConstructorUsedError;
  BleEntity? get cDevice => throw _privateConstructorUsedError;
  set cDevice(BleEntity? value) => throw _privateConstructorUsedError;
  BluetoothFailure? get bleFailure => throw _privateConstructorUsedError;
  set bleFailure(BluetoothFailure? value) => throw _privateConstructorUsedError;
  BluetoothConnectionState? get conState => throw _privateConstructorUsedError;
  set conState(BluetoothConnectionState? value) =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;
  PolarHrSample? get hrSample => throw _privateConstructorUsedError;
  set hrSample(PolarHrSample? value) => throw _privateConstructorUsedError;
  List<PolarEcgSample>? get ecgSample => throw _privateConstructorUsedError;
  set ecgSample(List<PolarEcgSample>? value) =>
      throw _privateConstructorUsedError;
  PolarAccSample? get accSample => throw _privateConstructorUsedError;
  set accSample(PolarAccSample? value) => throw _privateConstructorUsedError;
  PolarGyroSample? get gyroSample => throw _privateConstructorUsedError;
  set gyroSample(PolarGyroSample? value) => throw _privateConstructorUsedError;
  PolarMagnetometerSample? get magnetometerSample =>
      throw _privateConstructorUsedError;
  set magnetometerSample(PolarMagnetometerSample? value) =>
      throw _privateConstructorUsedError;
  PolarPpgSample? get ppgSample => throw _privateConstructorUsedError;
  set ppgSample(PolarPpgSample? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {CubitStatus status,
      bool? isScanning,
      BluetoothAdapterState? state,
      List<BleEntity> fDevices,
      BleEntity? cDevice,
      BluetoothFailure? bleFailure,
      BluetoothConnectionState? conState,
      bool isLoading,
      PolarHrSample? hrSample,
      List<PolarEcgSample>? ecgSample,
      PolarAccSample? accSample,
      PolarGyroSample? gyroSample,
      PolarMagnetometerSample? magnetometerSample,
      PolarPpgSample? ppgSample});

  $BleEntityCopyWith<$Res>? get cDevice;
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isScanning = freezed,
    Object? state = freezed,
    Object? fDevices = null,
    Object? cDevice = freezed,
    Object? bleFailure = freezed,
    Object? conState = freezed,
    Object? isLoading = null,
    Object? hrSample = freezed,
    Object? ecgSample = freezed,
    Object? accSample = freezed,
    Object? gyroSample = freezed,
    Object? magnetometerSample = freezed,
    Object? ppgSample = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CubitStatus,
      isScanning: freezed == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState?,
      fDevices: null == fDevices
          ? _value.fDevices
          : fDevices // ignore: cast_nullable_to_non_nullable
              as List<BleEntity>,
      cDevice: freezed == cDevice
          ? _value.cDevice
          : cDevice // ignore: cast_nullable_to_non_nullable
              as BleEntity?,
      bleFailure: freezed == bleFailure
          ? _value.bleFailure
          : bleFailure // ignore: cast_nullable_to_non_nullable
              as BluetoothFailure?,
      conState: freezed == conState
          ? _value.conState
          : conState // ignore: cast_nullable_to_non_nullable
              as BluetoothConnectionState?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hrSample: freezed == hrSample
          ? _value.hrSample
          : hrSample // ignore: cast_nullable_to_non_nullable
              as PolarHrSample?,
      ecgSample: freezed == ecgSample
          ? _value.ecgSample
          : ecgSample // ignore: cast_nullable_to_non_nullable
              as List<PolarEcgSample>?,
      accSample: freezed == accSample
          ? _value.accSample
          : accSample // ignore: cast_nullable_to_non_nullable
              as PolarAccSample?,
      gyroSample: freezed == gyroSample
          ? _value.gyroSample
          : gyroSample // ignore: cast_nullable_to_non_nullable
              as PolarGyroSample?,
      magnetometerSample: freezed == magnetometerSample
          ? _value.magnetometerSample
          : magnetometerSample // ignore: cast_nullable_to_non_nullable
              as PolarMagnetometerSample?,
      ppgSample: freezed == ppgSample
          ? _value.ppgSample
          : ppgSample // ignore: cast_nullable_to_non_nullable
              as PolarPpgSample?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BleEntityCopyWith<$Res>? get cDevice {
    if (_value.cDevice == null) {
      return null;
    }

    return $BleEntityCopyWith<$Res>(_value.cDevice!, (value) {
      return _then(_value.copyWith(cDevice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationStateImplCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationStateImplCopyWith(_$NavigationStateImpl value,
          $Res Function(_$NavigationStateImpl) then) =
      __$$NavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CubitStatus status,
      bool? isScanning,
      BluetoothAdapterState? state,
      List<BleEntity> fDevices,
      BleEntity? cDevice,
      BluetoothFailure? bleFailure,
      BluetoothConnectionState? conState,
      bool isLoading,
      PolarHrSample? hrSample,
      List<PolarEcgSample>? ecgSample,
      PolarAccSample? accSample,
      PolarGyroSample? gyroSample,
      PolarMagnetometerSample? magnetometerSample,
      PolarPpgSample? ppgSample});

  @override
  $BleEntityCopyWith<$Res>? get cDevice;
}

/// @nodoc
class __$$NavigationStateImplCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$NavigationStateImpl>
    implements _$$NavigationStateImplCopyWith<$Res> {
  __$$NavigationStateImplCopyWithImpl(
      _$NavigationStateImpl _value, $Res Function(_$NavigationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isScanning = freezed,
    Object? state = freezed,
    Object? fDevices = null,
    Object? cDevice = freezed,
    Object? bleFailure = freezed,
    Object? conState = freezed,
    Object? isLoading = null,
    Object? hrSample = freezed,
    Object? ecgSample = freezed,
    Object? accSample = freezed,
    Object? gyroSample = freezed,
    Object? magnetometerSample = freezed,
    Object? ppgSample = freezed,
  }) {
    return _then(_$NavigationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CubitStatus,
      isScanning: freezed == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState?,
      fDevices: null == fDevices
          ? _value.fDevices
          : fDevices // ignore: cast_nullable_to_non_nullable
              as List<BleEntity>,
      cDevice: freezed == cDevice
          ? _value.cDevice
          : cDevice // ignore: cast_nullable_to_non_nullable
              as BleEntity?,
      bleFailure: freezed == bleFailure
          ? _value.bleFailure
          : bleFailure // ignore: cast_nullable_to_non_nullable
              as BluetoothFailure?,
      conState: freezed == conState
          ? _value.conState
          : conState // ignore: cast_nullable_to_non_nullable
              as BluetoothConnectionState?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hrSample: freezed == hrSample
          ? _value.hrSample
          : hrSample // ignore: cast_nullable_to_non_nullable
              as PolarHrSample?,
      ecgSample: freezed == ecgSample
          ? _value.ecgSample
          : ecgSample // ignore: cast_nullable_to_non_nullable
              as List<PolarEcgSample>?,
      accSample: freezed == accSample
          ? _value.accSample
          : accSample // ignore: cast_nullable_to_non_nullable
              as PolarAccSample?,
      gyroSample: freezed == gyroSample
          ? _value.gyroSample
          : gyroSample // ignore: cast_nullable_to_non_nullable
              as PolarGyroSample?,
      magnetometerSample: freezed == magnetometerSample
          ? _value.magnetometerSample
          : magnetometerSample // ignore: cast_nullable_to_non_nullable
              as PolarMagnetometerSample?,
      ppgSample: freezed == ppgSample
          ? _value.ppgSample
          : ppgSample // ignore: cast_nullable_to_non_nullable
              as PolarPpgSample?,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  _$NavigationStateImpl(
      {this.status = CubitStatus.initial,
      this.isScanning,
      this.state,
      this.fDevices = const [],
      this.cDevice,
      this.bleFailure,
      this.conState,
      this.isLoading = false,
      this.hrSample,
      this.ecgSample,
      this.accSample,
      this.gyroSample,
      this.magnetometerSample,
      this.ppgSample});

  @override
  @JsonKey()
  CubitStatus status;
  @override
  bool? isScanning;
  @override
  BluetoothAdapterState? state;
  @override
  @JsonKey()
  List<BleEntity> fDevices;
  @override
  BleEntity? cDevice;
  @override
  BluetoothFailure? bleFailure;
  @override
  BluetoothConnectionState? conState;
  @override
  @JsonKey()
  bool isLoading;
  @override
  PolarHrSample? hrSample;
  @override
  List<PolarEcgSample>? ecgSample;
  @override
  PolarAccSample? accSample;
  @override
  PolarGyroSample? gyroSample;
  @override
  PolarMagnetometerSample? magnetometerSample;
  @override
  PolarPpgSample? ppgSample;

  @override
  String toString() {
    return 'NavigationState(status: $status, isScanning: $isScanning, state: $state, fDevices: $fDevices, cDevice: $cDevice, bleFailure: $bleFailure, conState: $conState, isLoading: $isLoading, hrSample: $hrSample, ecgSample: $ecgSample, accSample: $accSample, gyroSample: $gyroSample, magnetometerSample: $magnetometerSample, ppgSample: $ppgSample)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      __$$NavigationStateImplCopyWithImpl<_$NavigationStateImpl>(
          this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  factory _NavigationState(
      {CubitStatus status,
      bool? isScanning,
      BluetoothAdapterState? state,
      List<BleEntity> fDevices,
      BleEntity? cDevice,
      BluetoothFailure? bleFailure,
      BluetoothConnectionState? conState,
      bool isLoading,
      PolarHrSample? hrSample,
      List<PolarEcgSample>? ecgSample,
      PolarAccSample? accSample,
      PolarGyroSample? gyroSample,
      PolarMagnetometerSample? magnetometerSample,
      PolarPpgSample? ppgSample}) = _$NavigationStateImpl;

  @override
  CubitStatus get status;
  set status(CubitStatus value);
  @override
  bool? get isScanning;
  set isScanning(bool? value);
  @override
  BluetoothAdapterState? get state;
  set state(BluetoothAdapterState? value);
  @override
  List<BleEntity> get fDevices;
  set fDevices(List<BleEntity> value);
  @override
  BleEntity? get cDevice;
  set cDevice(BleEntity? value);
  @override
  BluetoothFailure? get bleFailure;
  set bleFailure(BluetoothFailure? value);
  @override
  BluetoothConnectionState? get conState;
  set conState(BluetoothConnectionState? value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  PolarHrSample? get hrSample;
  set hrSample(PolarHrSample? value);
  @override
  List<PolarEcgSample>? get ecgSample;
  set ecgSample(List<PolarEcgSample>? value);
  @override
  PolarAccSample? get accSample;
  set accSample(PolarAccSample? value);
  @override
  PolarGyroSample? get gyroSample;
  set gyroSample(PolarGyroSample? value);
  @override
  PolarMagnetometerSample? get magnetometerSample;
  set magnetometerSample(PolarMagnetometerSample? value);
  @override
  PolarPpgSample? get ppgSample;
  set ppgSample(PolarPpgSample? value);
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
