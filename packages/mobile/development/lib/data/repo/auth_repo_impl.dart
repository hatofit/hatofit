import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remote;
  final NetworkInfo _info;
  final UserLocalDataSource _local;

  const AuthRepoImpl(this._remote, this._local, this._info);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginParams params,
  ) async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.login(params);
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) async {
          final entity = authResponseModel.toEntity();
          await _local.upsertToken(entity.token ?? "");
          await _local.upsertUser(entity.user ?? const UserEntity());
          return Right(entity);
        },
      );
    } else {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> me() async {
    if (await _info.isHatofitConnected) {
      final res = await _remote.me();
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) async {
          final entity = authResponseModel.toEntity();
          await _local.upsertToken(entity.token ?? "");
          await _local.upsertUser(entity.user ?? const UserEntity());
          return Right(entity);
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
    if (await _info.isHatofitConnected) {
      final res = await _remote.register(params);
      return res.fold(
        (failure) => Left(failure),
        (authResponseModel) async {
          final entity = authResponseModel.toEntity();
          await _local.upsertToken(entity.token ?? "");
          await _local.upsertUser(entity.user ?? const UserEntity());
          return Right(entity);
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
    if (await _info.isHatofitConnected) {
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
    if (await _info.isHatofitConnected) {
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
    if (await _info.isHatofitConnected) {
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
