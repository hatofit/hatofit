import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class SessionRepo {
  Future<Either<Failure, SessionEntity>> createSession(
    CreateSessionParams params,
  );
  Future<Either<Failure, SessionEntity>> readSessionById(
    ByIdParams params,
  );
  Future<Either<Failure, List<SessionEntity>>> readSessionAll(
    ByLimitParams params,
  );
  Future<Either<Failure, int>> deleteAll();
}
