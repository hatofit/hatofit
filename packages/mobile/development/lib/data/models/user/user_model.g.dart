// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      photo: json['photo'] as String?,
      metricUnits: json['metricUnits'] == null
          ? null
          : UserMetricUnitsModel.fromJson(
              json['metricUnits'] as Map<String, dynamic>),
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'photo': instance.photo,
      'metricUnits': instance.metricUnits?.toJson(),
      'height': instance.height,
      'weight': instance.weight,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$UserMetricUnitsModelImpl _$$UserMetricUnitsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserMetricUnitsModelImpl(
      energyUnits: json['energyUnits'] as String?,
      heightUnits: json['heightUnits'] as String?,
      weightUnits: json['weightUnits'] as String?,
    );

Map<String, dynamic> _$$UserMetricUnitsModelImplToJson(
        _$UserMetricUnitsModelImpl instance) =>
    <String, dynamic>{
      'energyUnits': instance.energyUnits,
      'heightUnits': instance.heightUnits,
      'weightUnits': instance.weightUnits,
    };
