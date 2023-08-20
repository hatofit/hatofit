import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String email;
  final String password;
  final String? id;
  final String? confirmPassword;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? photo;
  final int? height;
  final int? weight;
  final MetricsUnits? metricUnits;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.email,
    required this.password,
    this.id,
    this.confirmPassword,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.photo,
    this.height,
    this.weight,
    this.metricUnits,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum EnergyUnits { kCal, kJ }

enum HeightUnits { cm, ft }

enum WeightUnits { kg, lbs }

@JsonSerializable()
class MetricsUnits  {
  final EnergyUnits energyUnits;
  final HeightUnits heightUnits;
  final WeightUnits weightUnits;

  MetricsUnits({
    required this.energyUnits,
    required this.heightUnits,
    required this.weightUnits,
  });

  factory MetricsUnits.fromJson(Map<String, dynamic> json) => _$MetricsUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsUnitsToJson(this);
}
