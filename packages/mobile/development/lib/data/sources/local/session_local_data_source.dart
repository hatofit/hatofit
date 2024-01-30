import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

abstract class SessionLocalDataSource {
  Future<Either<Failure, SessionModel>> getSession(
    GetSessionParams params,
  );
  Future<Either<Failure, List<SessionModel>>> getSessions(
    GetSessionsParams params,
  );
  Future<Either<Failure, void>> cacheSessions(
    List<SessionModel> params,
  );
  Future<Either<Failure, void>> cacheSession(
    SessionModel params,
  );
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  final MainBoxMixin _box;

  SessionLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, void>> cacheSession(
    SessionModel params,
  ) async {
    List<String> ids = [];
    List<SessionEntity> sessions = [];
    ids.add(params.id ?? '');
    sessions.add(params.toEntity());
    await _box.addData(MainBoxKeys.sessionIds, ids);
    await _box.addData(MainBoxKeys.sessions, sessions);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> cacheSessions(
    List<SessionModel> params,
  ) async {
    List<String> ids = [];
    List<SessionEntity> sessions = [];
    for (var element in params) {
      ids.add(element.id ?? '');
      sessions.add(element.toEntity());
    }
    await _box.addData(MainBoxKeys.sessionIds, ids);
    await _box.addData(MainBoxKeys.sessions, sessions);
    return const Right(null);
  }

  @override
  Future<Either<Failure, SessionModel>> getSession(
    GetSessionParams params,
  ) async {
    final List<SessionEntity> res = await _box.getData(
      MainBoxKeys.sessions,
    );
    if (res.isEmpty) {
      return Left(CacheFailure());
    }
    final find = res.firstWhere(
      (element) => element.id == params.id,
    );
    return Right(SessionModel.fromEntity(find));
  }

  @override
  Future<Either<Failure, List<SessionModel>>> getSessions(
    GetSessionsParams params,
  ) async {
    final List<SessionEntity> res = await _box.getData(
      MainBoxKeys.sessions,
    );
    if (res.isEmpty) {
      return Left(CacheFailure());
    }
    return Right(res.map((e) => SessionModel.fromEntity(e)).toList());
  }
}
