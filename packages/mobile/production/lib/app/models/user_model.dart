import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: '_id')
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? password;
  String? confirmPassword;
  DateTime? dateOfBirth;
  String? photo;
  MetricUnits? metricUnits;
  int? height;
  int? weight;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.password,
    this.confirmPassword,
    this.dateOfBirth,
    this.photo,
    this.metricUnits,
    this.height,
    this.weight,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MetricUnits {
  String? energyUnits;
  String? heightUnits;
  String? weightUnits;

  MetricUnits({
    this.energyUnits,
    this.heightUnits,
    this.weightUnits,
  });

  factory MetricUnits.fromJson(Map<String, dynamic> json) =>
      _$MetricUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricUnitsToJson(this);
}
