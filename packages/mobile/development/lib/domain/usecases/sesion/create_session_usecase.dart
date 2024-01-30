import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class CreateSessionUsecase
    extends WithParamsUseCase<SessionEntity, CreateSessionParams> {
  final SessionRepository _repo;

  CreateSessionUsecase(this._repo);

  @override
  Future<Either<Failure, SessionEntity>> call(CreateSessionParams params) =>
      _repo.createSession(params);
}
