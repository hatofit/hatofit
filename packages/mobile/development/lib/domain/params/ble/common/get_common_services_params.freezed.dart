// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_common_services_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetCommonServicesParams {
  BluetoothDevice get device => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCommonServicesParamsCopyWith<GetCommonServicesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCommonServicesParamsCopyWith<$Res> {
  factory $GetCommonServicesParamsCopyWith(GetCommonServicesParams value,
          $Res Function(GetCommonServicesParams) then) =
      _$GetCommonServicesParamsCopyWithImpl<$Res, GetCommonServicesParams>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class _$GetCommonServicesParamsCopyWithImpl<$Res,
        $Val extends GetCommonServicesParams>
    implements $GetCommonServicesParamsCopyWith<$Res> {
  _$GetCommonServicesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCommonServicesParamsImplCopyWith<$Res>
    implements $GetCommonServicesParamsCopyWith<$Res> {
  factory _$$GetCommonServicesParamsImplCopyWith(
          _$GetCommonServicesParamsImpl value,
          $Res Function(_$GetCommonServicesParamsImpl) then) =
      __$$GetCommonServicesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$GetCommonServicesParamsImplCopyWithImpl<$Res>
    extends _$GetCommonServicesParamsCopyWithImpl<$Res,
        _$GetCommonServicesParamsImpl>
    implements _$$GetCommonServicesParamsImplCopyWith<$Res> {
  __$$GetCommonServicesParamsImplCopyWithImpl(
      _$GetCommonServicesParamsImpl _value,
      $Res Function(_$GetCommonServicesParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$GetCommonServicesParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
    ));
  }
}

/// @nodoc

class _$GetCommonServicesParamsImpl implements _GetCommonServicesParams {
  const _$GetCommonServicesParamsImpl({required this.device});

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'GetCommonServicesParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCommonServicesParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCommonServicesParamsImplCopyWith<_$GetCommonServicesParamsImpl>
      get copyWith => __$$GetCommonServicesParamsImplCopyWithImpl<
          _$GetCommonServicesParamsImpl>(this, _$identity);
}

abstract class _GetCommonServicesParams implements GetCommonServicesParams {
  const factory _GetCommonServicesParams(
      {required final BluetoothDevice device}) = _$GetCommonServicesParamsImpl;

  @override
  BluetoothDevice get device;
  @override
  @JsonKey(ignore: true)
  _$$GetCommonServicesParamsImplCopyWith<_$GetCommonServicesParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
