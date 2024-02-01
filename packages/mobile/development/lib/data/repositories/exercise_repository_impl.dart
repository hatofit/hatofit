import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource _remote;
  final ExerciseLocalDataSource _local;
  final NetworkInfo _info;

  const ExerciseRepositoryImpl(
    this._remote,
    this._local,
    this._info,
  );
  @override
  Future<Either<Failure, ExerciseEntity>> getExercise(
    GetExerciseParams params,
  ) async {
    if (await _info.isConnected) {
      final res = await _remote.getExercise(params);
      return res.fold(
        (failure) async {
          return await _local.getExercise(params);
        },
        (exerciseModel) {
          return Right(exerciseModel.toEntity());
        },
      );
    } else {
      return await _local.getExercise(params);
    }
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercises(
    GetExercisesParams params,
  ) async {
    if (await _info.isConnected) {
      final res = await _remote.getExercises(params);
      return res.fold(
        (failure) async {
          return await _local.getExercises();
        },
        (exerciseModels) async {
          final parser = ModelToEntityIsolateParser<List<ExerciseEntity>>(
            exerciseModels,
            (res) {
              return res.map((e) => e.toEntity()).toList();
            },
          );
          final res = await parser.parseInBackground();
          return Right(res);
        },
      );
    } else {
      return await _local.getExercises();
    }
  }
}
