import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, List<ExerciseEntity>>> getExercises(
    GetExercisesParams params,
  );
  Future<Either<Failure, ExerciseEntity>> getExercise(
    GetExerciseParams params,
  );
}
