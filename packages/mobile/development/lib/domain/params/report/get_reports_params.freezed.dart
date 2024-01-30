// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_reports_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetReportsParams _$GetReportsParamsFromJson(Map<String, dynamic> json) {
  return _GetReportsParams.fromJson(json);
}

/// @nodoc
mixin _$GetReportsParams {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetReportsParamsCopyWith<GetReportsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReportsParamsCopyWith<$Res> {
  factory $GetReportsParamsCopyWith(
          GetReportsParams value, $Res Function(GetReportsParams) then) =
      _$GetReportsParamsCopyWithImpl<$Res, GetReportsParams>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class _$GetReportsParamsCopyWithImpl<$Res, $Val extends GetReportsParams>
    implements $GetReportsParamsCopyWith<$Res> {
  _$GetReportsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$GetReportsParamsImplCopyWith<$Res>
    implements $GetReportsParamsCopyWith<$Res> {
  factory _$$GetReportsParamsImplCopyWith(_$GetReportsParamsImpl value,
          $Res Function(_$GetReportsParamsImpl) then) =
      __$$GetReportsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetReportsParamsImplCopyWithImpl<$Res>
    extends _$GetReportsParamsCopyWithImpl<$Res, _$GetReportsParamsImpl>
    implements _$$GetReportsParamsImplCopyWith<$Res> {
  __$$GetReportsParamsImplCopyWithImpl(_$GetReportsParamsImpl _value,
      $Res Function(_$GetReportsParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetReportsParamsImpl(
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
class _$GetReportsParamsImpl implements _GetReportsParams {
  const _$GetReportsParamsImpl({this.page = 0, this.limit = 5});

  factory _$GetReportsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReportsParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'GetReportsParams(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReportsParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReportsParamsImplCopyWith<_$GetReportsParamsImpl> get copyWith =>
      __$$GetReportsParamsImplCopyWithImpl<_$GetReportsParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetReportsParamsImplToJson(
      this,
    );
  }
}

abstract class _GetReportsParams implements GetReportsParams {
  const factory _GetReportsParams({final int page, final int limit}) =
      _$GetReportsParamsImpl;

  factory _GetReportsParams.fromJson(Map<String, dynamic> json) =
      _$GetReportsParamsImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetReportsParamsImplCopyWith<_$GetReportsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
