import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ExerciseByIdUsecase extends FPUC<ExerciseEntity, ByIdParams> {
  final ExerciseRepo _repo;

  ExerciseByIdUsecase(this._repo);

  @override
  Future<Either<Failure, ExerciseEntity>> call(ByIdParams params) =>
      _repo.readExerciseById(params);
}
