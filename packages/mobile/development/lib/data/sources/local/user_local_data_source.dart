import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

abstract class UserLocalDataSource {
  Either<Failure, UserEntity> getUser();
  Future<Either<Failure, UserEntity>> saveUser(UserEntity user);
  Future<Either<Failure, void>> clearUser();

  Either<Failure, String> getToken();
  Future<Either<Failure, String>> saveToken(String token);
  Future<Either<Failure, void>> clearToken();

  Either<Failure, String> getTodayMood();
  Future<Either<Failure, String>> saveTodayMood(String mood);
  Future<Either<Failure, void>> clearTodayMood();
}

class UserLocalDataSourceImpl
    with FirebaseCrashLogger
    implements UserLocalDataSource {
  final BoxClient _client;

  const UserLocalDataSourceImpl(this._client);

  @override
  Either<Failure, UserEntity> getUser() {
    try {
      final UserEntity? res = _client.userBox.get(UserBoxKeys.user.name);
      if (res == null) return const Left(CacheFailure("User not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> saveUser(UserEntity user) async {
    try {
      await _client.userBox.put(UserBoxKeys.user.name, user);
      return getUser();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearUser() async {
    try {
      await _client.userBox.delete(UserBoxKeys.user.name);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String> getToken() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.token.name);
      if (res == null) return const Left(CacheFailure("Token not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> saveToken(String token) async {
    try {
      await _client.userBox.put(UserBoxKeys.token.name, token);
      return getToken();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    try {
      await _client.userBox.delete(UserBoxKeys.token.name);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String> getTodayMood() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.todayMood.name);
      if (res == null) return const Left(CacheFailure("Mood not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> saveTodayMood(String mood) async {
    try {
      await _client.userBox.put(UserBoxKeys.todayMood.name, mood);
      return getTodayMood();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearTodayMood() async {
    try {
      await _client.userBox.delete(UserBoxKeys.todayMood.name);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }
}
