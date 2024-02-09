// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'by_limit_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ByLimitParams _$ByLimitParamsFromJson(Map<String, dynamic> json) {
  return _ByLimitParams.fromJson(json);
}

/// @nodoc
mixin _$ByLimitParams {
  bool? get showFromCompany => throw _privateConstructorUsedError;
  bool? get showFromLocal => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ByLimitParamsCopyWith<ByLimitParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ByLimitParamsCopyWith<$Res> {
  factory $ByLimitParamsCopyWith(
          ByLimitParams value, $Res Function(ByLimitParams) then) =
      _$ByLimitParamsCopyWithImpl<$Res, ByLimitParams>;
  @useResult
  $Res call({bool? showFromCompany, bool? showFromLocal, int page, int limit});
}

/// @nodoc
class _$ByLimitParamsCopyWithImpl<$Res, $Val extends ByLimitParams>
    implements $ByLimitParamsCopyWith<$Res> {
  _$ByLimitParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showFromCompany = freezed,
    Object? showFromLocal = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      showFromCompany: freezed == showFromCompany
          ? _value.showFromCompany
          : showFromCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      showFromLocal: freezed == showFromLocal
          ? _value.showFromLocal
          : showFromLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ByLimitParamsImplCopyWith<$Res>
    implements $ByLimitParamsCopyWith<$Res> {
  factory _$$ByLimitParamsImplCopyWith(
          _$ByLimitParamsImpl value, $Res Function(_$ByLimitParamsImpl) then) =
      __$$ByLimitParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? showFromCompany, bool? showFromLocal, int page, int limit});
}

/// @nodoc
class __$$ByLimitParamsImplCopyWithImpl<$Res>
    extends _$ByLimitParamsCopyWithImpl<$Res, _$ByLimitParamsImpl>
    implements _$$ByLimitParamsImplCopyWith<$Res> {
  __$$ByLimitParamsImplCopyWithImpl(
      _$ByLimitParamsImpl _value, $Res Function(_$ByLimitParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showFromCompany = freezed,
    Object? showFromLocal = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$ByLimitParamsImpl(
      showFromCompany: freezed == showFromCompany
          ? _value.showFromCompany
          : showFromCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      showFromLocal: freezed == showFromLocal
          ? _value.showFromLocal
          : showFromLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ByLimitParamsImpl implements _ByLimitParams {
  const _$ByLimitParamsImpl(
      {this.showFromCompany,
      this.showFromLocal,
      this.page = 0,
      this.limit = 10});

  factory _$ByLimitParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ByLimitParamsImplFromJson(json);

  @override
  final bool? showFromCompany;
  @override
  final bool? showFromLocal;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'ByLimitParams(showFromCompany: $showFromCompany, showFromLocal: $showFromLocal, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByLimitParamsImpl &&
            (identical(other.showFromCompany, showFromCompany) ||
                other.showFromCompany == showFromCompany) &&
            (identical(other.showFromLocal, showFromLocal) ||
                other.showFromLocal == showFromLocal) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, showFromCompany, showFromLocal, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ByLimitParamsImplCopyWith<_$ByLimitParamsImpl> get copyWith =>
      __$$ByLimitParamsImplCopyWithImpl<_$ByLimitParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ByLimitParamsImplToJson(
      this,
    );
  }
}

abstract class _ByLimitParams implements ByLimitParams {
  const factory _ByLimitParams(
      {final bool? showFromCompany,
      final bool? showFromLocal,
      final int page,
      final int limit}) = _$ByLimitParamsImpl;

  factory _ByLimitParams.fromJson(Map<String, dynamic> json) =
      _$ByLimitParamsImpl.fromJson;

  @override
  bool? get showFromCompany;
  @override
  bool? get showFromLocal;
  @override
  int get page;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$ByLimitParamsImplCopyWith<_$ByLimitParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
