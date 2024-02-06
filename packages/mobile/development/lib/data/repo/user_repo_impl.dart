import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource _remote;
  final UserLocalDataSource _local;
  final NetworkInfo _info;

  const UserRepoImpl(
    this._remote,
    this._local,
    this._info,
  );

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.getUser();
      return res.fold(
        (failure) {
          return _local.getUser();
        },
        (userModel) {
          _local.saveUser(userModel.toEntity());
          return Right(userModel.toEntity());
        },
      );
    } else {
      return _local.getUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(
    UpdateUserParams params,
  ) async {
    if (await _info.isHatofitConnected && !params.forLocal) {
      // TODO: Implement updateUser
      throw UnimplementedError();
    } else {
      return _local.saveUser(params.user!);
    }
  }

  @override
  Future<Either<Failure, void>> clearUser() async {
    return _local.clearUser();
  }

  @override
  Either<Failure, String> getTodayMood() {
    return _local.getTodayMood();
  }

  @override
  Either<Failure, String> getToken() {
    return _local.getToken();
  }

  @override
  Future<Either<Failure, void>> clearMood() async {
    return _local.clearTodayMood();
  }

  @override
  Future<Either<Failure, String>> saveTodayMood(String mood) async {
    return _local.saveTodayMood(mood);
  }

  @override
  Future<Either<Failure, String>> saveToken(String token) async {
    return _local.saveToken(token);
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    return _local.clearToken();
  }
}
