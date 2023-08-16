import 'package:dartz/dartz.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';

abstract class ExerciseRepoAbs {
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchLocalWorkouts();
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchApiWorkouts();
  Future<Either<Failure, Success<Map<String, dynamic>>>> saveLocalWorkouts();
}
