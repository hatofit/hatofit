import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'exercise_entity.freezed.dart';
part 'exercise_entity.g.dart';

@freezed
class ExerciseEntity with _$ExerciseEntity {
  @HiveType(
    typeId: BoxTypeId.exerciseEntityIndex,
    adapterName: BoxTypeId.exerciseEntityAdapterName,
  )
  const factory ExerciseEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? name,
    @HiveField(2) String? description,
    @HiveField(3) String? difficulty,
    @HiveField(4) String? type,
    @HiveField(5) String? thumbnail,
    @HiveField(6) int? duration,
    @HiveField(7) List<ExerciseInstructionEntity>? instructions,
    @HiveField(8) DateTime? createdAt,
    @HiveField(9) DateTime? updatedAt,
  }) = _ExerciseEntity;
}

@freezed
class ExerciseInstructionEntity with _$ExerciseInstructionEntity {
  @HiveType(
    typeId: BoxTypeId.exerciseInstructionEntityIndex,
    adapterName: BoxTypeId.exerciseInstructionEntityAdapterName,
  )
  const factory ExerciseInstructionEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? type,
    @HiveField(2) int? duration,
    @HiveField(3) String? name,
    @HiveField(4) String? description,
    @HiveField(5) ExerciseContentEntity? content,
  }) = _ExerciseInstructionEntity;
}

@freezed
class ExerciseContentEntity with _$ExerciseContentEntity {
  @HiveType(
    typeId: BoxTypeId.exerciseContentEntityIndex,
    adapterName: BoxTypeId.exerciseContentEntityAdapterName,
  )
  const factory ExerciseContentEntity({
    @HiveField(0) String? video,
    @HiveField(1) String? image,
    @HiveField(2) String? text,
    @HiveField(3) String? lottie,
  }) = _ExerciseContentEntity;
}

void regisExercise() {
  if (!Hive.isAdapterRegistered(BoxTypeId.exerciseEntityIndex)) {
    Hive.registerAdapter(ExerciseEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.exerciseInstructionEntityIndex)) {
    Hive.registerAdapter(ExerciseInstructionEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.exerciseContentEntityIndex)) {
    Hive.registerAdapter(ExerciseContentEntityAdapter());
  }
}
