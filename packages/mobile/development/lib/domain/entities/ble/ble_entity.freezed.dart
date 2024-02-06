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
  String get address => throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;
  bool get isConnectable => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  BluetoothDevice get device => throw _privateConstructorUsedError;
  List<BluetoothService>? get commonservices =>
      throw _privateConstructorUsedError;
  String? get polarId => throw _privateConstructorUsedError;
  Set<PolarDataType>? get polarServices => throw _privateConstructorUsedError;

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
      commonservices: freezed == commonservices
          ? _value._commonservices
          : commonservices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>?,
      polarId: freezed == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String?,
      polarServices: freezed == polarServices
          ? _value._polarServices
          : polarServices // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>?,
    ));
  }
}

/// @nodoc

class _$BleEntityImpl implements _BleEntity {
  const _$BleEntityImpl(
      {required this.name,
      required this.address,
      required this.rssi,
      required this.isConnectable,
      required this.timeStamp,
      required this.device,
      final List<BluetoothService>? commonservices,
      this.polarId,
      final Set<PolarDataType>? polarServices})
      : _commonservices = commonservices,
        _polarServices = polarServices;

  @override
  final String name;
  @override
  final String address;
  @override
  final int rssi;
  @override
  final bool isConnectable;
  @override
  final DateTime timeStamp;
  @override
  final BluetoothDevice device;
  final List<BluetoothService>? _commonservices;
  @override
  List<BluetoothService>? get commonservices {
    final value = _commonservices;
    if (value == null) return null;
    if (_commonservices is EqualUnmodifiableListView) return _commonservices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? polarId;
  final Set<PolarDataType>? _polarServices;
  @override
  Set<PolarDataType>? get polarServices {
    final value = _polarServices;
    if (value == null) return null;
    if (_polarServices is EqualUnmodifiableSetView) return _polarServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'BleEntity(name: $name, address: $address, rssi: $rssi, isConnectable: $isConnectable, timeStamp: $timeStamp, device: $device, commonservices: $commonservices, polarId: $polarId, polarServices: $polarServices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BleEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.isConnectable, isConnectable) ||
                other.isConnectable == isConnectable) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality()
                .equals(other._commonservices, _commonservices) &&
            (identical(other.polarId, polarId) || other.polarId == polarId) &&
            const DeepCollectionEquality()
                .equals(other._polarServices, _polarServices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      address,
      rssi,
      isConnectable,
      timeStamp,
      device,
      const DeepCollectionEquality().hash(_commonservices),
      polarId,
      const DeepCollectionEquality().hash(_polarServices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BleEntityImplCopyWith<_$BleEntityImpl> get copyWith =>
      __$$BleEntityImplCopyWithImpl<_$BleEntityImpl>(this, _$identity);
}

abstract class _BleEntity implements BleEntity {
  const factory _BleEntity(
      {required final String name,
      required final String address,
      required final int rssi,
      required final bool isConnectable,
      required final DateTime timeStamp,
      required final BluetoothDevice device,
      final List<BluetoothService>? commonservices,
      final String? polarId,
      final Set<PolarDataType>? polarServices}) = _$BleEntityImpl;

  @override
  String get name;
  @override
  String get address;
  @override
  int get rssi;
  @override
  bool get isConnectable;
  @override
  DateTime get timeStamp;
  @override
  BluetoothDevice get device;
  @override
  List<BluetoothService>? get commonservices;
  @override
  String? get polarId;
  @override
  Set<PolarDataType>? get polarServices;
  @override
  @JsonKey(ignore: true)
  _$$BleEntityImplCopyWith<_$BleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
