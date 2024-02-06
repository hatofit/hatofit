import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetExercisesUsecase
    extends WithParamsUseCase<List<ExerciseEntity>, GetExercisesParams> {
  final ExerciseRepo _repo;

  GetExercisesUsecase(this._repo);

  @override
  Future<Either<Failure, List<ExerciseEntity>>> call(
          GetExercisesParams params) =>
      _repo.getExercises(params);
}
