import 'dart:io';

import '../../../domain/entities/user.dart';
import 'base/api_path.dart';
import 'base/api_request.dart';
import 'base/api_source.dart';

enum AuthType { login, register, logout, updateUser }

class AuthApi implements APIRequest {
  final AuthType type;
  final User? user;
  final String? email;
  final String? password;

  AuthApi._({
    required this.type,
    this.user,
    this.email,
    this.password,
  });

  factory AuthApi.login({
    required String email,
    required String password,
  }) =>
      AuthApi._(
        type: AuthType.login,
        email: email,
        password: password,
      );

  factory AuthApi.register({
    required User user,
  }) =>
      AuthApi._(
        type: AuthType.register,
        user: user,
      );

  factory AuthApi.logout({
    required User user,
  }) =>
      AuthApi._(
        type: AuthType.logout,
        user: user,
      );

  factory AuthApi.updateUser({
    required User user,
  }) =>
      AuthApi._(
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
  Future request() async {
    return ApiSource.instance.request(this);
  }
}
