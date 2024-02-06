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
  bool? get isScanning => throw _privateConstructorUsedError;
  set isScanning(bool? value) => throw _privateConstructorUsedError;
  BluetoothAdapterState? get state => throw _privateConstructorUsedError;
  set state(BluetoothAdapterState? value) => throw _privateConstructorUsedError;
  List<BleEntity>? get fDevices => throw _privateConstructorUsedError;
  set fDevices(List<BleEntity>? value) => throw _privateConstructorUsedError;
  BleEntity? get cDevice => throw _privateConstructorUsedError;
  set cDevice(BleEntity? value) => throw _privateConstructorUsedError;
  int? get hr => throw _privateConstructorUsedError;
  set hr(int? value) => throw _privateConstructorUsedError;
  BluetoothFailure? get bleFailure => throw _privateConstructorUsedError;
  set bleFailure(BluetoothFailure? value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

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
      {bool? isScanning,
      BluetoothAdapterState? state,
      List<BleEntity>? fDevices,
      BleEntity? cDevice,
      int? hr,
      BluetoothFailure? bleFailure,
      bool isLoading});

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
    Object? isScanning = freezed,
    Object? state = freezed,
    Object? fDevices = freezed,
    Object? cDevice = freezed,
    Object? hr = freezed,
    Object? bleFailure = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isScanning: freezed == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState?,
      fDevices: freezed == fDevices
          ? _value.fDevices
          : fDevices // ignore: cast_nullable_to_non_nullable
              as List<BleEntity>?,
      cDevice: freezed == cDevice
          ? _value.cDevice
          : cDevice // ignore: cast_nullable_to_non_nullable
              as BleEntity?,
      hr: freezed == hr
          ? _value.hr
          : hr // ignore: cast_nullable_to_non_nullable
              as int?,
      bleFailure: freezed == bleFailure
          ? _value.bleFailure
          : bleFailure // ignore: cast_nullable_to_non_nullable
              as BluetoothFailure?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {bool? isScanning,
      BluetoothAdapterState? state,
      List<BleEntity>? fDevices,
      BleEntity? cDevice,
      int? hr,
      BluetoothFailure? bleFailure,
      bool isLoading});

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
    Object? isScanning = freezed,
    Object? state = freezed,
    Object? fDevices = freezed,
    Object? cDevice = freezed,
    Object? hr = freezed,
    Object? bleFailure = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$NavigationStateImpl(
      isScanning: freezed == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState?,
      fDevices: freezed == fDevices
          ? _value.fDevices
          : fDevices // ignore: cast_nullable_to_non_nullable
              as List<BleEntity>?,
      cDevice: freezed == cDevice
          ? _value.cDevice
          : cDevice // ignore: cast_nullable_to_non_nullable
              as BleEntity?,
      hr: freezed == hr
          ? _value.hr
          : hr // ignore: cast_nullable_to_non_nullable
              as int?,
      bleFailure: freezed == bleFailure
          ? _value.bleFailure
          : bleFailure // ignore: cast_nullable_to_non_nullable
              as BluetoothFailure?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  _$NavigationStateImpl(
      {this.isScanning,
      this.state,
      this.fDevices,
      this.cDevice,
      this.hr,
      this.bleFailure,
      this.isLoading = false});

  @override
  bool? isScanning;
  @override
  BluetoothAdapterState? state;
  @override
  List<BleEntity>? fDevices;
  @override
  BleEntity? cDevice;
  @override
  int? hr;
  @override
  BluetoothFailure? bleFailure;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'NavigationState(isScanning: $isScanning, state: $state, fDevices: $fDevices, cDevice: $cDevice, hr: $hr, bleFailure: $bleFailure, isLoading: $isLoading)';
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
      {bool? isScanning,
      BluetoothAdapterState? state,
      List<BleEntity>? fDevices,
      BleEntity? cDevice,
      int? hr,
      BluetoothFailure? bleFailure,
      bool isLoading}) = _$NavigationStateImpl;

  @override
  bool? get isScanning;
  set isScanning(bool? value);
  @override
  BluetoothAdapterState? get state;
  set state(BluetoothAdapterState? value);
  @override
  List<BleEntity>? get fDevices;
  set fDevices(List<BleEntity>? value);
  @override
  BleEntity? get cDevice;
  set cDevice(BleEntity? value);
  @override
  int? get hr;
  set hr(int? value);
  @override
  BluetoothFailure? get bleFailure;
  set bleFailure(BluetoothFailure? value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
