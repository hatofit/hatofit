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
}

@freezed
class InstructionModel with _$InstructionModel {
  const factory InstructionModel({
    @JsonKey(name: '_id') String? id,
    String? type,
    int? duration,
    String? name,
    String? description,
    ContentModel? content,
  }) = _InstructionModel;

  const InstructionModel._();

  factory InstructionModel.fromJson(Map<String, dynamic> json) =>
      _$InstructionModelFromJson(json);

  InstructionEntity toEntity() => InstructionEntity(
        id: id,
        type: type,
        duration: duration,
        name: name,
        description: description,
        content: content?.toEntity(),
      );
}

@freezed
class ContentModel with _$ContentModel {
  const factory ContentModel({
    String? video,
    String? text,
    String? lottie,
  }) = _ContentModel;

  const ContentModel._();

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);

  ContentEntity toEntity() => ContentEntity(
        video: video,
        text: text,
        lottie: lottie,
      );
}
