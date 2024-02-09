import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ExerciseLocalDataSource {
  Future<Either<Failure, ExerciseEntity>> cacheExercise(
    ExerciseEntity entity,
  );
  Future<Either<Failure, ExerciseEntity>> readExerciseById(
    ByIdParams params,
  );
  Future<Either<Failure, List<ExerciseEntity>>> readExerciseAll();
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final BoxClient _box;

  ExerciseLocalDataSourceImpl(
    this._box,
  );

  @override
  Future<Either<Failure, ExerciseEntity>> cacheExercise(
    ExerciseEntity entity,
  ) async {
    final all = _box.exerciseBox.toMap();
    int key = 0;

    for (var element in all.entries) {
      if (element.value.id == entity.id) {
        await _box.exerciseBox.put(element.key, entity);
      } else {
        key = await _box.exerciseBox.add(entity);
      }
    }

    final res = _box.exerciseBox.get(key);
    if (res == null) {
      return const Left(CacheFailure("Failed to cache exercise"));
    }

    return Right(res);
  }

  @override
  Future<Either<Failure, ExerciseEntity>> readExerciseById(
    ByIdParams params,
  ) async {
    final all = _box.exerciseBox.toMap();
    ExerciseEntity? found;

    for (var element in all.entries) {
      if (element.value.id == params.id) {
        found = element.value;
      }
    }

    if (found == null) {
      return const Left(CacheFailure("Exercise not found"));
    }

    return Right(found);
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> readExerciseAll() async {
    final all = _box.exerciseBox.values;

    if (all.isEmpty) {
      return const Left(CacheFailure("Exercises not found"));
    }

    return Right(all.toList());
  }
}
