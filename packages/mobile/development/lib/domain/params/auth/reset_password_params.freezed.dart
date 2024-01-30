// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordParams _$ResetPasswordParamsFromJson(Map<String, dynamic> json) {
  return _ResetPasswordParams.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordParamsCopyWith<ResetPasswordParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordParamsCopyWith<$Res> {
  factory $ResetPasswordParamsCopyWith(
          ResetPasswordParams value, $Res Function(ResetPasswordParams) then) =
      _$ResetPasswordParamsCopyWithImpl<$Res, ResetPasswordParams>;
  @useResult
  $Res call(
      {String email, String password, String confirmPassword, String code});
}

/// @nodoc
class _$ResetPasswordParamsCopyWithImpl<$Res, $Val extends ResetPasswordParams>
    implements $ResetPasswordParamsCopyWith<$Res> {
  _$ResetPasswordParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordParamsImplCopyWith<$Res>
    implements $ResetPasswordParamsCopyWith<$Res> {
  factory _$$ResetPasswordParamsImplCopyWith(_$ResetPasswordParamsImpl value,
          $Res Function(_$ResetPasswordParamsImpl) then) =
      __$$ResetPasswordParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String password, String confirmPassword, String code});
}

/// @nodoc
class __$$ResetPasswordParamsImplCopyWithImpl<$Res>
    extends _$ResetPasswordParamsCopyWithImpl<$Res, _$ResetPasswordParamsImpl>
    implements _$$ResetPasswordParamsImplCopyWith<$Res> {
  __$$ResetPasswordParamsImplCopyWithImpl(_$ResetPasswordParamsImpl _value,
      $Res Function(_$ResetPasswordParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? code = null,
  }) {
    return _then(_$ResetPasswordParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordParamsImpl implements _ResetPasswordParams {
  const _$ResetPasswordParamsImpl(
      {this.email = "",
      this.password = "",
      this.confirmPassword = "",
      this.code = ""});

  factory _$ResetPasswordParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordParamsImplFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'ResetPasswordParams(email: $email, password: $password, confirmPassword: $confirmPassword, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, confirmPassword, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordParamsImplCopyWith<_$ResetPasswordParamsImpl> get copyWith =>
      __$$ResetPasswordParamsImplCopyWithImpl<_$ResetPasswordParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordParamsImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordParams implements ResetPasswordParams {
  const factory _ResetPasswordParams(
      {final String email,
      final String password,
      final String confirmPassword,
      final String code}) = _$ResetPasswordParamsImpl;

  factory _ResetPasswordParams.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordParamsImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordParamsImplCopyWith<_$ResetPasswordParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
