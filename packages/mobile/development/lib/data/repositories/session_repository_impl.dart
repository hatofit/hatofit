import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionRemoteDataSource _remote;
  final SessionLocalDataSource _local;

  const SessionRepositoryImpl(
    this._remote,
    this._local,
  );

  @override
  Future<Either<Failure, SessionEntity>> createSession(
    CreateSessionParams params,
  ) async {
    final res = await _remote.createSessions(params);
    return res.fold(
      (failure) async {
        return Left(failure);
      },
      (sessionModel) {
        return Right(sessionModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, SessionEntity>> getSession(
    GetSessionParams params,
  ) async {
    final res = await _remote.getSession(params);
    return res.fold(
      (failure) async {
        return Left(failure);
      },
      (sessionModel) {
        return Right(sessionModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, List<SessionEntity>>> getSessions(
    GetSessionsParams params,
  ) async {
    final res = await _remote.getSessions(params);
    return res.fold(
      (failure) async {
        return Left(failure);
      },
      (sessionModels) {
        return Right(sessionModels.map((e) => e.toEntity()).toList());
      },
    );
  }
}
