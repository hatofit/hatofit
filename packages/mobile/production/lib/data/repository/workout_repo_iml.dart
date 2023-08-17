import 'package:dartz/dartz.dart';
import 'package:hatofit/data/sources/api/workout_api_repo_iml.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../domain/repositories/workout_repo_abs.dart';
import '../models/exercise.dart';
import '../sources/local/local_repo_iml.dart';

class WorkoutRepoIml implements WorkoutRepoAbs {
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>>
      fetchApiWorkouts() async {
    final res = await WorkoutApiRepoIml().request();
    return res;
  }

  @override
  Future<Either<Failure, Success<List<Exercise>>>> fetchLocalWorkouts() async {
    final res = await LocalRepoIml.fetchWorkout().request();
    return res;
  }

  @override
  Future<Either<Failure, Success<String>>> saveLocalWorkouts(Map<String, dynamic> body) async {
    final res = await LocalRepoIml.saveWorkout(data: body).request();
    return res;
  }
}
