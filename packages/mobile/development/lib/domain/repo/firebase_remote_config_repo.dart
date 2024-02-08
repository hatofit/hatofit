import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';

abstract class FirebaseRemoteConfigRepo {
  Future<Either<Failure, String>> getString(String key);
  Future<Either<Failure, bool>> getBool(String key);
}
