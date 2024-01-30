// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_sessions_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSessionsParams _$GetSessionsParamsFromJson(Map<String, dynamic> json) {
  return _GetSessionsParams.fromJson(json);
}

/// @nodoc
mixin _$GetSessionsParams {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSessionsParamsCopyWith<GetSessionsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSessionsParamsCopyWith<$Res> {
  factory $GetSessionsParamsCopyWith(
          GetSessionsParams value, $Res Function(GetSessionsParams) then) =
      _$GetSessionsParamsCopyWithImpl<$Res, GetSessionsParams>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class _$GetSessionsParamsCopyWithImpl<$Res, $Val extends GetSessionsParams>
    implements $GetSessionsParamsCopyWith<$Res> {
  _$GetSessionsParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$GetSessionsParamsImplCopyWith<$Res>
    implements $GetSessionsParamsCopyWith<$Res> {
  factory _$$GetSessionsParamsImplCopyWith(_$GetSessionsParamsImpl value,
          $Res Function(_$GetSessionsParamsImpl) then) =
      __$$GetSessionsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetSessionsParamsImplCopyWithImpl<$Res>
    extends _$GetSessionsParamsCopyWithImpl<$Res, _$GetSessionsParamsImpl>
    implements _$$GetSessionsParamsImplCopyWith<$Res> {
  __$$GetSessionsParamsImplCopyWithImpl(_$GetSessionsParamsImpl _value,
      $Res Function(_$GetSessionsParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetSessionsParamsImpl(
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
class _$GetSessionsParamsImpl implements _GetSessionsParams {
  const _$GetSessionsParamsImpl({this.page = 0, this.limit = 10});

  factory _$GetSessionsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSessionsParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'GetSessionsParams(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSessionsParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSessionsParamsImplCopyWith<_$GetSessionsParamsImpl> get copyWith =>
      __$$GetSessionsParamsImplCopyWithImpl<_$GetSessionsParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSessionsParamsImplToJson(
      this,
    );
  }
}

abstract class _GetSessionsParams implements GetSessionsParams {
  const factory _GetSessionsParams({final int page, final int limit}) =
      _$GetSessionsParamsImpl;

  factory _GetSessionsParams.fromJson(Map<String, dynamic> json) =
      _$GetSessionsParamsImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetSessionsParamsImplCopyWith<_$GetSessionsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
