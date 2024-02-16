import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/local/box_client.dart';
import 'package:hatofit/data/models/session/session_model.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

abstract class SessionLocalDataSource {
  Future<Either<Failure, SessionEntity>> createSession(
    CreateSessionParams params,
  );
  Future<Either<Failure, SessionEntity>> cacheSession(
    SessionEntity entity,
  );
  Future<Either<Failure, SessionEntity>> readSessionById(
    ByIdParams params,
  );
  Future<Either<Failure, List<SessionEntity>>> readSessionAll();

  Future<Either<Failure, int>> deleteAll();
}

class SessionLocalDataSourceImpl
    with FirebaseCrashLogger
    implements SessionLocalDataSource {
  final BoxClient _box;

  SessionLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, SessionEntity>> createSession(
    CreateSessionParams params,
  ) async {
    try {
      final entity = SessionModel.fromJson(params.toJson()).toEntity();
      final key = await _box.sessionBox.add(entity);

      final res = _box.sessionBox.get(key);
      if (res == null) {
        return const Left(CacheFailure("Session not found"));
      }

      return Right(res);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> cacheSession(
    SessionEntity session,
  ) async {
    try {
      final all = _box.sessionBox.toMap();
      int key = 0;

      if (all.isEmpty) {
        key = await _box.sessionBox.add(session);
      } else {
        for (var element in all.entries) {
          if (element.value.id == session.id) {
            await _box.sessionBox.put(element.key, session);
            key = element.key;
            break;
          } else {
            key = await _box.sessionBox.add(session);
            break;
          }
        }
      }
      final res = _box.sessionBox.get(key);
      if (res == null) {
        return const Left(CacheFailure("Failed to cache session"));
      }

      return Right(res);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> readSessionById(
    ByIdParams params,
  ) async {
    try {
      final all = _box.sessionBox.values;
      SessionEntity? found;

      for (final item in all) {
        if (item.id == params.id) {
          found = item;
          break;
        }
      }

      if (found == null) {
        return const Left(CacheFailure("Session not found"));
      }

      return Right(found);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SessionEntity>>> readSessionAll() async {
    try {
      final all = _box.sessionBox.values;
      if (all.isEmpty) {
        return const Left(CacheFailure("Sessions not found"));
      }

      return Right(all.toList());
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  // delete all
  Future<Either<Failure, int>> deleteAll() async {
    try {
      final res = await _box.sessionBox.clear();
      return Right(res);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }
}
