import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ExerciseAllUsecase extends FPUC<List<ExerciseEntity>, ByLimitParams> {
  final ExerciseRepo _repo;

  ExerciseAllUsecase(this._repo);

  @override
  Future<Either<Failure, List<ExerciseEntity>>> call(ByLimitParams params) =>
      _repo.readExerciseAll(params);
}
