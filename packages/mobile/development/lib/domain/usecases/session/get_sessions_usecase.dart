import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetSessionsUsecase
    extends WithParamsUseCase<List<SessionEntity>, GetSessionsParams> {
  final SessionRepository _repo;

  GetSessionsUsecase(this._repo);

  @override
  Future<Either<Failure, List<SessionEntity>>> call(GetSessionsParams params) =>
      _repo.getSessions(params);
}
