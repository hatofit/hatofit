part of 'workout_cubit.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState.loading() = _Loading;
  const factory WorkoutState.success(List<ExerciseEntity> exercises) = _Success;
  const factory WorkoutState.failure(Failure message) = _Failure;
}

