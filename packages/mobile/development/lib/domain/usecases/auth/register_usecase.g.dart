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
      dateOfBirth: json['dateOfBirth'] as String? ?? "",
      photo: json['photo'] as String? ?? "",
      height: json['height'] as String? ?? "",
      weight: json['weight'] as String? ?? "",
      metricUnitsParams: json['metricUnitsParams'] == null
          ? null
          : MetricUnitsParams.fromJson(
              json['metricUnitsParams'] as Map<String, dynamic>),
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
      'dateOfBirth': instance.dateOfBirth,
      'photo': instance.photo,
      'height': instance.height,
      'weight': instance.weight,
      'metricUnitsParams': instance.metricUnitsParams,
    };

_$MetricUnitsParamsImpl _$$MetricUnitsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$MetricUnitsParamsImpl(
      energyUnits: json['energyUnits'] as String? ?? "",
      heightUnits: json['heightUnits'] as String? ?? "",
      weightUnits: json['weightUnits'] as String? ?? "",
    );

Map<String, dynamic> _$$MetricUnitsParamsImplToJson(
        _$MetricUnitsParamsImpl instance) =>
    <String, dynamic>{
      'energyUnits': instance.energyUnits,
      'heightUnits': instance.heightUnits,
      'weightUnits': instance.weightUnits,
    };
