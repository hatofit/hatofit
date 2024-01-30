import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final UserLocalDataSource _local;

  const AuthRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginParams params,
  ) async {
    final res = await _remote.login(params);
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) {
        _local.saveToken(authResponseModel.token ?? "");
        _local.saveUser(authResponseModel.user?.toEntity() ?? UserEntity());
        return Right(authResponseModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> me() async {
    final res = await _remote.me();
    return res.fold(
      (failure) => Left(failure),
      (authResponseModel) {
        _local.saveToken(authResponseModel.token ?? "");
        _local.saveUser(authResponseModel.user?.toEntity() ?? UserEntity());
        return Right(authResponseModel.toEntity());
      },
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
        _local.saveToken(authResponseModel.token ?? "");
        _local.saveUser(authResponseModel.user?.toEntity() ?? UserEntity());
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
