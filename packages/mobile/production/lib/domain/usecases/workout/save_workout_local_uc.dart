import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/usecases/param_uc.dart';

import '../../../app/core/domain/failure.dart';
import '../../../app/core/domain/success.dart';
import '../../repositories/workout_repo_abs.dart';

class SaveWorkoutLocalUC extends ParamUseCase<dynamic, Map<String, dynamic>> {
  final WorkoutRepoAbs _workoutRepoAbs;
  SaveWorkoutLocalUC(this._workoutRepoAbs);
  @override
  Future<Either<Failure, Success>> execute(param) {
    return _workoutRepoAbs.saveLocalWorkouts(param);
  }
}
