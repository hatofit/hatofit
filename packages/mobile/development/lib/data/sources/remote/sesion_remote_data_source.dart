import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class SessionRemoteDataSource {
  Future<Either<Failure, SessionModel>> createSessions(
    CreateSessionParams params,
  );
  Future<Either<Failure, SessionModel>> readSessionById(
    ByIdParams params,
  );
  Future<Either<Failure, List<SessionModel>>> readSessionAll(
    ByLimitParams params,
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
      APIConstant.get.session,
      data: params.toJson(),
      converter: (res) =>
          SessionModel.fromJson(res['session'] as Map<String, dynamic>),
    );
    return res;
  }

  @override
  Future<Either<Failure, SessionModel>> readSessionById(
    ByIdParams params,
  ) async {
    final res = await _client.getRequest(
      "${APIConstant.get.session}/${params.id}",
      converter: (res) =>
          SessionModel.fromJson(res['session'] as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, List<SessionModel>>> readSessionAll(
    ByLimitParams params,
  ) async {
    final res = await _client.getRequest(
      APIConstant.get.session,
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
