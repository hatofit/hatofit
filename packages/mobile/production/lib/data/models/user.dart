import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String email;
  final String? password;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? confirmPassword;
  final DateTime? dateOfBirth;
  final String? photo;
  final MetricsUnits? metricUnits;
  final int? height;
  final int? weight;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.email,
    required this.password,
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.confirmPassword,
    this.dateOfBirth,
    this.photo,
    this.metricUnits,
    this.height,
    this.weight,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MetricsUnits {
  final String energyUnits;
  final String heightUnits;
  final String weightUnits;

  MetricsUnits({
   required this.energyUnits,
   required this.heightUnits,
   required this.weightUnits,
  });

  factory MetricsUnits.fromJson(Map<String, dynamic> json) =>
      _$MetricsUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsUnitsToJson(this);
}
