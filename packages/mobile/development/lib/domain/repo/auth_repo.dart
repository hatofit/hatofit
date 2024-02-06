import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponseEntity>> me();
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginParams params,
  );
  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterParams params,
  );
  Future<Either<Failure, BaseResponseEntity>> forgotPassword(
    ForgotPasswordParams params,
  );
  Future<Either<Failure, AuthResponseEntity>> resetPassword(
    ResetPasswordParams params,
  );
  Future<Either<Failure, BaseResponseEntity>> verifyCode(
    ResetPasswordParams params,
  );
}
