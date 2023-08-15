
import '../../app/core/domain/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo_abs.dart';
import '../sources/api/auth_api.dart';

class AuthRepoIml extends AuthRepoAbs {
  @override
  Future<User> login(User user) async {
    final res = await AuthApi.login(user: user).request();
    if (res is Failure) {
      throw res;
    } else {
      return User.fromJson(res);
    }
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
  Future<User> register(User user) async {
    final res = await AuthApi.register(user: user).request();
    if (res is Failure) {
      throw res;
    } else {
      return User.fromJson(res);
    }
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
