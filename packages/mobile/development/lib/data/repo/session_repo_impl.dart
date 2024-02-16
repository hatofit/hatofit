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
          return await _local.createSession(params);
        },
        (sessionModel) async {
          final entity = sessionModel.toEntity();
          await _local.cacheSession(entity);
          return Right(entity);
        },
      );
    } else {
      return await _local.createSession(params);
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> readSessionById(
    ByIdParams params,
  ) async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.readSessionById(params);
      return res.fold(
        (failure) async {
          return await _local.readSessionById(params);
        },
        (sessionModel) async {
          final entity = sessionModel.toEntity();
          await _local.cacheSession(entity);
          return Right(entity);
        },
      );
    } else {
      return await _local.readSessionById(params);
    }
  }

  @override
  Future<Either<Failure, List<SessionEntity>>> readSessionAll(
    ByLimitParams params,
  ) async {
    if (params.showFromLocal ?? false) {
      return await _local.readSessionAll();
    }
    if (await _info.isHatofitConnected) {
      final res = await _remote.readSessionAll(params);
      return res.fold(
        (failure) async {
          return await _local.readSessionAll();
        },
        (sessionModels) async {
          final parser = IParser<List<SessionEntity>>(
            sessionModels,
            (res) {
              final List<SessionModel> resM = res.cast<SessionModel>();
              final List<SessionEntity> resE =
                  resM.map((e) => e.toEntity()).toList();
              return resE;
            },
          );
          final res = await parser.parseInBackground();
          for (var element in res) {
            await _local.cacheSession(element);
          }
          return Right(res);
        },
      );
    } else {
      return await _local.readSessionAll();
    }
  }

  @override
  Future<Either<Failure, int>> deleteAll() async {
    return await _local.deleteAll();
  }
}
