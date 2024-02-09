import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadMoodUsecase extends ENPUC<String> {
  final UserRepo _repo;

  ReadMoodUsecase(this._repo);

  @override
  Either<Failure, String> call() => _repo.readTodayMood();
}
