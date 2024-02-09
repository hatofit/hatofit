import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, ExerciseEntity>> readExerciseById(
    ByIdParams params,
  );
  Future<Either<Failure, List<ExerciseEntity>>> readExerciseAll(
    ByLimitParams params,
  );
}
