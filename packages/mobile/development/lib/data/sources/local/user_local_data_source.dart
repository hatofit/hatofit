import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

abstract class UserLocalDataSource {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, void>> saveUser(UserEntity user);
  Future<Either<Failure, String>> getToken();
  Future<Either<Failure, void>> saveToken(String token);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final MainBoxMixin _box;

  const UserLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    final UserEntity? res = await _box.getData(MainBoxKeys.user);
    if (res == null) {
      return Left(CacheFailure());
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, void>> saveUser(UserEntity user) async {
    await _box.addData(MainBoxKeys.user, user);
    return const Right(null);
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final String? res = await _box.getData(MainBoxKeys.token);
    if (res == null) {
      return Left(CacheFailure());
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    await _box.addData(MainBoxKeys.token, token);
    return const Right(null);
  }
}
