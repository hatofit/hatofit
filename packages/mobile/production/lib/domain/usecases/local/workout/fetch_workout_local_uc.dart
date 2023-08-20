import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/usecases/no_param_uc.dart';
import 'package:hatofit/domain/repos/workout_repo_abs.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import '../../../../data/models/exercise.dart';

class FetchWorkoutLocalUC extends NoParamUseCase {
  final WorkoutRepoAbs _workoutRepoAbs;
  FetchWorkoutLocalUC(this._workoutRepoAbs);

  @override
  Future<Either<Failure, Success<List<Exercise>>>> execute() {
    return _workoutRepoAbs.fetchLocalWorkouts();
  }
}
