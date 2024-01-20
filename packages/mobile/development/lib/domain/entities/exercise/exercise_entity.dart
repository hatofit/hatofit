import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'exercise_entity.freezed.dart';

@freezed
class ExerciseEntity with _$ExerciseEntity {
  @HiveType(typeId: 2, adapterName: 'ExerciseEntityAdapter')
  const factory ExerciseEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? name,
    @HiveField(2) String? description,
    @HiveField(3) String? difficulty,
    @HiveField(4) String? type,
    @HiveField(5) String? thumbnail,
    @HiveField(6) int? duration,
    @HiveField(7) List<InstructionEntity>? instructions,
    @HiveField(8) DateTime? createdAt,
    @HiveField(9) DateTime? updatedAt,
  }) = _ExerciseEntity;
}

@freezed
class InstructionEntity with _$InstructionEntity {
  @HiveType(typeId: 3, adapterName: 'InstructionEntityAdapter')
  const factory InstructionEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? type,
    @HiveField(2) int? duration,
    @HiveField(3) String? name,
    @HiveField(4) String? description,
    @HiveField(5) ContentEntity? content,
  }) = _InstructionEntity;
}

@freezed
class ContentEntity with _$ContentEntity {
  @HiveType(typeId: 4, adapterName: 'ContentEntityAdapter')
  const factory ContentEntity({
    @HiveField(0) String? video,
    @HiveField(1) String? image,
    @HiveField(2) String? text,
    @HiveField(3) String? lottie,
  }) = _ContentEntity;
}
