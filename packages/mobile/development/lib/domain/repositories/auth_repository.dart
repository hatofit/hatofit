import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(LoginParams params);
  Future<Either<Failure, AuthResponse>> register(RegisterParams params);
  Future<Either<Failure, AuthResponse>> me();
}
