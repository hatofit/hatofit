import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class SessionAllUsecase extends FPUC<List<SessionEntity>, ByLimitParams> {
  final SessionRepo _repo;

  SessionAllUsecase(this._repo);

  @override
  Future<Either<Failure, List<SessionEntity>>> call(ByLimitParams params) =>
      _repo.readSessionAll(params);
}
