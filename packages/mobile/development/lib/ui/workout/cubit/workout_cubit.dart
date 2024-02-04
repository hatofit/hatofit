import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'workout_cubit.freezed.dart';
part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final GetExercisesUsecase _getExercisesUsecase;
  WorkoutCubit(
    this._getExercisesUsecase,
  ) : super(const _Loading());

  Future<void> init() async {
    await getExercises();
  }

  Future<void> getExercises() async {
    emit(const _Loading());
    final res = await _getExercisesUsecase.call(const GetExercisesParams(
      showFromCompany: true,
    ));
    res.fold(
      (failure) => emit(_Failure(failure.toString())),
      (exercises) => emit(_Success(exercises)),
    );
  }
}
