import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class SessionRepoImpl implements SessionRepo {
  final SessionRemoteDataSource _remote;
  final SessionLocalDataSource _local;
  final NetworkInfo _info;

  const SessionRepoImpl(
    this._remote,
    this._local,
    this._info,
  );

  @override
  Future<Either<Failure, SessionEntity>> createSession(
    CreateSessionParams params,
  ) async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.createSessions(params);
      return res.fold(
        (failure) async {
          return await _local.saveSession(params);
        },
        (sessionModel) {
          return Right(sessionModel.toEntity());
        },
      );
    } else {
      return await _local.saveSession(params);
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> getSession(
    GetSessionParams params,
  ) async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.getSession(params);
      return res.fold(
        (failure) async {
          return await _local.getSession(params);
        },
        (sessionModel) async {
          final entity = sessionModel.toEntity();
          await _local.cacheSession(entity.id ?? "", entity);
          return Right(entity);
        },
      );
    } else {
      return await _local.getSession(params);
    }
  }

  @override
  Future<Either<Failure, List<SessionEntity>>> getSessions(
    GetSessionsParams params,
  ) async {
    final res = await _remote.getSessions(params);
    return res.fold(
      (failure) async {
        return await _local.getSessions();
      },
      (sessionModels) async {
        final parser = ModelToEntityIsolateParser<List<SessionEntity>>(
          sessionModels,
          (res) {
            return res.map((e) => e.toEntity()).toList();
          },
        );
        final res = await parser.parseInBackground();
        for (var element in res) {
          await _local.cacheSession(element.id ?? "", element);
        }
        return Right(res);
      },
    );
  }
}
