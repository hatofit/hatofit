import 'package:dartz/dartz.dart';
import 'package:hatofit/data/sources/api/exercise_api.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../domain/repositories/exercise_repo_abs.dart';

class ExerciseRepoIml implements ExerciseRepoAbs {
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> apiWorkouts() async {
    final res = await ExerciseApi().request();
    return res;
  }

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> localWorkouts() {
    throw UnimplementedError();
  }
}
