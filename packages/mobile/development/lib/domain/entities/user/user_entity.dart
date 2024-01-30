import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  @HiveType(typeId: 0, adapterName: 'UserEntityAdapter')
  const factory UserEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? firstName,
    @HiveField(2) String? lastName,
    @HiveField(3) String? gender,
    @HiveField(4) String? email,
    @HiveField(5) DateTime? dateOfBirth,
    @HiveField(6) String? photo,
    @HiveField(7) MetricUnitsEntity? metricUnitsEntity,
    @HiveField(8) int? height,
    @HiveField(9) int? weight,
    @HiveField(10) DateTime? createdAt,
    @HiveField(11) DateTime? updatedAt,
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
