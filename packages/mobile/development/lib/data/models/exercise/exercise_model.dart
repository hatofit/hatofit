import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? description,
    String? difficulty,
    String? type,
    String? thumbnail,
    int? duration,
    List<InstructionModel>? instructions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ExerciseModel;

  const ExerciseModel._();

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  ExerciseEntity toEntity() => ExerciseEntity(
        id: id,
        name: name,
        description: description,
        difficulty: difficulty,
        type: type,
        thumbnail: thumbnail,
        duration: duration,
        instructions: instructions?.map((e) => e.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory ExerciseModel.fromEntity(ExerciseEntity entity) => ExerciseModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        difficulty: entity.difficulty,
        type: entity.type,
        thumbnail: entity.thumbnail,
        duration: entity.duration,
        instructions: entity.instructions
            ?.map((e) => InstructionModel.fromEntity(e))
            .toList(),
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

@freezed
class InstructionModel with _$InstructionModel {
  const factory InstructionModel({
    @JsonKey(name: '_id') String? id,
    String? type,
    int? duration,
    String? name,
    String? description,
    ExerciseContentModel? content,
  }) = _InstructionModel;

  const InstructionModel._();

  factory InstructionModel.fromJson(Map<String, dynamic> json) =>
      _$InstructionModelFromJson(json);

  ExerciseInstructionEntity toEntity() => ExerciseInstructionEntity(
        id: id,
        type: type,
        duration: duration,
        name: name,
        description: description,
        content: content?.toEntity(),
      );

  factory InstructionModel.fromEntity(ExerciseInstructionEntity entity) =>
      InstructionModel(
        id: entity.id,
        type: entity.type,
        duration: entity.duration,
        name: entity.name,
        description: entity.description,
        content: entity.content != null
            ? ExerciseContentModel.fromEntity(entity.content!)
            : null,
      );
}

@freezed
class ExerciseContentModel with _$ExerciseContentModel {
  const factory ExerciseContentModel({
    String? video,
    String? text,
    String? lottie,
  }) = _ExerciseContentModel;

  const ExerciseContentModel._();

  factory ExerciseContentModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseContentModelFromJson(json);

  ExerciseContentEntity toEntity() => ExerciseContentEntity(
        video: video,
        text: text,
        lottie: lottie,
      );

  factory ExerciseContentModel.fromEntity(ExerciseContentEntity entity) =>
      ExerciseContentModel(
        video: entity.video,
        text: entity.text,
        lottie: entity.lottie,
      );
}
