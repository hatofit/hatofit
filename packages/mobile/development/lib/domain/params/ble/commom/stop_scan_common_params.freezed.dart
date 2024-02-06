// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_scan_common_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StopScanCommonParams {
  StreamSubscription<dynamic> get subscription =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StopScanCommonParamsCopyWith<StopScanCommonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopScanCommonParamsCopyWith<$Res> {
  factory $StopScanCommonParamsCopyWith(StopScanCommonParams value,
          $Res Function(StopScanCommonParams) then) =
      _$StopScanCommonParamsCopyWithImpl<$Res, StopScanCommonParams>;
  @useResult
  $Res call({StreamSubscription<dynamic> subscription});
}

/// @nodoc
class _$StopScanCommonParamsCopyWithImpl<$Res,
        $Val extends StopScanCommonParams>
    implements $StopScanCommonParamsCopyWith<$Res> {
  _$StopScanCommonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_value.copyWith(
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StopScanCommonParamsImplCopyWith<$Res>
    implements $StopScanCommonParamsCopyWith<$Res> {
  factory _$$StopScanCommonParamsImplCopyWith(_$StopScanCommonParamsImpl value,
          $Res Function(_$StopScanCommonParamsImpl) then) =
      __$$StopScanCommonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StreamSubscription<dynamic> subscription});
}

/// @nodoc
class __$$StopScanCommonParamsImplCopyWithImpl<$Res>
    extends _$StopScanCommonParamsCopyWithImpl<$Res, _$StopScanCommonParamsImpl>
    implements _$$StopScanCommonParamsImplCopyWith<$Res> {
  __$$StopScanCommonParamsImplCopyWithImpl(_$StopScanCommonParamsImpl _value,
      $Res Function(_$StopScanCommonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_$StopScanCommonParamsImpl(
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>,
    ));
  }
}

/// @nodoc

class _$StopScanCommonParamsImpl implements _StopScanCommonParams {
  const _$StopScanCommonParamsImpl({required this.subscription});

  @override
  final StreamSubscription<dynamic> subscription;

  @override
  String toString() {
    return 'StopScanCommonParams(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopScanCommonParamsImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopScanCommonParamsImplCopyWith<_$StopScanCommonParamsImpl>
      get copyWith =>
          __$$StopScanCommonParamsImplCopyWithImpl<_$StopScanCommonParamsImpl>(
              this, _$identity);
}

abstract class _StopScanCommonParams implements StopScanCommonParams {
  const factory _StopScanCommonParams(
          {required final StreamSubscription<dynamic> subscription}) =
      _$StopScanCommonParamsImpl;

  @override
  StreamSubscription<dynamic> get subscription;
  @override
  @JsonKey(ignore: true)
  _$$StopScanCommonParamsImplCopyWith<_$StopScanCommonParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
