import 'package:dartz/dartz.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../models/user.dart';
import '../../domain/repos/auth_repo_abs.dart';
import '../sources/api/auth_api_repo_iml.dart';

class AuthRepoIml extends AuthRepoAbs {
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> login(
          String email, String password) async =>
      await AuthApiRepoIml.login(email: email, password: password).request();

  @override
  Future<Either<Failure, Success>> register(User user) async =>
   await AuthApiRepoIml.register(user: user).request();



  @override
  Future<bool> logout(User user) {
    final res = AuthApiRepoIml.logout(user: user).request();
    if (res is Failure) {
      throw res;
    } else {
      return Future.value(true);
    }
  }

  @override
  Future<User> updateUser(User user) {
    throw UnimplementedError();
  }
}
