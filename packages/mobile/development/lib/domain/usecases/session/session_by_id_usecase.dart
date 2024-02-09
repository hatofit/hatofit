import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class SessionByIdUsecase extends FPUC<SessionEntity, ByIdParams> {
  final SessionRepo _repo;

  SessionByIdUsecase(this._repo);

  @override
  Future<Either<Failure, SessionEntity>> call(ByIdParams params) =>
      _repo.readSessionById(params);
}
