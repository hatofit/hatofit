import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExerciseModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final String difficulty;
  final String type;
  final String thumbnail;
  final int duration;
  final List<Instruction> instructions;
  final DateTime createdAt;
  final DateTime updatedAt;
  ExerciseModel(
    this.id,
    this.name,
    this.description,
    this.difficulty,
    this.type,
    this.instructions,
    this.thumbnail,
    this.duration,
    this.createdAt,
    this.updatedAt,
  );

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}

@JsonSerializable()
class Instruction {
  @JsonKey(name: '_id')
  final String id;
  final String type;
  final int duration;
  final String? name;
  final String? description;
  final Content? content;

  Instruction(
    this.id,
    this.type,
    this.name,
    this.duration,
    this.content,
    this.description,
  );

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}

@JsonSerializable()
class Content {
  final String video;
  final String image;
  final String? lottie;

  Content(this.video, this.image, this.lottie);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
