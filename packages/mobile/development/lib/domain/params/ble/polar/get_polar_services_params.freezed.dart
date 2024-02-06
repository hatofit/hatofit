// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_polar_services_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetPolarServicesParams {
  String get deviceId => throw _privateConstructorUsedError;
  PolarSdkFeature get feature => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetPolarServicesParamsCopyWith<GetPolarServicesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPolarServicesParamsCopyWith<$Res> {
  factory $GetPolarServicesParamsCopyWith(GetPolarServicesParams value,
          $Res Function(GetPolarServicesParams) then) =
      _$GetPolarServicesParamsCopyWithImpl<$Res, GetPolarServicesParams>;
  @useResult
  $Res call({String deviceId, PolarSdkFeature feature});
}

/// @nodoc
class _$GetPolarServicesParamsCopyWithImpl<$Res,
        $Val extends GetPolarServicesParams>
    implements $GetPolarServicesParamsCopyWith<$Res> {
  _$GetPolarServicesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? feature = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as PolarSdkFeature,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPolarServicesParamsImplCopyWith<$Res>
    implements $GetPolarServicesParamsCopyWith<$Res> {
  factory _$$GetPolarServicesParamsImplCopyWith(
          _$GetPolarServicesParamsImpl value,
          $Res Function(_$GetPolarServicesParamsImpl) then) =
      __$$GetPolarServicesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, PolarSdkFeature feature});
}

/// @nodoc
class __$$GetPolarServicesParamsImplCopyWithImpl<$Res>
    extends _$GetPolarServicesParamsCopyWithImpl<$Res,
        _$GetPolarServicesParamsImpl>
    implements _$$GetPolarServicesParamsImplCopyWith<$Res> {
  __$$GetPolarServicesParamsImplCopyWithImpl(
      _$GetPolarServicesParamsImpl _value,
      $Res Function(_$GetPolarServicesParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? feature = null,
  }) {
    return _then(_$GetPolarServicesParamsImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as PolarSdkFeature,
    ));
  }
}

/// @nodoc

class _$GetPolarServicesParamsImpl implements _GetPolarServicesParams {
  const _$GetPolarServicesParamsImpl(
      {required this.deviceId, required this.feature});

  @override
  final String deviceId;
  @override
  final PolarSdkFeature feature;

  @override
  String toString() {
    return 'GetPolarServicesParams(deviceId: $deviceId, feature: $feature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPolarServicesParamsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.feature, feature) || other.feature == feature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, feature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPolarServicesParamsImplCopyWith<_$GetPolarServicesParamsImpl>
      get copyWith => __$$GetPolarServicesParamsImplCopyWithImpl<
          _$GetPolarServicesParamsImpl>(this, _$identity);
}

abstract class _GetPolarServicesParams implements GetPolarServicesParams {
  const factory _GetPolarServicesParams(
      {required final String deviceId,
      required final PolarSdkFeature feature}) = _$GetPolarServicesParamsImpl;

  @override
  String get deviceId;
  @override
  PolarSdkFeature get feature;
  @override
  @JsonKey(ignore: true)
  _$$GetPolarServicesParamsImplCopyWith<_$GetPolarServicesParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
