import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  @HiveType(typeId: 0, adapterName: 'UserEntityAdapter')
  const factory UserEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? firstName,
    @HiveField(2) String? lastName,
    @HiveField(3) String? gender,
    @HiveField(4) String? email,
    @HiveField(5) String? password,
    @HiveField(6) String? confirmPassword,
    @HiveField(7) DateTime? dateOfBirth,
    @HiveField(8) String? photo,
    @HiveField(9) MetricUnitsEntity? metricUnitsEntity,
    @HiveField(10) int? height,
    @HiveField(11) int? weight,
    @HiveField(12) DateTime? createdAt,
    @HiveField(13) DateTime? updatedAt,
  }) = _UserEntity;
}

@freezed
class MetricUnitsEntity with _$MetricUnitsEntity {
  @HiveType(typeId: 1, adapterName: 'MetricUnitsEntityAdapter')
  const factory MetricUnitsEntity({
    @HiveField(0) String? energyUnits,
    @HiveField(1) String? heightUnits,
    @HiveField(2) String? weightUnits,
  }) = _MetricUnitsEntity;
}
