// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothParams {
  String? get deviceId => throw _privateConstructorUsedError;
  String get polarId => throw _privateConstructorUsedError;
  Set<PolarDataType> get types => throw _privateConstructorUsedError;
  Uuid? get uuid => throw _privateConstructorUsedError;
  Service? get service => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothParamsCopyWith<BluetoothParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothParamsCopyWith<$Res> {
  factory $BluetoothParamsCopyWith(
          BluetoothParams value, $Res Function(BluetoothParams) then) =
      _$BluetoothParamsCopyWithImpl<$Res, BluetoothParams>;
  @useResult
  $Res call(
      {String? deviceId,
      String polarId,
      Set<PolarDataType> types,
      Uuid? uuid,
      Service? service});
}

/// @nodoc
class _$BluetoothParamsCopyWithImpl<$Res, $Val extends BluetoothParams>
    implements $BluetoothParamsCopyWith<$Res> {
  _$BluetoothParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? polarId = null,
    Object? types = null,
    Object? uuid = freezed,
    Object? service = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      polarId: null == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as Uuid?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetoothParamsImplCopyWith<$Res>
    implements $BluetoothParamsCopyWith<$Res> {
  factory _$$BluetoothParamsImplCopyWith(_$BluetoothParamsImpl value,
          $Res Function(_$BluetoothParamsImpl) then) =
      __$$BluetoothParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? deviceId,
      String polarId,
      Set<PolarDataType> types,
      Uuid? uuid,
      Service? service});
}

/// @nodoc
class __$$BluetoothParamsImplCopyWithImpl<$Res>
    extends _$BluetoothParamsCopyWithImpl<$Res, _$BluetoothParamsImpl>
    implements _$$BluetoothParamsImplCopyWith<$Res> {
  __$$BluetoothParamsImplCopyWithImpl(
      _$BluetoothParamsImpl _value, $Res Function(_$BluetoothParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? polarId = null,
    Object? types = null,
    Object? uuid = freezed,
    Object? service = freezed,
  }) {
    return _then(_$BluetoothParamsImpl(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      polarId: null == polarId
          ? _value.polarId
          : polarId // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Set<PolarDataType>,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as Uuid?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
    ));
  }
}

/// @nodoc

class _$BluetoothParamsImpl implements _BluetoothParams {
  const _$BluetoothParamsImpl(
      {this.deviceId = null,
      this.polarId = "",
      final Set<PolarDataType> types = const {},
      this.uuid = null,
      this.service = null})
      : _types = types;

  @override
  @JsonKey()
  final String? deviceId;
  @override
  @JsonKey()
  final String polarId;
  final Set<PolarDataType> _types;
  @override
  @JsonKey()
  Set<PolarDataType> get types {
    if (_types is EqualUnmodifiableSetView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_types);
  }

  @override
  @JsonKey()
  final Uuid? uuid;
  @override
  @JsonKey()
  final Service? service;

  @override
  String toString() {
    return 'BluetoothParams(deviceId: $deviceId, polarId: $polarId, types: $types, uuid: $uuid, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothParamsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.polarId, polarId) || other.polarId == polarId) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, polarId,
      const DeepCollectionEquality().hash(_types), uuid, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothParamsImplCopyWith<_$BluetoothParamsImpl> get copyWith =>
      __$$BluetoothParamsImplCopyWithImpl<_$BluetoothParamsImpl>(
          this, _$identity);
}

abstract class _BluetoothParams implements BluetoothParams {
  const factory _BluetoothParams(
      {final String? deviceId,
      final String polarId,
      final Set<PolarDataType> types,
      final Uuid? uuid,
      final Service? service}) = _$BluetoothParamsImpl;

  @override
  String? get deviceId;
  @override
  String get polarId;
  @override
  Set<PolarDataType> get types;
  @override
  Uuid? get uuid;
  @override
  Service? get service;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothParamsImplCopyWith<_$BluetoothParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
