import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';

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
