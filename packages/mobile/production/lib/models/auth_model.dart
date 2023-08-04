import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthModel {
  String? firstName;
  String? lastName;
  String? gender;
  final String? email;
  final String? password;
  String? confirmPassword;
  DateTime? dateOfBirth;
  MetricUnits? metricUnits;
  int? height;
  int? weight;
  DateTime? createdAt;
  DateTime? updatedAt;

  AuthModel({
    this.firstName,
    this.lastName,
    this.gender,
    required this.email,
    required this.password,
    this.confirmPassword,
    this.dateOfBirth,
    this.metricUnits,
    this.height,
    this.weight,
    this.createdAt,
    this.updatedAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MetricUnits {
  final String energyUnits;
  final String heightUnits;
  final String weightUnits;

  MetricUnits({
    required this.energyUnits,
    required this.heightUnits,
    required this.weightUnits,
  });

  factory MetricUnits.fromJson(Map<String, dynamic> json) =>
      _$MetricUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricUnitsToJson(this);
}
