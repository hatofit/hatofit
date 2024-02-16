import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/services/firebase/firebase.dart';

abstract class ExerciseLocalDataSource {
  Future<Either<Failure, ExerciseEntity>> cacheExercise(
    ExerciseEntity entity,
  );
  Future<Either<Failure, ExerciseEntity>> readExerciseById(
    ByIdParams params,
  );
  Future<Either<Failure, List<ExerciseEntity>>> readExerciseAll();
}

class ExerciseLocalDataSourceImpl
    with FirebaseCrashLogger
    implements ExerciseLocalDataSource {
  final BoxClient _box;

  ExerciseLocalDataSourceImpl(
    this._box,
  );

  @override
  Future<Either<Failure, ExerciseEntity>> cacheExercise(
    ExerciseEntity entity,
  ) async {
    try {
      final all = _box.exerciseBox.toMap();
      int key = 0;

      if (all.isEmpty) {
        key = await _box.exerciseBox.add(entity);
      } else {
        for (var element in all.entries) {
          if (element.value.id == entity.id) {
            await _box.exerciseBox.put(element.key, entity);
            key = element.key;
            break;
          } else {
            key = await _box.exerciseBox.add(entity);
            break;
          }
        }
      }

      final res = _box.exerciseBox.get(key);
      if (res == null) {
        return const Left(CacheFailure("Failed to cache exercise"));
      }

      return Right(res);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExerciseEntity>> readExerciseById(
    ByIdParams params,
  ) async {
    try {
      final all = _box.exerciseBox.toMap();
      ExerciseEntity? found;

      for (var element in all.entries) {
        if (element.value.id == params.id) {
          found = element.value;
          break;
        }
      }

      if (found == null) {
        return const Left(CacheFailure("Exercise not found"));
      }

      return Right(found);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> readExerciseAll() async {
    try {
      final all = _box.exerciseBox.values;

      if (all.isEmpty) {
        return const Left(CacheFailure("Exercises not found"));
      }

      return Right(all.toList());
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }
}
