// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_exercises_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetExercisesParams _$GetExercisesParamsFromJson(Map<String, dynamic> json) {
  return _GetExercisesParams.fromJson(json);
}

/// @nodoc
mixin _$GetExercisesParams {
  bool get showFromCompany => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetExercisesParamsCopyWith<GetExercisesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExercisesParamsCopyWith<$Res> {
  factory $GetExercisesParamsCopyWith(
          GetExercisesParams value, $Res Function(GetExercisesParams) then) =
      _$GetExercisesParamsCopyWithImpl<$Res, GetExercisesParams>;
  @useResult
  $Res call({bool showFromCompany, int page, int limit});
}

/// @nodoc
class _$GetExercisesParamsCopyWithImpl<$Res, $Val extends GetExercisesParams>
    implements $GetExercisesParamsCopyWith<$Res> {
  _$GetExercisesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showFromCompany = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      showFromCompany: null == showFromCompany
          ? _value.showFromCompany
          : showFromCompany // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$GetExercisesParamsImplCopyWith<$Res>
    implements $GetExercisesParamsCopyWith<$Res> {
  factory _$$GetExercisesParamsImplCopyWith(_$GetExercisesParamsImpl value,
          $Res Function(_$GetExercisesParamsImpl) then) =
      __$$GetExercisesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showFromCompany, int page, int limit});
}

/// @nodoc
class __$$GetExercisesParamsImplCopyWithImpl<$Res>
    extends _$GetExercisesParamsCopyWithImpl<$Res, _$GetExercisesParamsImpl>
    implements _$$GetExercisesParamsImplCopyWith<$Res> {
  __$$GetExercisesParamsImplCopyWithImpl(_$GetExercisesParamsImpl _value,
      $Res Function(_$GetExercisesParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showFromCompany = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetExercisesParamsImpl(
      showFromCompany: null == showFromCompany
          ? _value.showFromCompany
          : showFromCompany // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$GetExercisesParamsImpl implements _GetExercisesParams {
  const _$GetExercisesParamsImpl(
      {this.showFromCompany = false, this.page = 0, this.limit = 10});

  factory _$GetExercisesParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetExercisesParamsImplFromJson(json);

  @override
  @JsonKey()
  final bool showFromCompany;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'GetExercisesParams(showFromCompany: $showFromCompany, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExercisesParamsImpl &&
            (identical(other.showFromCompany, showFromCompany) ||
                other.showFromCompany == showFromCompany) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, showFromCompany, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExercisesParamsImplCopyWith<_$GetExercisesParamsImpl> get copyWith =>
      __$$GetExercisesParamsImplCopyWithImpl<_$GetExercisesParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetExercisesParamsImplToJson(
      this,
    );
  }
}

abstract class _GetExercisesParams implements GetExercisesParams {
  const factory _GetExercisesParams(
      {final bool showFromCompany,
      final int page,
      final int limit}) = _$GetExercisesParamsImpl;

  factory _GetExercisesParams.fromJson(Map<String, dynamic> json) =
      _$GetExercisesParamsImpl.fromJson;

  @override
  bool get showFromCompany;
  @override
  int get page;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetExercisesParamsImplCopyWith<_$GetExercisesParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
