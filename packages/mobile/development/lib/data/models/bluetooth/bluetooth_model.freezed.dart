// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothModel {
  PolarDeviceInfo? get polar => throw _privateConstructorUsedError;
  DiscoveredDevice? get common => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothModelCopyWith<BluetoothModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothModelCopyWith<$Res> {
  factory $BluetoothModelCopyWith(
          BluetoothModel value, $Res Function(BluetoothModel) then) =
      _$BluetoothModelCopyWithImpl<$Res, BluetoothModel>;
  @useResult
  $Res call({PolarDeviceInfo? polar, DiscoveredDevice? common});
}

/// @nodoc
class _$BluetoothModelCopyWithImpl<$Res, $Val extends BluetoothModel>
    implements $BluetoothModelCopyWith<$Res> {
  _$BluetoothModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polar = freezed,
    Object? common = freezed,
  }) {
    return _then(_value.copyWith(
      polar: freezed == polar
          ? _value.polar
          : polar // ignore: cast_nullable_to_non_nullable
              as PolarDeviceInfo?,
      common: freezed == common
          ? _value.common
          : common // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetoothModelImplCopyWith<$Res>
    implements $BluetoothModelCopyWith<$Res> {
  factory _$$BluetoothModelImplCopyWith(_$BluetoothModelImpl value,
          $Res Function(_$BluetoothModelImpl) then) =
      __$$BluetoothModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PolarDeviceInfo? polar, DiscoveredDevice? common});
}

/// @nodoc
class __$$BluetoothModelImplCopyWithImpl<$Res>
    extends _$BluetoothModelCopyWithImpl<$Res, _$BluetoothModelImpl>
    implements _$$BluetoothModelImplCopyWith<$Res> {
  __$$BluetoothModelImplCopyWithImpl(
      _$BluetoothModelImpl _value, $Res Function(_$BluetoothModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polar = freezed,
    Object? common = freezed,
  }) {
    return _then(_$BluetoothModelImpl(
      polar: freezed == polar
          ? _value.polar
          : polar // ignore: cast_nullable_to_non_nullable
              as PolarDeviceInfo?,
      common: freezed == common
          ? _value.common
          : common // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
    ));
  }
}

/// @nodoc

class _$BluetoothModelImpl extends _BluetoothModel {
  const _$BluetoothModelImpl({this.polar, this.common}) : super._();

  @override
  final PolarDeviceInfo? polar;
  @override
  final DiscoveredDevice? common;

  @override
  String toString() {
    return 'BluetoothModel(polar: $polar, common: $common)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothModelImpl &&
            (identical(other.polar, polar) || other.polar == polar) &&
            (identical(other.common, common) || other.common == common));
  }

  @override
  int get hashCode => Object.hash(runtimeType, polar, common);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothModelImplCopyWith<_$BluetoothModelImpl> get copyWith =>
      __$$BluetoothModelImplCopyWithImpl<_$BluetoothModelImpl>(
          this, _$identity);
}

abstract class _BluetoothModel extends BluetoothModel {
  const factory _BluetoothModel(
      {final PolarDeviceInfo? polar,
      final DiscoveredDevice? common}) = _$BluetoothModelImpl;
  const _BluetoothModel._() : super._();

  @override
  PolarDeviceInfo? get polar;
  @override
  DiscoveredDevice? get common;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothModelImplCopyWith<_$BluetoothModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
