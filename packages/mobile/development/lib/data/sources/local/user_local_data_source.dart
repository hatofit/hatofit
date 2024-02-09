import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

abstract class UserLocalDataSource {
  Either<Failure, UserEntity> readUser();
  Future<Either<Failure, UserEntity>> upsertUser(UserEntity user);
  Future<Either<Failure, void>> deleteUser();

  Either<Failure, String> readToken();
  Future<Either<Failure, String>> upsertToken(String token);
  Future<Either<Failure, void>> deleteToken();

  Either<Failure, String> readTodayMood();
  Future<Either<Failure, String>> upsertTodayMood(String mood);
  Future<Either<Failure, void>> deleteTodayMood();
}

class UserLocalDataSourceImpl
    with FirebaseCrashLogger
    implements UserLocalDataSource {
  final BoxClient _client;

  const UserLocalDataSourceImpl(this._client);

  @override
  Either<Failure, UserEntity> readUser() {
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
  Future<Either<Failure, UserEntity>> upsertUser(UserEntity user) async {
    try {
      await _client.userBox.put(UserBoxKeys.user.name, user);
      return readUser();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      await _client.userBox.delete(UserBoxKeys.user.name);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String> readToken() {
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
  Future<Either<Failure, String>> upsertToken(String token) async {
    try {
      await _client.userBox.put(UserBoxKeys.token.name, token);
      return readToken();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteToken() async {
    try {
      await _client.userBox.delete(UserBoxKeys.token.name);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String> readTodayMood() {
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
  Future<Either<Failure, String>> upsertTodayMood(String mood) async {
    try {
      await _client.userBox.put(UserBoxKeys.todayMood.name, mood);
      return readTodayMood();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodayMood() async {
    try {
      await _client.userBox.delete(UserBoxKeys.todayMood.name);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }
}
