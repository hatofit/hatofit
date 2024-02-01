import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/local/box_client.dart';
import 'package:hatofit/data/models/session/session_model.dart';
import 'package:hatofit/domain/domain.dart';

abstract class SessionLocalDataSource {
  Future<Either<Failure, SessionEntity>> getSession(
    GetSessionParams params,
  );
  Future<Either<Failure, List<SessionEntity>>> getSessions();
  Future<Either<Failure, SessionEntity>> cacheSession(
    String id,
    SessionEntity entity,
  );
  Future<Either<Failure, SessionEntity>> saveSession(
    CreateSessionParams params,
  );
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  final BoxClient _box;

  SessionLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, SessionEntity>> cacheSession(
    String id,
    SessionEntity session,
  ) async {
    await _box.sessionBox.put(id, session);
    final res = _box.sessionBox.get(id);
    if (res == null) {
      return const Left(CacheFailure("Failed to cache session"));
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, SessionEntity>> getSession(
    GetSessionParams params,
  ) async {
    final SessionEntity? res = _box.sessionBox.get(
      params.id,
    );
    if (res == null) {
      return const Left(CacheFailure("Session not found"));
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, List<SessionEntity>>> getSessions() async {
    final keys = _box.sessionBox.keys;

    if (keys.isEmpty) {
      return const Left(CacheFailure("Sessions not found"));
    }

    List<SessionEntity> found = [];

    for (var element in keys) {
      final res = _box.sessionBox.get(element);
      if (res != null) {
        found.add(res);
      }
    }

    if (found.isEmpty) {
      return const Left(CacheFailure("Sessions not found"));
    }
    return Right(found);
  }

  @override
  Future<Either<Failure, SessionEntity>> saveSession(
    CreateSessionParams params,
  ) async {
    final entity = SessionModel.fromJson(params.toJson()).toEntity();
    final key = await _box.sessionBox.add(entity);
    final res = _box.sessionBox.get(key);
    if (res == null) {
      return const Left(CacheFailure("Session not found"));
    }
    return Right(res);
  }
}
