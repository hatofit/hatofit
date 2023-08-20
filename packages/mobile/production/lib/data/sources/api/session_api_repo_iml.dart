import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/app/app.dart';
import 'package:hatofit/data/models/session.dart';

import '../../../app/core/domain/failure.dart';
import '../../../app/core/domain/success.dart';
import 'base/api_path.dart';
import 'base/api_payload_repo_abs.dart';
import 'base/api_source.dart';

enum SessionType { fetch, save }

class SessionApiRepoIml implements ApiPayloadRepoAbs {
  final SessionType type;
  final Session? session;
  final String token;

  SessionApiRepoIml._({
    required this.type,
    required this.token,
    this.session,
  });

  factory SessionApiRepoIml.fetch({required String token}) =>
      SessionApiRepoIml._(type: SessionType.fetch, token: token);

  factory SessionApiRepoIml.save(
          {required Session session, required String token}) =>
      SessionApiRepoIml._(
          type: SessionType.save, session: session, token: token);

  @override
  String get path {
    switch (type) {
      case SessionType.fetch:
        return ApiPath.session;
      case SessionType.save:
        return ApiPath.session;
    }
  }

  @override
  String get url => ApiPath.baseUri + path;

  @override
  HTTPMethod get method {
    switch (type) {
      case SessionType.fetch:
        return HTTPMethod.get;
      case SessionType.save:
        return HTTPMethod.post;
    }
  }

  @override
  Map<String, String> get headers {
    final header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'Authorization': 'Bearer $token',
    };
    switch (type) {
      case SessionType.fetch:
        return header;
      case SessionType.save:
        return header;
    }
  }

  @override
  Map<String, dynamic> get body {
    switch (type) {
      case SessionType.fetch:
        return {};
      case SessionType.save:
        return session!.toJson();
    }
  }

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> request() async {
    return ApiSource.instance.request(this);
  }
}
