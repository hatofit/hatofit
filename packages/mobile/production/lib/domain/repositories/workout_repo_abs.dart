import 'package:dartz/dartz.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../data/models/exercise.dart';

abstract class WorkoutRepoAbs {
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchApiWorkouts();

  Future<Either<Failure, Success<List<Exercise>>>> fetchLocalWorkouts();
  Future<Either<Failure, Success<String>>> saveLocalWorkouts(
      Map<String, dynamic> body);
}
