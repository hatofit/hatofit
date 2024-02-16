import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class SessionDeleteAllUsecase extends FNPUC<int> {
  final SessionRepo _repo;

  SessionDeleteAllUsecase(this._repo);

  @override
  Future<Either<Failure, int>> call() => _repo.deleteAll();
}
