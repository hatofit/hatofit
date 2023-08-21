import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/data/models/session.dart';
import 'package:hatofit/data/sources/api/session_api_repo_iml.dart';
import 'package:hatofit/domain/repos/session_repo_abs.dart';

class SessionRepoIml implements SessionRepoAbs {
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> saveSessionApi(
          Session session, String token) async =>
      await SessionApiRepoIml.save(session: session, token: token).request();

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchSessionApi(
          String token) async =>
      await SessionApiRepoIml.fetch(token: token).request();

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchSessionLocal() {
    // TODO: implement fetchSessionLocal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> saveSessionLocal(
      Session session) {
    // TODO: implement saveSessionLocal
    throw UnimplementedError();
  }
}
