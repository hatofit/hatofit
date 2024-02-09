// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadCommonParams {
  BluetoothCharacteristic get characteristic =>
      throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadCommonParamsCopyWith<ReadCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadCommonParamsCopyWith<$Res> {
  factory $ReadCommonParamsCopyWith(
          ReadCommonParams value, $Res Function(ReadCommonParams) then) =
      _$ReadCommonParamsCopyWithImpl<$Res, ReadCommonParams>;
  @useResult
  $Res call({BluetoothCharacteristic characteristic, int timeout});
}

/// @nodoc
class _$ReadCommonParamsCopyWithImpl<$Res, $Val extends ReadCommonParams>
    implements $ReadCommonParamsCopyWith<$Res> {
  _$ReadCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristic = null,
    Object? timeout = null,
  }) {
    return _then(_value.copyWith(
      characteristic: null == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadCommonParamsImplCopyWith<$Res>
    implements $ReadCommonParamsCopyWith<$Res> {
  factory _$$ReadCommonParamsImplCopyWith(_$ReadCommonParamsImpl value,
          $Res Function(_$ReadCommonParamsImpl) then) =
      __$$ReadCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothCharacteristic characteristic, int timeout});
}

/// @nodoc
class __$$ReadCommonParamsImplCopyWithImpl<$Res>
    extends _$ReadCommonParamsCopyWithImpl<$Res, _$ReadCommonParamsImpl>
    implements _$$ReadCommonParamsImplCopyWith<$Res> {
  __$$ReadCommonParamsImplCopyWithImpl(_$ReadCommonParamsImpl _value,
      $Res Function(_$ReadCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristic = null,
    Object? timeout = null,
  }) {
    return _then(_$ReadCommonParamsImpl(
      characteristic: null == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReadCommonParamsImpl implements _ReadCommonParams {
  const _$ReadCommonParamsImpl(
      {required this.characteristic, this.timeout = 15});

  @override
  final BluetoothCharacteristic characteristic;
  @override
  @JsonKey()
  final int timeout;

  @override
  String toString() {
    return 'ReadCommonParams(characteristic: $characteristic, timeout: $timeout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadCommonParamsImpl &&
            (identical(other.characteristic, characteristic) ||
                other.characteristic == characteristic) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characteristic, timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadCommonParamsImplCopyWith<_$ReadCommonParamsImpl> get copyWith =>
      __$$ReadCommonParamsImplCopyWithImpl<_$ReadCommonParamsImpl>(
          this, _$identity);
}

abstract class _ReadCommonParams implements ReadCommonParams {
  const factory _ReadCommonParams(
      {required final BluetoothCharacteristic characteristic,
      final int timeout}) = _$ReadCommonParamsImpl;

  @override
  BluetoothCharacteristic get characteristic;
  @override
  int get timeout;
  @override
  @JsonKey(ignore: true)
  _$$ReadCommonParamsImplCopyWith<_$ReadCommonParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
