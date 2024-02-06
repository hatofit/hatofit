// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateUserParams {
  UserEntity? get user => throw _privateConstructorUsedError;
  bool get forLocal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateUserParamsCopyWith<UpdateUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserParamsCopyWith<$Res> {
  factory $UpdateUserParamsCopyWith(
          UpdateUserParams value, $Res Function(UpdateUserParams) then) =
      _$UpdateUserParamsCopyWithImpl<$Res, UpdateUserParams>;
  @useResult
  $Res call({UserEntity? user, bool forLocal});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$UpdateUserParamsCopyWithImpl<$Res, $Val extends UpdateUserParams>
    implements $UpdateUserParamsCopyWith<$Res> {
  _$UpdateUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? forLocal = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      forLocal: null == forLocal
          ? _value.forLocal
          : forLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateUserParamsImplCopyWith<$Res>
    implements $UpdateUserParamsCopyWith<$Res> {
  factory _$$UpdateUserParamsImplCopyWith(_$UpdateUserParamsImpl value,
          $Res Function(_$UpdateUserParamsImpl) then) =
      __$$UpdateUserParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserEntity? user, bool forLocal});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UpdateUserParamsImplCopyWithImpl<$Res>
    extends _$UpdateUserParamsCopyWithImpl<$Res, _$UpdateUserParamsImpl>
    implements _$$UpdateUserParamsImplCopyWith<$Res> {
  __$$UpdateUserParamsImplCopyWithImpl(_$UpdateUserParamsImpl _value,
      $Res Function(_$UpdateUserParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? forLocal = null,
  }) {
    return _then(_$UpdateUserParamsImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      forLocal: null == forLocal
          ? _value.forLocal
          : forLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateUserParamsImpl implements _UpdateUserParams {
  const _$UpdateUserParamsImpl({this.user = null, this.forLocal = true});

  @override
  @JsonKey()
  final UserEntity? user;
  @override
  @JsonKey()
  final bool forLocal;

  @override
  String toString() {
    return 'UpdateUserParams(user: $user, forLocal: $forLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserParamsImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.forLocal, forLocal) ||
                other.forLocal == forLocal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, forLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserParamsImplCopyWith<_$UpdateUserParamsImpl> get copyWith =>
      __$$UpdateUserParamsImplCopyWithImpl<_$UpdateUserParamsImpl>(
          this, _$identity);
}

abstract class _UpdateUserParams implements UpdateUserParams {
  const factory _UpdateUserParams(
      {final UserEntity? user, final bool forLocal}) = _$UpdateUserParamsImpl;

  @override
  UserEntity? get user;
  @override
  bool get forLocal;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUserParamsImplCopyWith<_$UpdateUserParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
