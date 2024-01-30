// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForgotPasswordParams _$ForgotPasswordParamsFromJson(Map<String, dynamic> json) {
  return _ForgotPasswordParams.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordParams {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordParamsCopyWith<ForgotPasswordParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordParamsCopyWith<$Res> {
  factory $ForgotPasswordParamsCopyWith(ForgotPasswordParams value,
          $Res Function(ForgotPasswordParams) then) =
      _$ForgotPasswordParamsCopyWithImpl<$Res, ForgotPasswordParams>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordParamsCopyWithImpl<$Res,
        $Val extends ForgotPasswordParams>
    implements $ForgotPasswordParamsCopyWith<$Res> {
  _$ForgotPasswordParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordParamsImplCopyWith<$Res>
    implements $ForgotPasswordParamsCopyWith<$Res> {
  factory _$$ForgotPasswordParamsImplCopyWith(_$ForgotPasswordParamsImpl value,
          $Res Function(_$ForgotPasswordParamsImpl) then) =
      __$$ForgotPasswordParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordParamsImplCopyWithImpl<$Res>
    extends _$ForgotPasswordParamsCopyWithImpl<$Res, _$ForgotPasswordParamsImpl>
    implements _$$ForgotPasswordParamsImplCopyWith<$Res> {
  __$$ForgotPasswordParamsImplCopyWithImpl(_$ForgotPasswordParamsImpl _value,
      $Res Function(_$ForgotPasswordParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordParamsImpl implements _ForgotPasswordParams {
  const _$ForgotPasswordParamsImpl({this.email = ""});

  factory _$ForgotPasswordParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordParamsImplFromJson(json);

  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordParams(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordParamsImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordParamsImplCopyWith<_$ForgotPasswordParamsImpl>
      get copyWith =>
          __$$ForgotPasswordParamsImplCopyWithImpl<_$ForgotPasswordParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordParamsImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordParams implements ForgotPasswordParams {
  const factory _ForgotPasswordParams({final String email}) =
      _$ForgotPasswordParamsImpl;

  factory _ForgotPasswordParams.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordParamsImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordParamsImplCopyWith<_$ForgotPasswordParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
