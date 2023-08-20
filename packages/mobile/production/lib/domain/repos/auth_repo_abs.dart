import 'package:dartz/dartz.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../data/models/user.dart';

abstract class AuthRepoAbs {
  Future<Either<Failure, Success<Map<String, dynamic>>>> login(String email, String password);
  Future<Either<Failure, Success>> register(User user);
  Future logout(User user);
  Future updateUser(User user);
}
