import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/modules/user/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? password,
    String? confirmPassword,
    DateTime? dateOfBirth,
    String? photo,
    MetricUnitsModel? metricUnits,
    int? height,
    int? weight,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        dateOfBirth: dateOfBirth,
        photo: photo,
        metricUnits: metricUnits?.toEntity(),
        height: height,
        weight: weight,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@freezed
class MetricUnitsModel with _$MetricUnitsModel {
  const factory MetricUnitsModel({
    String? energyUnits,
    String? heightUnits,
    String? weightUnits,
  }) = _MetricUnitsModel;

  const MetricUnitsModel._();

  factory MetricUnitsModel.fromJson(Map<String, dynamic> json) =>
      _$MetricUnitsModelFromJson(json);

  MetricUnitsEntity toEntity() => MetricUnitsEntity(
        energyUnits: energyUnits,
        heightUnits: heightUnits,
        weightUnits: weightUnits,
      );
}
