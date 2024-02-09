import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/local/box_client.dart';
import 'package:hatofit/data/models/session/session_model.dart';
import 'package:hatofit/domain/domain.dart';

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
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  final BoxClient _box;

  SessionLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, SessionEntity>> createSession(
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

  @override
  Future<Either<Failure, SessionEntity>> cacheSession(
    SessionEntity session,
  ) async {
    final all = _box.sessionBox.toMap();
    int key = 0;
  
    for (var element in all.entries) {
      if (element.value.id == session.id) {
        await _box.sessionBox.put(element.key, session);
      } else {
        key = await _box.sessionBox.add(session);
      }
    }
  
    final res = _box.sessionBox.get(key);
    if (res == null) {
      return const Left(CacheFailure("Failed to cache session"));
    }
  
    return Right(res);
  }

  @override
  Future<Either<Failure, SessionEntity>> readSessionById(
    ByIdParams params,
  ) async {
    final all = _box.sessionBox.values;
    SessionEntity? found;
  
    for (final item in all) {
      if (item.id == params.id) {
        found = item;
      }
    }
  
    if (found == null) {
      return const Left(CacheFailure("Session not found"));
    }
  
    return Right(found);
  }

  @override
  Future<Either<Failure, List<SessionEntity>>> readSessionAll() async {
    final all = _box.sessionBox.values;

    if (all.isEmpty) {
      return const Left(CacheFailure("Sessions not found"));
    }

    return Right(all.toList());
  }
}
