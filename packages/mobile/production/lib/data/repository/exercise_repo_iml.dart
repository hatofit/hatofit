import 'package:dartz/dartz.dart';
import 'package:hatofit/data/sources/api/exercise_api_repo_iml.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../domain/repositories/exercise_repo_abs.dart';

class ExerciseRepoIml implements ExerciseRepoAbs {
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>>
      fetchApiWorkouts() async {
    final res = await ExerciseApiRepoIml().request();
    return res;
  }

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchLocalWorkouts() {
    // TODO: implement fetchLocalWorkouts
    throw UnimplementedError();
  } 

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> saveLocalWorkouts() {
    // TODO: implement saveLocalWorkouts
    throw UnimplementedError();
  }
}
