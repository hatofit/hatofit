import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
}
