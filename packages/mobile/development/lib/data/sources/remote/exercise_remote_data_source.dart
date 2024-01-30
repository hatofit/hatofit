import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ExerciseRemoteDataSource {
  Future<Either<Failure, ExerciseModel>> getExercise(
    GetExerciseParams params,
  );
  Future<Either<Failure, List<ExerciseModel>>> getExercises(
    GetExercisesParams params,
  );
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final DioClient _client;

  ExerciseRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, ExerciseModel>> getExercise(
    GetExerciseParams params,
  ) async {
    final res = await _client.getRequest(
      "${ListAPI.exercise}/${params.id}",
      converter: (res) => ExerciseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> getExercises(
    GetExercisesParams params,
  ) async {
    final res = await _client.getRequest(
      ListAPI.exercise,
      queryParameters: params.toJson(),
      converter: (res) {
        List<ExerciseModel> exercises = [];
        for (var element in res['exercises']) {
          exercises
              .add(ExerciseModel.fromJson(element as Map<String, dynamic>));
        }
        return exercises;
      },
    );

    return res;
  }
}
