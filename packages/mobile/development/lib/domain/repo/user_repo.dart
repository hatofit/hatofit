import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUser(
    GetUserParams params,
  );
  Future<Either<Failure, UserEntity>> updateUser(
    UpdateUserParams params,
  );
  Future<Either<Failure, void>> clearUser();

  Either<Failure, String> getToken();
  Future<Either<Failure, String>> saveToken(String token);
  Future<Either<Failure, void>> clearToken();

  Either<Failure, String> getTodayMood();
  Future<Either<Failure, String>> saveTodayMood(String mood);
  Future<Either<Failure, void>> clearMood();
}
