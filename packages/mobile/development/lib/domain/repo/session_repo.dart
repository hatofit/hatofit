import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class SessionRepo {
  Future<Either<Failure, List<SessionEntity>>> getSessions(
    GetSessionsParams params,
  );
  Future<Either<Failure, SessionEntity>> getSession(
    GetSessionParams params,
  );
  Future<Either<Failure, SessionEntity>> createSession(
    CreateSessionParams params,
  );
}
