// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      password: json['password'] as String,
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      photo: json['photo'] as String?,
      metricUnits: json['metricUnits'] == null
          ? null
          : MetricsUnits.fromJson(json['metricUnits'] as Map<String, dynamic>),
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'confirmPassword': instance.confirmPassword,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'photo': instance.photo,
      'metricUnits': instance.metricUnits?.toJson(),
      'height': instance.height,
      'weight': instance.weight,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

MetricsUnits _$MetricsUnitsFromJson(Map<String, dynamic> json) => MetricsUnits(
      json['energyUnits'] as String,
      json['heightUnits'] as String,
      json['weightUnits'] as String,
    );

Map<String, dynamic> _$MetricsUnitsToJson(MetricsUnits instance) =>
    <String, dynamic>{
      'energyUnits': instance.energyUnits,
      'heightUnits': instance.heightUnits,
      'weightUnits': instance.weightUnits,
    };
