// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothEntity {
  PolarDeviceInfo? get polar => throw _privateConstructorUsedError;
  String? get polarId => throw _privateConstructorUsedError;
  DiscoveredDevice? get common => throw _privateConstructorUsedError;
  String? get commonId => throw _privateConstructorUsedError;
  String? get manufacturerName => throw _privateConstructorUsedError;
  int? get batteryLevel => throw _privateConstructorUsedError;
  List<Service>? get services => throw _privateConstructorUsedError;
  ConnectionStateUpdate? get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothEntityCopyWith<BluetoothEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothEntityCopyWith<$Res> {
  factory $BluetoothEntityCopyWith(
          BluetoothEntity value, $Res Function(BluetoothEntity) then) =
      _$BluetoothEntityCopyWithImpl<$Res, BluetoothEntity>;
  @useResult
  $Res call(
      {PolarDeviceInfo? polar,
      String? polarId,
      DiscoveredDevice? common,
      String? commonId,
      String? manufacturerName,
      int? batteryLevel,
      List<Service>? services,
      ConnectionStateUpdate? state});
}

/// @nodoc
class _$BluetoothEntityCopyWithImpl<$Res, $Val extends BluetoothEntity>
    implements $BluetoothEntityCopyWith<$Res> {
  _$BluetoothEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polar = freezed,
    Object? polarId = freezed,
    Object? common = freezed,
    Object? commonId = freezed,
    Object? manufacturerName = freezed,
    Object? batteryLevel = freezed,
    Object? services = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      polar: freezed == polar
          ? _value.polar
          : polar // ignore: cast_nullable_to_non_nullable
              as PolarDeviceInfo?,
      polarId: freezed == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String?,
      common: freezed == common
          ? _value.common
          : common // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
      commonId: freezed == commonId
          ? _value.commonId
          : commonId // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturerName: freezed == manufacturerName
          ? _value.manufacturerName
          : manufacturerName // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConnectionStateUpdate?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetootheEntityImplCopyWith<$Res>
    implements $BluetoothEntityCopyWith<$Res> {
  factory _$$BluetootheEntityImplCopyWith(_$BluetootheEntityImpl value,
          $Res Function(_$BluetootheEntityImpl) then) =
      __$$BluetootheEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PolarDeviceInfo? polar,
      String? polarId,
      DiscoveredDevice? common,
      String? commonId,
      String? manufacturerName,
      int? batteryLevel,
      List<Service>? services,
      ConnectionStateUpdate? state});
}

/// @nodoc
class __$$BluetootheEntityImplCopyWithImpl<$Res>
    extends _$BluetoothEntityCopyWithImpl<$Res, _$BluetootheEntityImpl>
    implements _$$BluetootheEntityImplCopyWith<$Res> {
  __$$BluetootheEntityImplCopyWithImpl(_$BluetootheEntityImpl _value,
      $Res Function(_$BluetootheEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polar = freezed,
    Object? polarId = freezed,
    Object? common = freezed,
    Object? commonId = freezed,
    Object? manufacturerName = freezed,
    Object? batteryLevel = freezed,
    Object? services = freezed,
    Object? state = freezed,
  }) {
    return _then(_$BluetootheEntityImpl(
      polar: freezed == polar
          ? _value.polar
          : polar // ignore: cast_nullable_to_non_nullable
              as PolarDeviceInfo?,
      polarId: freezed == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String?,
      common: freezed == common
          ? _value.common
          : common // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
      commonId: freezed == commonId
          ? _value.commonId
          : commonId // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturerName: freezed == manufacturerName
          ? _value.manufacturerName
          : manufacturerName // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ConnectionStateUpdate?,
    ));
  }
}

/// @nodoc

class _$BluetootheEntityImpl implements _BluetootheEntity {
  const _$BluetootheEntityImpl(
      {this.polar,
      this.polarId,
      this.common,
      this.commonId,
      this.manufacturerName,
      this.batteryLevel,
      final List<Service>? services,
      this.state})
      : _services = services;

  @override
  final PolarDeviceInfo? polar;
  @override
  final String? polarId;
  @override
  final DiscoveredDevice? common;
  @override
  final String? commonId;
  @override
  final String? manufacturerName;
  @override
  final int? batteryLevel;
  final List<Service>? _services;
  @override
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ConnectionStateUpdate? state;

  @override
  String toString() {
    return 'BluetoothEntity(polar: $polar, polarId: $polarId, common: $common, commonId: $commonId, manufacturerName: $manufacturerName, batteryLevel: $batteryLevel, services: $services, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetootheEntityImpl &&
            (identical(other.polar, polar) || other.polar == polar) &&
            (identical(other.polarId, polarId) || other.polarId == polarId) &&
            (identical(other.common, common) || other.common == common) &&
            (identical(other.commonId, commonId) ||
                other.commonId == commonId) &&
            (identical(other.manufacturerName, manufacturerName) ||
                other.manufacturerName == manufacturerName) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      polar,
      polarId,
      common,
      commonId,
      manufacturerName,
      batteryLevel,
      const DeepCollectionEquality().hash(_services),
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetootheEntityImplCopyWith<_$BluetootheEntityImpl> get copyWith =>
      __$$BluetootheEntityImplCopyWithImpl<_$BluetootheEntityImpl>(
          this, _$identity);
}

abstract class _BluetootheEntity implements BluetoothEntity {
  const factory _BluetootheEntity(
      {final PolarDeviceInfo? polar,
      final String? polarId,
      final DiscoveredDevice? common,
      final String? commonId,
      final String? manufacturerName,
      final int? batteryLevel,
      final List<Service>? services,
      final ConnectionStateUpdate? state}) = _$BluetootheEntityImpl;

  @override
  PolarDeviceInfo? get polar;
  @override
  String? get polarId;
  @override
  DiscoveredDevice? get common;
  @override
  String? get commonId;
  @override
  String? get manufacturerName;
  @override
  int? get batteryLevel;
  @override
  List<Service>? get services;
  @override
  ConnectionStateUpdate? get state;
  @override
  @JsonKey(ignore: true)
  _$$BluetootheEntityImplCopyWith<_$BluetootheEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
