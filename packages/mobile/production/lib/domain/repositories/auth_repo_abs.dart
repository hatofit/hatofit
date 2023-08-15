
import '../entities/user.dart';

abstract class AuthRepoAbs {
  Future<User> login(User user);
  Future<User> register(User user);
  Future<bool> logout(User user);
  Future<User> updateUser(User user);
}
