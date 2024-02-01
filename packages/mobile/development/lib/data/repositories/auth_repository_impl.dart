import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final NetworkInfo _networkInfo;
  final UserLocalDataSource _local;

  const AuthRepositoryImpl(this._remote, this._local, this._networkInfo);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginParams params,
  ) async {
    if (await _networkInfo.isConnected) {
      final res = await _remote.login(params);
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) {
          _local.saveToken(authResponseModel.token ?? "");
          _local.saveUser(
              authResponseModel.user?.toEntity() ?? const UserEntity());
          return Right(authResponseModel.toEntity());
        },
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> me() async {
    if (await _networkInfo.isConnected) {
      final res = await _remote.me();
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) {
          _local.saveToken(authResponseModel.token ?? "");
          _local.saveUser(
              authResponseModel.user?.toEntity() ?? const UserEntity());
          return Right(authResponseModel.toEntity());
        },
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterParams params,
  ) async {
    if (await _networkInfo.isConnected) {
      final res = await _remote.register(params);
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) {
          _local.saveToken(authResponseModel.token ?? "");
          _local.saveUser(
              authResponseModel.user?.toEntity() ?? const UserEntity());
          return Right(authResponseModel.toEntity());
        },
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity<dynamic>>> forgotPassword(
    ForgotPasswordParams params,
  ) async {
    if (await _networkInfo.isConnected) {
      final res = await _remote.forgotPassword(params);
      return res.fold(
        (failure) => Left(failure),
        (baseResponseModel) => Right(baseResponseModel.toEntity()),
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> resetPassword(
    ResetPasswordParams params,
  ) async {
    if (await _networkInfo.isConnected) {
      final res = await _remote.resetPassword(params);
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) {
          return Right(authResponseModel.toEntity());
        },
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity>> verifyCode(
    ResetPasswordParams params,
  ) async {
    if (await _networkInfo.isConnected) {
      final res = await _remote.verifyCode(params);
      return res.fold(
        (failure) => Left(failure),
        (baseResponseModel) => Right(baseResponseModel.toEntity()),
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }
}
