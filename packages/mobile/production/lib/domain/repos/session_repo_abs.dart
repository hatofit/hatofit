import 'package:dartz/dartz.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../data/models/session.dart';

abstract class SessionRepoAbs {
  Future<Either<Failure, Success<Map<String, dynamic>>>> saveSessionLocal(
      Session session);

  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchSessionLocal();

  Future<Either<Failure, Success<Map<String, dynamic>>>> saveSessionApi(
      Session session, String token);

  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchSessionApi(
      String token);
}
