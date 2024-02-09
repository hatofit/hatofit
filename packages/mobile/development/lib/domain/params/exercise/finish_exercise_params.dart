import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

part 'finish_exercise_params.freezed.dart';

@freezed
class FinishExerciseParams with _$FinishExerciseParams {
  const factory FinishExerciseParams({
    required bool isFreeWorkout,
    required ExerciseEntity? exercise,
    required UserEntity user,
    required BleEntity? device,
    required WorkoutSession session,
  }) = _FinishExerciseParams;
}
