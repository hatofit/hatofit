import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../app/core/domain/failure.dart';
import '../../../app/core/domain/success.dart';
import '../../models/user.dart';
import 'base/api_path.dart';
import 'base/api_payload_repo_abs.dart';
import 'base/api_source.dart';

enum AuthType { login, register, logout, updateUser }

class AuthApiRepoIml implements ApiPayloadRepoAbs {
  final AuthType type;
  final User? user;
  final String? email;
  final String? password;

  AuthApiRepoIml._({
    required this.type,
    this.user,
    this.email,
    this.password,
  });

  factory AuthApiRepoIml.login({
    required String email,
    required String password,
  }) =>
      AuthApiRepoIml._(
        type: AuthType.login,
        email: email,
        password: password,
      );

  factory AuthApiRepoIml.register({
    required User user,
  }) =>
      AuthApiRepoIml._(
        type: AuthType.register,
        user: user,
      );

  factory AuthApiRepoIml.logout({
    required User user,
  }) =>
      AuthApiRepoIml._(
        type: AuthType.logout,
        user: user,
      );

  factory AuthApiRepoIml.updateUser({
    required User user,
  }) =>
      AuthApiRepoIml._(
        type: AuthType.updateUser,
        user: user,
      );

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return ApiPath.login;
      case AuthType.register:
        return ApiPath.register;
      case AuthType.logout:
        return ApiPath.logout;
      case AuthType.updateUser:
        return ApiPath.updateUser;
    }
  }

  @override
  String get url => ApiPath.baseUri + path;

  @override
  HTTPMethod get method => HTTPMethod.post;

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Map<String, dynamic> get body {
    switch (type) {
      case AuthType.login:
        return {
          'email': email,
          'password': password,
        };
      case AuthType.register:
        return user!.toJson();
      case AuthType.logout:
        return {
          'email': user!.email,
        };
      case AuthType.updateUser:
        return user!.toJson();
    }
  }

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> request() async =>
      await ApiSource.instance.request(this);
}
