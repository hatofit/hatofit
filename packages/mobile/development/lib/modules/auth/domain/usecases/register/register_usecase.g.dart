// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      firstName: json['firstName'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      confirmPassword: json['confirmPassword'] as String? ?? "",
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      photo: json['photo'] as String? ?? "",
      metricUnits: json['metricUnits'] == null
          ? const MetricUnitsModel()
          : MetricUnitsModel.fromJson(
              json['metricUnits'] as Map<String, dynamic>),
      height: json['height'] as int? ?? 0,
      weight: json['weight'] as int? ?? 0,
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'photo': instance.photo,
      'metricUnits': instance.metricUnits,
      'height': instance.height,
      'weight': instance.weight,
    };
