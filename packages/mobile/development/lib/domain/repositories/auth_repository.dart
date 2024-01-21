import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> login(LoginParams params);
  Future<Either<Failure, AuthResponseEntity>> register(RegisterParams params);
  Future<Either<Failure, AuthResponseEntity>> me();
}
