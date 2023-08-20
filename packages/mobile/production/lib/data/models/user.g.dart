// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      password: json['password'] as String,
      id: json['id'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      photo: json['photo'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      metricUnits: json['metricUnits'] == null
          ? null
          : MetricsUnits.fromJson(json['metricUnits'] as Map<String, dynamic>),
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
      'confirmPassword': instance.confirmPassword,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'photo': instance.photo,
      'height': instance.height,
      'weight': instance.weight,
      'metricUnits': instance.metricUnits,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

MetricsUnits _$MetricsUnitsFromJson(Map<String, dynamic> json) => MetricsUnits(
      energyUnits: $enumDecode(_$EnergyUnitsEnumMap, json['energyUnits']),
      heightUnits: $enumDecode(_$HeightUnitsEnumMap, json['heightUnits']),
      weightUnits: $enumDecode(_$WeightUnitsEnumMap, json['weightUnits']),
    );

Map<String, dynamic> _$MetricsUnitsToJson(MetricsUnits instance) =>
    <String, dynamic>{
      'energyUnits': _$EnergyUnitsEnumMap[instance.energyUnits]!,
      'heightUnits': _$HeightUnitsEnumMap[instance.heightUnits]!,
      'weightUnits': _$WeightUnitsEnumMap[instance.weightUnits]!,
    };

const _$EnergyUnitsEnumMap = {
  EnergyUnits.kCal: 'kCal',
  EnergyUnits.kJ: 'kJ',
};

const _$HeightUnitsEnumMap = {
  HeightUnits.cm: 'cm',
  HeightUnits.ft: 'ft',
};

const _$WeightUnitsEnumMap = {
  WeightUnits.kg: 'kg',
  WeightUnits.lbs: 'lbs',
};
