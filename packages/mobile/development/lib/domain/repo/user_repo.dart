import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> readUser(
    ByLimitParams params,
  );
  Future<Either<Failure, UserEntity>> upsertUser(
    RegisterParams params,
  );
  Future<Either<Failure, void>> deleteUser();

  Either<Failure, String> readToken();
  Future<Either<Failure, String>> upsertToken(String token);
  Future<Either<Failure, void>> deleteToken();

  Either<Failure, String> readTodayMood();
  Future<Either<Failure, String>> upsertTodayMood(String mood);
  Future<Either<Failure, void>> deleteTodayMood();
}
