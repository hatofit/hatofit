// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterResponseEntity {
  bool? get success => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterResponseEntityCopyWith<RegisterResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseEntityCopyWith<$Res> {
  factory $RegisterResponseEntityCopyWith(RegisterResponseEntity value,
          $Res Function(RegisterResponseEntity) then) =
      _$RegisterResponseEntityCopyWithImpl<$Res, RegisterResponseEntity>;
  @useResult
  $Res call({bool? success, String? token, UserEntity? user, String? message});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$RegisterResponseEntityCopyWithImpl<$Res,
        $Val extends RegisterResponseEntity>
    implements $RegisterResponseEntityCopyWith<$Res> {
  _$RegisterResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$RegisterResponseEntityImplCopyWith<$Res>
    implements $RegisterResponseEntityCopyWith<$Res> {
  factory _$$RegisterResponseEntityImplCopyWith(
          _$RegisterResponseEntityImpl value,
          $Res Function(_$RegisterResponseEntityImpl) then) =
      __$$RegisterResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? token, UserEntity? user, String? message});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$RegisterResponseEntityImplCopyWithImpl<$Res>
    extends _$RegisterResponseEntityCopyWithImpl<$Res,
        _$RegisterResponseEntityImpl>
    implements _$$RegisterResponseEntityImplCopyWith<$Res> {
  __$$RegisterResponseEntityImplCopyWithImpl(
      _$RegisterResponseEntityImpl _value,
      $Res Function(_$RegisterResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$RegisterResponseEntityImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegisterResponseEntityImpl implements _RegisterResponseEntity {
  const _$RegisterResponseEntityImpl(
      {this.success, this.token, this.user, this.message});

  @override
  final bool? success;
  @override
  final String? token;
  @override
  final UserEntity? user;
  @override
  final String? message;

  @override
  String toString() {
    return 'RegisterResponseEntity(success: $success, token: $token, user: $user, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseEntityImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, token, user, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseEntityImplCopyWith<_$RegisterResponseEntityImpl>
      get copyWith => __$$RegisterResponseEntityImplCopyWithImpl<
          _$RegisterResponseEntityImpl>(this, _$identity);
}

abstract class _RegisterResponseEntity implements RegisterResponseEntity {
  const factory _RegisterResponseEntity(
      {final bool? success,
      final String? token,
      final UserEntity? user,
      final String? message}) = _$RegisterResponseEntityImpl;

  @override
  bool? get success;
  @override
  String? get token;
  @override
  UserEntity? get user;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$RegisterResponseEntityImplCopyWith<_$RegisterResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
