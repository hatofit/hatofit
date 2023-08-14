import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthModel {
  @JsonKey(name: '_id')
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  final String? email;
  final String? password;
  String? confirmPassword;
  DateTime? dateOfBirth;
  String? photo;
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
    this.photo,
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
