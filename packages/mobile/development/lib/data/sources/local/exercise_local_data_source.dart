import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ExerciseLocalDataSource {
  Future<Either<Failure, ExerciseEntity>> getExercise(
    GetExerciseParams params,
  );
  Future<Either<Failure, List<ExerciseEntity>>> getExercises();
  Future<Either<Failure, ExerciseEntity>> cacheExercise(
    String id,
    ExerciseEntity entity,
  );
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final BoxClient _box;

  ExerciseLocalDataSourceImpl(
    this._box,
  );

  @override
  Future<Either<Failure, ExerciseEntity>> cacheExercise(
    String id,
    ExerciseEntity entity,
  ) async {
    await _box.exerciseBox.put(id, entity);
    final res = _box.exerciseBox.get(id);
    if (res == null) {
      return const Left(CacheFailure("Failed to cache exercise"));
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, ExerciseEntity>> getExercise(
    GetExerciseParams params,
  ) async {
    final ExerciseEntity? res = _box.exerciseBox.get(
      params.id,
    );
    if (res == null) {
      return const Left(CacheFailure("Exercise not found"));
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercises() async {
    final keys = _box.exerciseBox.keys;

    if (keys.isEmpty) {
      return const Left(CacheFailure("Exercises not found"));
    }

    List<ExerciseEntity> found = [];

    for (var element in keys) {
      final res = _box.exerciseBox.get(element);
      if (res != null) {
        found.add(res);
      }
    }

    if (found.isEmpty) {
      return const Left(CacheFailure("Exercises not found"));
    }
    return Right(found);
  }
}
