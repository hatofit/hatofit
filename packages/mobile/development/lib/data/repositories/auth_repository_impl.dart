import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remote;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this._remote, this.mainBoxMixin);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginParams params,
  ) async {
    final res = await _remote.login(params);
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
    final res = await _remote.me();
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) => Right(authResponseModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterParams params,
  ) async {
    final res = await _remote.register(params);
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) {
        log?.f(authResponseModel);
        mainBoxMixin.addData(MainBoxKeys.token, authResponseModel.token);
        return Right(authResponseModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, BaseResponseEntity<dynamic>>> forgotPassword(
    ForgotPasswordParams params,
  ) async {
    final res = await _remote.forgotPassword(params);
    return res.fold(
      (failure) => Left(failure),
      (baseResponseModel) => Right(baseResponseModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> resetPassword(
    ResetPasswordParams params,
  ) async {
    final res = await _remote.resetPassword(params);
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
    ResetPasswordParams params,
  ) async {
    final res = await _remote.verifyCode(params);
    return res.fold(
      (failure) => Left(failure),
      (baseResponseModel) => Right(baseResponseModel.toEntity()),
    );
  }
}
