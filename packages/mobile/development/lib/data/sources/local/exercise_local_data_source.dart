import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

abstract class ExerciseLocalDataSource {
  Future<Either<Failure, ExerciseModel>> getExercise(
    GetExerciseParams params,
  );
  Future<Either<Failure, List<ExerciseModel>>> getExercises(
    GetExercisesParams params,
  );
  Future<Either<Failure, void>> cacheExercises(List<ExerciseModel> params);
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final MainBoxMixin _box;

  ExerciseLocalDataSourceImpl(
    this._box,
  );

  @override
  Future<Either<Failure, void>> cacheExercises(
    List<ExerciseModel> params,
  ) async {
    List<String> ids = [];
    List<ExerciseEntity> exercises = [];
    for (var element in params) {
      ids.add(element.id ?? '');
      exercises.add(element.toEntity());
    }
    await _box.addData(MainBoxKeys.exerciseIds, ids);
    await _box.addData(MainBoxKeys.exercises, exercises);
    return const Right(null);
  }

  @override
  Future<Either<Failure, ExerciseModel>> getExercise(
    GetExerciseParams params,
  ) async {
    final List<ExerciseEntity> res = await _box.getData(
      MainBoxKeys.exercises,
    );
    if (res.isEmpty) {
      return Left(CacheFailure());
    }
    final find = res.firstWhere(
      (element) => element.id == params.id,
    );
    return Right(ExerciseModel.fromEntity(find));
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> getExercises(
    GetExercisesParams params,
  ) async {
    final List<ExerciseEntity> res = await _box.getData(
      MainBoxKeys.exercises,
    );
    if (res.isEmpty) {
      return Left(CacheFailure());
    }
    return Right(res.map((e) => ExerciseModel.fromEntity(e)).toList());
  }
}
