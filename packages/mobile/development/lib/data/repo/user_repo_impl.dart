import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class UserRepoImpl implements UserRepo {
  final AuthRemoteDataSource _remote;
  final UserLocalDataSource _local;
  final NetworkInfo _info;

  const UserRepoImpl(
    this._remote,
    this._local,
    this._info,
  );

  @override
  Future<Either<Failure, UserEntity>> readUser(ByLimitParams params) async {
    if (params.showFromLocal ?? false) {
      return _local.readUser();
    }
    if (await _info.isHatofitConnected) {
      final res = await _remote.me();
      return res.fold(
        (failure) {
          return _local.readUser();
        },
        (auth) async {
          final entity = auth.toEntity();
          if (entity.user != null) {
            await _local.upsertUser(entity.user!);
            return Right(entity.user!);
          } else {
            return _local.readUser();
          }
        },
      );
    } else {
      return _local.readUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> upsertUser(
    RegisterParams params,
  ) async {
    if (params.forLocal) {
      return await _local.upsertUser(params.toUserEntity());
    } else if (await _info.isHatofitConnected) {
      final res = await _remote.update(params);
      return res.fold(
        (failure) => Left(failure),
        (res) async {
          final entity = res?.toEntity();
          await _local.upsertUser(entity ?? const UserEntity());
          return Right(entity ?? const UserEntity());
        },
      );
    } else {
      return await _local.upsertUser(params.toUserEntity());
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    return _local.deleteUser();
  }

  @override
  Either<Failure, String> readToken() {
    return _local.readToken();
  }

  @override
  Future<Either<Failure, String>> upsertToken(String token) async {
    return _local.upsertToken(token);
  }

  @override
  Future<Either<Failure, void>> deleteToken() async {
    return _local.deleteToken();
  }

  @override
  Either<Failure, String> readTodayMood() {
    return _local.readTodayMood();
  }

  @override
  Future<Either<Failure, String>> upsertTodayMood(String mood) async {
    return _local.upsertTodayMood(mood);
  }

  @override
  Future<Either<Failure, void>> deleteTodayMood() async {
    return _local.deleteTodayMood();
  }
}
