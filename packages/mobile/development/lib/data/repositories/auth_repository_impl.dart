import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(LoginParams params) async {
    final res = await authRemoteDatasource.login(params);
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) {
        mainBoxMixin.addData(MainBoxKeys.token, authResponseModel.token);
        return Right(authResponseModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> me() async {
    final res = await authRemoteDatasource.me();
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) {
        mainBoxMixin.addData(MainBoxKeys.token, authResponseModel.token);
        return Right(authResponseModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
      RegisterParams params) async {
    final res = await authRemoteDatasource.register(params);
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) => Right(authResponseModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, BaseResponseEntity<dynamic>>> forgotPassword(
      ForgotPasswordParams params) async {
    final res = await authRemoteDatasource.forgotPassword(params);
    return res.fold(
      (failure) => Left(failure),
      (baseResponseModel) => Right(baseResponseModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> resetPassword(
      ResetPasswordParams params) async {
    final res = await authRemoteDatasource.resetPassword(params);
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) {
        mainBoxMixin.addData(MainBoxKeys.token, authResponseModel.token);
        return Right(authResponseModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> verifyCode(
      ResetPasswordParams params) async {
    final res = await authRemoteDatasource.verifyCode(params);
    return res.fold(
      (failure) => Left(failure),
      (baseResponseModel) => Right(baseResponseModel.toEntity()),
    );
  }
}
