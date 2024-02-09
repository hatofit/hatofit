// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_scan_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StartScanCommonParams {
  List<Guid> get serviceIds => throw _privateConstructorUsedError;
  Duration? get timeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartScanCommonParamsCopyWith<StartScanCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartScanCommonParamsCopyWith<$Res> {
  factory $StartScanCommonParamsCopyWith(StartScanCommonParams value,
          $Res Function(StartScanCommonParams) then) =
      _$StartScanCommonParamsCopyWithImpl<$Res, StartScanCommonParams>;
  @useResult
  $Res call({List<Guid> serviceIds, Duration? timeout});
}

/// @nodoc
class _$StartScanCommonParamsCopyWithImpl<$Res,
        $Val extends StartScanCommonParams>
    implements $StartScanCommonParamsCopyWith<$Res> {
  _$StartScanCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceIds = null,
    Object? timeout = freezed,
  }) {
    return _then(_value.copyWith(
      serviceIds: null == serviceIds
          ? _value.serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<Guid>,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartScanCommonParamsImplCopyWith<$Res>
    implements $StartScanCommonParamsCopyWith<$Res> {
  factory _$$StartScanCommonParamsImplCopyWith(
          _$StartScanCommonParamsImpl value,
          $Res Function(_$StartScanCommonParamsImpl) then) =
      __$$StartScanCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Guid> serviceIds, Duration? timeout});
}

/// @nodoc
class __$$StartScanCommonParamsImplCopyWithImpl<$Res>
    extends _$StartScanCommonParamsCopyWithImpl<$Res,
        _$StartScanCommonParamsImpl>
    implements _$$StartScanCommonParamsImplCopyWith<$Res> {
  __$$StartScanCommonParamsImplCopyWithImpl(_$StartScanCommonParamsImpl _value,
      $Res Function(_$StartScanCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceIds = null,
    Object? timeout = freezed,
  }) {
    return _then(_$StartScanCommonParamsImpl(
      serviceIds: null == serviceIds
          ? _value._serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<Guid>,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$StartScanCommonParamsImpl implements _StartScanCommonParams {
  const _$StartScanCommonParamsImpl(
      {final List<Guid> serviceIds = const [], this.timeout = null})
      : _serviceIds = serviceIds;

  final List<Guid> _serviceIds;
  @override
  @JsonKey()
  List<Guid> get serviceIds {
    if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceIds);
  }

  @override
  @JsonKey()
  final Duration? timeout;

  @override
  String toString() {
    return 'StartScanCommonParams(serviceIds: $serviceIds, timeout: $timeout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartScanCommonParamsImpl &&
            const DeepCollectionEquality()
                .equals(other._serviceIds, _serviceIds) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceIds), timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartScanCommonParamsImplCopyWith<_$StartScanCommonParamsImpl>
      get copyWith => __$$StartScanCommonParamsImplCopyWithImpl<
          _$StartScanCommonParamsImpl>(this, _$identity);
}

abstract class _StartScanCommonParams implements StartScanCommonParams {
  const factory _StartScanCommonParams(
      {final List<Guid> serviceIds,
      final Duration? timeout}) = _$StartScanCommonParamsImpl;

  @override
  List<Guid> get serviceIds;
  @override
  Duration? get timeout;
  @override
  @JsonKey(ignore: true)
  _$$StartScanCommonParamsImplCopyWith<_$StartScanCommonParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
