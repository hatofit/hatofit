// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BleEntity {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  set address(String value) => throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;
  set rssi(int value) => throw _privateConstructorUsedError;
  bool get isConnectable => throw _privateConstructorUsedError;
  set isConnectable(bool value) => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  set timeStamp(DateTime value) => throw _privateConstructorUsedError;
  BluetoothDevice get device => throw _privateConstructorUsedError;
  set device(BluetoothDevice value) => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  set brand(String? value) => throw _privateConstructorUsedError;
  int? get battery => throw _privateConstructorUsedError;
  set battery(int? value) => throw _privateConstructorUsedError;
  List<BluetoothService>? get commonservices =>
      throw _privateConstructorUsedError;
  set commonservices(List<BluetoothService>? value) =>
      throw _privateConstructorUsedError;
  String? get polarId => throw _privateConstructorUsedError;
  set polarId(String? value) => throw _privateConstructorUsedError;
  Set<PolarDataType>? get polarServices => throw _privateConstructorUsedError;
  set polarServices(Set<PolarDataType>? value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BleEntityCopyWith<BleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BleEntityCopyWith<$Res> {
  factory $BleEntityCopyWith(BleEntity value, $Res Function(BleEntity) then) =
      _$BleEntityCopyWithImpl<$Res, BleEntity>;
  @useResult
  $Res call(
      {String name,
      String address,
      int rssi,
      bool isConnectable,
      DateTime timeStamp,
      BluetoothDevice device,
      String? brand,
      int? battery,
      List<BluetoothService>? commonservices,
      String? polarId,
      Set<PolarDataType>? polarServices});
}

/// @nodoc
class _$BleEntityCopyWithImpl<$Res, $Val extends BleEntity>
    implements $BleEntityCopyWith<$Res> {
  _$BleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? rssi = null,
    Object? isConnectable = null,
    Object? timeStamp = null,
    Object? device = null,
    Object? brand = freezed,
    Object? battery = freezed,
    Object? commonservices = freezed,
    Object? polarId = freezed,
    Object? polarServices = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      isConnectable: null == isConnectable
          ? _value.isConnectable
          : isConnectable // ignore: cast_nullable_to_non_nullable
              as bool,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      battery: freezed == battery
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as int?,
      commonservices: freezed == commonservices
          ? _value.commonservices
          : commonservices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>?,
      polarId: freezed == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String?,
      polarServices: freezed == polarServices
          ? _value.polarServices
          : polarServices // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BleEntityImplCopyWith<$Res>
    implements $BleEntityCopyWith<$Res> {
  factory _$$BleEntityImplCopyWith(
          _$BleEntityImpl value, $Res Function(_$BleEntityImpl) then) =
      __$$BleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      int rssi,
      bool isConnectable,
      DateTime timeStamp,
      BluetoothDevice device,
      String? brand,
      int? battery,
      List<BluetoothService>? commonservices,
      String? polarId,
      Set<PolarDataType>? polarServices});
}

/// @nodoc
class __$$BleEntityImplCopyWithImpl<$Res>
    extends _$BleEntityCopyWithImpl<$Res, _$BleEntityImpl>
    implements _$$BleEntityImplCopyWith<$Res> {
  __$$BleEntityImplCopyWithImpl(
      _$BleEntityImpl _value, $Res Function(_$BleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? rssi = null,
    Object? isConnectable = null,
    Object? timeStamp = null,
    Object? device = null,
    Object? brand = freezed,
    Object? battery = freezed,
    Object? commonservices = freezed,
    Object? polarId = freezed,
    Object? polarServices = freezed,
  }) {
    return _then(_$BleEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      isConnectable: null == isConnectable
          ? _value.isConnectable
          : isConnectable // ignore: cast_nullable_to_non_nullable
              as bool,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      battery: freezed == battery
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as int?,
      commonservices: freezed == commonservices
          ? _value.commonservices
          : commonservices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>?,
      polarId: freezed == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String?,
      polarServices: freezed == polarServices
          ? _value.polarServices
          : polarServices // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>?,
    ));
  }
}

/// @nodoc

class _$BleEntityImpl implements _BleEntity {
  _$BleEntityImpl(
      {required this.name,
      required this.address,
      required this.rssi,
      required this.isConnectable,
      required this.timeStamp,
      required this.device,
      this.brand,
      this.battery,
      this.commonservices,
      this.polarId,
      this.polarServices});

  @override
  String name;
  @override
  String address;
  @override
  int rssi;
  @override
  bool isConnectable;
  @override
  DateTime timeStamp;
  @override
  BluetoothDevice device;
  @override
  String? brand;
  @override
  int? battery;
  @override
  List<BluetoothService>? commonservices;
  @override
  String? polarId;
  @override
  Set<PolarDataType>? polarServices;

  @override
  String toString() {
    return 'BleEntity(name: $name, address: $address, rssi: $rssi, isConnectable: $isConnectable, timeStamp: $timeStamp, device: $device, brand: $brand, battery: $battery, commonservices: $commonservices, polarId: $polarId, polarServices: $polarServices)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BleEntityImplCopyWith<_$BleEntityImpl> get copyWith =>
      __$$BleEntityImplCopyWithImpl<_$BleEntityImpl>(this, _$identity);
}

abstract class _BleEntity implements BleEntity {
  factory _BleEntity(
      {required String name,
      required String address,
      required int rssi,
      required bool isConnectable,
      required DateTime timeStamp,
      required BluetoothDevice device,
      String? brand,
      int? battery,
      List<BluetoothService>? commonservices,
      String? polarId,
      Set<PolarDataType>? polarServices}) = _$BleEntityImpl;

  @override
  String get name;
  set name(String value);
  @override
  String get address;
  set address(String value);
  @override
  int get rssi;
  set rssi(int value);
  @override
  bool get isConnectable;
  set isConnectable(bool value);
  @override
  DateTime get timeStamp;
  set timeStamp(DateTime value);
  @override
  BluetoothDevice get device;
  set device(BluetoothDevice value);
  @override
  String? get brand;
  set brand(String? value);
  @override
  int? get battery;
  set battery(int? value);
  @override
  List<BluetoothService>? get commonservices;
  set commonservices(List<BluetoothService>? value);
  @override
  String? get polarId;
  set polarId(String? value);
  @override
  Set<PolarDataType>? get polarServices;
  set polarServices(Set<PolarDataType>? value);
  @override
  @JsonKey(ignore: true)
  _$$BleEntityImplCopyWith<_$BleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
