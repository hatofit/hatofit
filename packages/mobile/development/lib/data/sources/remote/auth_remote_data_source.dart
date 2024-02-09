import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, AuthResponseModel>> login(
    LoginParams params,
  );
  Future<Either<Failure, AuthResponseModel>> register(
    RegisterParams params,
  );
  Future<Either<Failure, UserModel?>> update(
    RegisterParams params,
  );
  Future<Either<Failure, AuthResponseModel>> me();
  Future<Either<Failure, BaseResponseModel>> forgotPassword(
    ForgotPasswordParams params,
  );
  Future<Either<Failure, AuthResponseModel>> resetPassword(
    ResetPasswordParams params,
  );
  Future<Either<Failure, BaseResponseModel>> verifyCode(
    ResetPasswordParams params,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, AuthResponseModel>> login(
    LoginParams params,
  ) async {
    final res = await _client.postRequest(
      APIConstant.get.authLogin,
      data: params.toJson(),
      converter: (res) =>
          AuthResponseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, AuthResponseModel>> register(
    RegisterParams params,
  ) async {
    final res = await _client.postRequest(
      APIConstant.get.authRegister,
      formData: params.toFormData(),
      converter: (res) =>
          AuthResponseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, UserModel?>> update(
    RegisterParams params,
  ) async {
    final res = await _client.postRequest(
      APIConstant.get.authUpdate,
      formData: params.toFormData(),
      converter: (res) {
        if (res['success']) {
          return UserModel.fromJson(res['user'] as Map<String, dynamic>);
        } else {
          return null;
        }
      },
    );

    return res;
  }

  @override
  Future<Either<Failure, AuthResponseModel>> me() async {
    final res = await _client.getRequest(
      APIConstant.get.authMe,
      converter: (res) =>
          AuthResponseModel.fromJson(res["auth"] as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, BaseResponseModel>> forgotPassword(
    ForgotPasswordParams params,
  ) {
    final res = _client.getRequest(
      "${APIConstant.get.forgotPassword}/${params.email}",
      converter: (res) =>
          BaseResponseModel.fromJson(res as Map<String, dynamic>, (res) => res),
    );

    return res;
  }

  @override
  Future<Either<Failure, AuthResponseModel>> resetPassword(
    ResetPasswordParams params,
  ) {
    final res = _client.putRequest(
      APIConstant.get.resetPassword,
      data: params.toJson(),
      converter: (res) =>
          AuthResponseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, BaseResponseModel>> verifyCode(
    ResetPasswordParams params,
  ) {
    final res = _client.postRequest(
      APIConstant.get.verifyCode,
      data: params.toJson(),
      converter: (res) =>
          BaseResponseModel.fromJson(res as Map<String, dynamic>, (res) => res),
    );

    return res;
  }
}
