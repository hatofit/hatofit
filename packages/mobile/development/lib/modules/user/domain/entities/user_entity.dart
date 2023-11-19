import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? password,
    String? confirmPassword,
    DateTime? dateOfBirth,
    String? photo,
    MetricUnitsEntity? metricUnits,
    int? height,
    int? weight,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserEntity;
}

@freezed
class MetricUnitsEntity with _$MetricUnitsEntity {
  const factory MetricUnitsEntity({
    String? energyUnits,
    String? heightUnits,
    String? weightUnits,
  }) = _MetricUnitsEntity;
}
