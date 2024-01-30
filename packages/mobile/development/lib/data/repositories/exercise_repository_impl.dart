import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource _remote;
  final ExerciseLocalDataSource _local;

  const ExerciseRepositoryImpl(
    this._remote,
    this._local,
  );

  @override
  Future<Either<Failure, ExerciseEntity>> getExercise(
      GetExerciseParams params) async {
    final res = await _remote.getExercise(params);
    return res.fold(
      (failure) async {
        return Left(failure);
        // final res = await localDataSource.getExercise(params);
        // return res.fold(
        //   (failure) => Left(failure),
        //   (exerciseModel) => Right(exerciseModel.toEntity()),
        // );
      },
      (exerciseModel) {
        return Right(exerciseModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercises(
      GetExercisesParams params) async {
    final res = await _remote.getExercises(params);
    return res.fold(
      (failure) async {
        return Left(failure);
        // final res = await localDataSource.getExercises(params);
        // return res.fold(
        //   (failure) => Left(failure),
        //   (exerciseModel) =>
        //       Right(exerciseModel.map((e) => e.toEntity()).toList()),
        // );
      },
      (exerciseModels) {
        // localDataSource.cacheExercises(exerciseModels);
        return Right(exerciseModels.map((e) => e.toEntity()).toList());
      },
    );
  }
}
