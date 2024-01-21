import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, AuthResponseModel>> login(LoginParams params);
  Future<Either<Failure, AuthResponseModel>> register(RegisterParams params);
  Future<Either<Failure, AuthResponseModel>> me();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, AuthResponseModel>> login(LoginParams params) async {
    final res = await _client.postRequest(
      ListAPI.authLogin,
      data: params.toJson(),
      converter: (res) =>
          AuthResponseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, AuthResponseModel>> register(
      RegisterParams params) async {
    final res = await _client.postRequest(
      ListAPI.authLogin,
      data: params.toJson(),
      converter: (res) =>
          AuthResponseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, AuthResponseModel>> me() async {
    final res = await _client.getRequest(
      ListAPI.authMe,
      converter: (res) =>
          AuthResponseModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }
}
