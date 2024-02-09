import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ReportRemoteDataSource {
  Future<Either<Failure, ReportModel>> readReportById(
    ByIdParams params,
  );
  Future<Either<Failure, List<ReportModel>>> readReportAll(
    ByLimitParams params,
  );
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final DioClient _client;

  ReportRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, ReportModel>> readReportById(
    ByIdParams params,
  ) async {
    final res = await _client.getRequest(
      "${APIConstant.get.report}/${params.id}",
      converter: (res) => ReportModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, List<ReportModel>>> readReportAll(
    ByLimitParams params,
  ) async {
    final res = await _client.getRequest(
      APIConstant.get.report,
      queryParameters: params.toJson(),
      converter: (res) {
        List<ReportModel> reports = [];
        for (var element in res['reports']) {
          reports.add(ReportModel.fromJson(element as Map<String, dynamic>));
        }
        return reports;
      },
    );

    return res;
  }
}
