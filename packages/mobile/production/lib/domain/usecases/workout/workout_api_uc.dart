import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/usecases/no_param_uc.dart';
import 'package:hatofit/domain/repositories/workout_repo_abs.dart';

import '../../../app/core/domain/failure.dart';
import '../../../app/core/domain/success.dart';

class WorkoutApiUC extends NoParamUseCase {
  final WorkoutRepoAbs _workoutRepoAbs;
  WorkoutApiUC(this._workoutRepoAbs);
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> execute() {
    return _workoutRepoAbs.fetchApiWorkouts();
  }
}
