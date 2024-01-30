import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') String? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    DateTime? dateOfBirth,
    String? photo,
    UserMetricUnitsModel? metricUnits,
    int? height,
    int? weight,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        email: email,
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
class UserMetricUnitsModel with _$UserMetricUnitsModel {
  const factory UserMetricUnitsModel({
    String? energyUnits,
    String? heightUnits,
    String? weightUnits,
  }) = _UserMetricUnitsModel;

  const UserMetricUnitsModel._();

  factory UserMetricUnitsModel.fromJson(Map<String, dynamic> json) =>
      _$UserMetricUnitsModelFromJson(json);

  UserMetricUnitsEntity toEntity() => UserMetricUnitsEntity(
        energyUnits: energyUnits,
        heightUnits: heightUnits,
        weightUnits: weightUnits,
      );
}
