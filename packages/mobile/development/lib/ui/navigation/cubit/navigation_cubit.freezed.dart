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
  bool? get isBleOn => throw _privateConstructorUsedError;
  set isBleOn(bool? value) => throw _privateConstructorUsedError;
  bool? get isScanning => throw _privateConstructorUsedError;
  set isScanning(bool? value) => throw _privateConstructorUsedError;
  ConnectionStateUpdate? get state => throw _privateConstructorUsedError;
  set state(ConnectionStateUpdate? value) => throw _privateConstructorUsedError;
  List<BluetoothEntity>? get devices => throw _privateConstructorUsedError;
  set devices(List<BluetoothEntity>? value) =>
      throw _privateConstructorUsedError;
  Set<PolarDataType>? get polarTypes => throw _privateConstructorUsedError;
  set polarTypes(Set<PolarDataType>? value) =>
      throw _privateConstructorUsedError;
  List<Service>? get commonServices => throw _privateConstructorUsedError;
  set commonServices(List<Service>? value) =>
      throw _privateConstructorUsedError;
  int? get hr => throw _privateConstructorUsedError;
  set hr(int? value) => throw _privateConstructorUsedError;

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
      {bool? isBleOn,
      bool? isScanning,
      ConnectionStateUpdate? state,
      List<BluetoothEntity>? devices,
      Set<PolarDataType>? polarTypes,
      List<Service>? commonServices,
      int? hr});
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
    Object? isBleOn = freezed,
    Object? isScanning = freezed,
    Object? state = freezed,
    Object? devices = freezed,
    Object? polarTypes = freezed,
    Object? commonServices = freezed,
    Object? hr = freezed,
  }) {
    return _then(_value.copyWith(
      isBleOn: freezed == isBleOn
          ? _value.isBleOn
          : isBleOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isScanning: freezed == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConnectionStateUpdate?,
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothEntity>?,
      polarTypes: freezed == polarTypes
          ? _value.polarTypes
          : polarTypes // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>?,
      commonServices: freezed == commonServices
          ? _value.commonServices
          : commonServices // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      hr: freezed == hr
          ? _value.hr
          : hr // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
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
      {bool? isBleOn,
      bool? isScanning,
      ConnectionStateUpdate? state,
      List<BluetoothEntity>? devices,
      Set<PolarDataType>? polarTypes,
      List<Service>? commonServices,
      int? hr});
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
    Object? isBleOn = freezed,
    Object? isScanning = freezed,
    Object? state = freezed,
    Object? devices = freezed,
    Object? polarTypes = freezed,
    Object? commonServices = freezed,
    Object? hr = freezed,
  }) {
    return _then(_$NavigationStateImpl(
      isBleOn: freezed == isBleOn
          ? _value.isBleOn
          : isBleOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isScanning: freezed == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConnectionStateUpdate?,
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothEntity>?,
      polarTypes: freezed == polarTypes
          ? _value.polarTypes
          : polarTypes // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>?,
      commonServices: freezed == commonServices
          ? _value.commonServices
          : commonServices // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      hr: freezed == hr
          ? _value.hr
          : hr // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  _$NavigationStateImpl(
      {this.isBleOn,
      this.isScanning,
      this.state,
      this.devices,
      this.polarTypes,
      this.commonServices,
      this.hr});

  @override
  bool? isBleOn;
  @override
  bool? isScanning;
  @override
  ConnectionStateUpdate? state;
  @override
  List<BluetoothEntity>? devices;
  @override
  Set<PolarDataType>? polarTypes;
  @override
  List<Service>? commonServices;
  @override
  int? hr;

  @override
  String toString() {
    return 'NavigationState(isBleOn: $isBleOn, isScanning: $isScanning, state: $state, devices: $devices, polarTypes: $polarTypes, commonServices: $commonServices, hr: $hr)';
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
      {bool? isBleOn,
      bool? isScanning,
      ConnectionStateUpdate? state,
      List<BluetoothEntity>? devices,
      Set<PolarDataType>? polarTypes,
      List<Service>? commonServices,
      int? hr}) = _$NavigationStateImpl;

  @override
  bool? get isBleOn;
  set isBleOn(bool? value);
  @override
  bool? get isScanning;
  set isScanning(bool? value);
  @override
  ConnectionStateUpdate? get state;
  set state(ConnectionStateUpdate? value);
  @override
  List<BluetoothEntity>? get devices;
  set devices(List<BluetoothEntity>? value);
  @override
  Set<PolarDataType>? get polarTypes;
  set polarTypes(Set<PolarDataType>? value);
  @override
  List<Service>? get commonServices;
  set commonServices(List<Service>? value);
  @override
  int? get hr;
  set hr(int? value);
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
