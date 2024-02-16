import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ExerciseRepoImpl implements ExerciseRepo {
  final ExerciseRemoteDataSource _remote;
  final ExerciseLocalDataSource _local;
  final NetworkInfo _info;

  const ExerciseRepoImpl(
    this._remote,
    this._local,
    this._info,
  );
  @override
  Future<Either<Failure, ExerciseEntity>> readExerciseById(
    ByIdParams params,
  ) async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.readExerciseById(params);
      return res.fold(
        (failure) async {
          return await _local.readExerciseById(params);
        },
        (exerciseModel) {
          return Right(exerciseModel.toEntity());
        },
      );
    } else {
      return await _local.readExerciseById(params);
    }
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> readExerciseAll(
    ByLimitParams params,
  ) async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.readExerciseAll(params);
      return res.fold(
        (failure) async {
          return await _local.readExerciseAll();
        },
        (exerciseModels) async {
          final parser = IParser<List<ExerciseEntity>>(
            exerciseModels,
            (res) {
              final List<ExerciseModel> resM = res.cast<ExerciseModel>();
              final List<ExerciseEntity> resE =
                  resM.map((e) => e.toEntity()).toList();
              return resE;
            },
          );
          final res = await parser.parseInBackground();
          for (final e in res) {
            await _local.cacheExercise(e);
          }
          return Right(res);
        },
      );
    } else {
      return await _local.readExerciseAll();
    }
  }
}
