// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StreamCommonParams {
  BluetoothCharacteristic get characteristic =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreamCommonParamsCopyWith<StreamCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamCommonParamsCopyWith<$Res> {
  factory $StreamCommonParamsCopyWith(
          StreamCommonParams value, $Res Function(StreamCommonParams) then) =
      _$StreamCommonParamsCopyWithImpl<$Res, StreamCommonParams>;
  @useResult
  $Res call({BluetoothCharacteristic characteristic});
}

/// @nodoc
class _$StreamCommonParamsCopyWithImpl<$Res, $Val extends StreamCommonParams>
    implements $StreamCommonParamsCopyWith<$Res> {
  _$StreamCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristic = null,
  }) {
    return _then(_value.copyWith(
      characteristic: null == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamCommonParamsImplCopyWith<$Res>
    implements $StreamCommonParamsCopyWith<$Res> {
  factory _$$StreamCommonParamsImplCopyWith(_$StreamCommonParamsImpl value,
          $Res Function(_$StreamCommonParamsImpl) then) =
      __$$StreamCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothCharacteristic characteristic});
}

/// @nodoc
class __$$StreamCommonParamsImplCopyWithImpl<$Res>
    extends _$StreamCommonParamsCopyWithImpl<$Res, _$StreamCommonParamsImpl>
    implements _$$StreamCommonParamsImplCopyWith<$Res> {
  __$$StreamCommonParamsImplCopyWithImpl(_$StreamCommonParamsImpl _value,
      $Res Function(_$StreamCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristic = null,
  }) {
    return _then(_$StreamCommonParamsImpl(
      characteristic: null == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
    ));
  }
}

/// @nodoc

class _$StreamCommonParamsImpl implements _StreamCommonParams {
  const _$StreamCommonParamsImpl({required this.characteristic});

  @override
  final BluetoothCharacteristic characteristic;

  @override
  String toString() {
    return 'StreamCommonParams(characteristic: $characteristic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamCommonParamsImpl &&
            (identical(other.characteristic, characteristic) ||
                other.characteristic == characteristic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characteristic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamCommonParamsImplCopyWith<_$StreamCommonParamsImpl> get copyWith =>
      __$$StreamCommonParamsImplCopyWithImpl<_$StreamCommonParamsImpl>(
          this, _$identity);
}

abstract class _StreamCommonParams implements StreamCommonParams {
  const factory _StreamCommonParams(
          {required final BluetoothCharacteristic characteristic}) =
      _$StreamCommonParamsImpl;

  @override
  BluetoothCharacteristic get characteristic;
  @override
  @JsonKey(ignore: true)
  _$$StreamCommonParamsImplCopyWith<_$StreamCommonParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
