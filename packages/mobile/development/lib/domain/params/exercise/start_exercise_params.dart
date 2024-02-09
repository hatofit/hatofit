import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'start_exercise_params.freezed.dart';

@freezed
class StartExerciseParams with _$StartExerciseParams {
  const factory StartExerciseParams({
    required bool isFreeWorkout,
    required ExerciseEntity? exercise,
    required UserEntity user,
    required BleEntity? device,
  }) = _StartExerciseParams;
}
