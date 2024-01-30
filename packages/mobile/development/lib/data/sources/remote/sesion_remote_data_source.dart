import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class SessionRemoteDataSource {
  Future<Either<Failure, SessionModel>> getSession(
    GetSessionParams params,
  );
  Future<Either<Failure, List<SessionModel>>> getSessions(
    GetSessionsParams params,
  );
  Future<Either<Failure, SessionModel>> createSessions(
    CreateSessionParams params,
  );
}

class SessionRemoteDataSourceImpl implements SessionRemoteDataSource {
  final DioClient _client;

  SessionRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, SessionModel>> createSessions(
    CreateSessionParams params,
  ) async {
    final res = await _client.postRequest(
      ListAPI.session,
      data: params.toJson(),
      converter: (res) => SessionModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, SessionModel>> getSession(
    GetSessionParams params,
  ) async {
    final res = await _client.getRequest(
      "${ListAPI.session}/${params.id}",
      converter: (res) => SessionModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, List<SessionModel>>> getSessions(
    GetSessionsParams params,
  ) async {
    final res = await _client.getRequest(
      ListAPI.session,
      queryParameters: params.toJson(),
      converter: (res) {
        List<SessionModel> sessions = [];
        for (var element in res['sessions']) {
          sessions.add(SessionModel.fromJson(element as Map<String, dynamic>));
        }
        return sessions;
      },
    );

    return res;
  }
}
