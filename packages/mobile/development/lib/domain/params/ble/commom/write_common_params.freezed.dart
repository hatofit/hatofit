// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WriteCommonParams {
  BluetoothCharacteristic get characteristic =>
      throw _privateConstructorUsedError;
  List<int> get value => throw _privateConstructorUsedError;
  bool get withoutResponse => throw _privateConstructorUsedError;
  bool get allowLongWrite => throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WriteCommonParamsCopyWith<WriteCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteCommonParamsCopyWith<$Res> {
  factory $WriteCommonParamsCopyWith(
          WriteCommonParams value, $Res Function(WriteCommonParams) then) =
      _$WriteCommonParamsCopyWithImpl<$Res, WriteCommonParams>;
  @useResult
  $Res call(
      {BluetoothCharacteristic characteristic,
      List<int> value,
      bool withoutResponse,
      bool allowLongWrite,
      int timeout});
}

/// @nodoc
class _$WriteCommonParamsCopyWithImpl<$Res, $Val extends WriteCommonParams>
    implements $WriteCommonParamsCopyWith<$Res> {
  _$WriteCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristic = null,
    Object? value = null,
    Object? withoutResponse = null,
    Object? allowLongWrite = null,
    Object? timeout = null,
  }) {
    return _then(_value.copyWith(
      characteristic: null == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<int>,
      withoutResponse: null == withoutResponse
          ? _value.withoutResponse
          : withoutResponse // ignore: cast_nullable_to_non_nullable
              as bool,
      allowLongWrite: null == allowLongWrite
          ? _value.allowLongWrite
          : allowLongWrite // ignore: cast_nullable_to_non_nullable
              as bool,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WriteCommonParamsImplCopyWith<$Res>
    implements $WriteCommonParamsCopyWith<$Res> {
  factory _$$WriteCommonParamsImplCopyWith(_$WriteCommonParamsImpl value,
          $Res Function(_$WriteCommonParamsImpl) then) =
      __$$WriteCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothCharacteristic characteristic,
      List<int> value,
      bool withoutResponse,
      bool allowLongWrite,
      int timeout});
}

/// @nodoc
class __$$WriteCommonParamsImplCopyWithImpl<$Res>
    extends _$WriteCommonParamsCopyWithImpl<$Res, _$WriteCommonParamsImpl>
    implements _$$WriteCommonParamsImplCopyWith<$Res> {
  __$$WriteCommonParamsImplCopyWithImpl(_$WriteCommonParamsImpl _value,
      $Res Function(_$WriteCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristic = null,
    Object? value = null,
    Object? withoutResponse = null,
    Object? allowLongWrite = null,
    Object? timeout = null,
  }) {
    return _then(_$WriteCommonParamsImpl(
      characteristic: null == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<int>,
      withoutResponse: null == withoutResponse
          ? _value.withoutResponse
          : withoutResponse // ignore: cast_nullable_to_non_nullable
              as bool,
      allowLongWrite: null == allowLongWrite
          ? _value.allowLongWrite
          : allowLongWrite // ignore: cast_nullable_to_non_nullable
              as bool,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WriteCommonParamsImpl implements _WriteCommonParams {
  const _$WriteCommonParamsImpl(
      {required this.characteristic,
      required final List<int> value,
      this.withoutResponse = false,
      this.allowLongWrite = false,
      this.timeout = 15})
      : _value = value;

  @override
  final BluetoothCharacteristic characteristic;
  final List<int> _value;
  @override
  List<int> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  @JsonKey()
  final bool withoutResponse;
  @override
  @JsonKey()
  final bool allowLongWrite;
  @override
  @JsonKey()
  final int timeout;

  @override
  String toString() {
    return 'WriteCommonParams(characteristic: $characteristic, value: $value, withoutResponse: $withoutResponse, allowLongWrite: $allowLongWrite, timeout: $timeout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WriteCommonParamsImpl &&
            (identical(other.characteristic, characteristic) ||
                other.characteristic == characteristic) &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.withoutResponse, withoutResponse) ||
                other.withoutResponse == withoutResponse) &&
            (identical(other.allowLongWrite, allowLongWrite) ||
                other.allowLongWrite == allowLongWrite) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      characteristic,
      const DeepCollectionEquality().hash(_value),
      withoutResponse,
      allowLongWrite,
      timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WriteCommonParamsImplCopyWith<_$WriteCommonParamsImpl> get copyWith =>
      __$$WriteCommonParamsImplCopyWithImpl<_$WriteCommonParamsImpl>(
          this, _$identity);
}

abstract class _WriteCommonParams implements WriteCommonParams {
  const factory _WriteCommonParams(
      {required final BluetoothCharacteristic characteristic,
      required final List<int> value,
      final bool withoutResponse,
      final bool allowLongWrite,
      final int timeout}) = _$WriteCommonParamsImpl;

  @override
  BluetoothCharacteristic get characteristic;
  @override
  List<int> get value;
  @override
  bool get withoutResponse;
  @override
  bool get allowLongWrite;
  @override
  int get timeout;
  @override
  @JsonKey(ignore: true)
  _$$WriteCommonParamsImplCopyWith<_$WriteCommonParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
