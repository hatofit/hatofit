import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetSessionUsecase
    extends WithParamsUseCase<SessionEntity, GetSessionParams> {
  final SessionRepository _repo;

  GetSessionUsecase(this._repo);

  @override
  Future<Either<Failure, SessionEntity>> call(GetSessionParams params) =>
      _repo.getSession(params);
}
