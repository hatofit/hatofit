import 'package:dartz/dartz.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo_abs.dart';
import '../sources/api/auth_api.dart';

class AuthRepoIml extends AuthRepoAbs {
  @override
  Future<Either<Failure, Success>> login(String email, String password) async {
    final res = await AuthApi.login(email: email, password: password).request();
    return res;
  }

  @override
  Future<bool> logout(User user) {
    final res = AuthApi.logout(user: user).request();
    if (res is Failure) {
      throw res;
    } else {
      return Future.value(true);
    }
  }

  @override
  Future<Either<Failure, Success>> register(User user) async {
    final res = await AuthApi.register(user: user).request();
    return res;
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
