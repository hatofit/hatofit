import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/entities/exercise/exercise_entity.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<ExerciseEntity>>> getExercises();
  Future<Either<Failure, List<ExerciseEntity>>> getExercisesByCompany();
  Future<Either<Failure, ExerciseEntity>> getExercise(String id);
  Future<Either<Failure, ExerciseEntity>> createExercise(
      ExerciseEntity exercise);
}
