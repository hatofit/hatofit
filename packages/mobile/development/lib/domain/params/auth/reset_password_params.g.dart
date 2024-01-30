// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordParamsImpl _$$ResetPasswordParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordParamsImpl(
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      confirmPassword: json['confirmPassword'] as String? ?? "",
      code: json['code'] as String? ?? "",
    );

Map<String, dynamic> _$$ResetPasswordParamsImplToJson(
        _$ResetPasswordParamsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'code': instance.code,
    };
