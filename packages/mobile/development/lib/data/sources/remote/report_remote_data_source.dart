import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ReportRemoteDataSource {
  Future<Either<Failure, ReportModel>> getReport(
    GetReportParams params,
  );
  Future<Either<Failure, List<ReportModel>>> getReports(
    GetReportsParams params,
  );
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final DioClient _client;

  ReportRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, ReportModel>> getReport(
    GetReportParams params,
  ) async {
    final res = await _client.getRequest(
      "${ListAPI.report}/${params.id}",
      converter: (res) => ReportModel.fromJson(res as Map<String, dynamic>),
    );

    return res;
  }

  @override
  Future<Either<Failure, List<ReportModel>>> getReports(
    GetReportsParams params,
  ) async {
    final res = await _client.getRequest(
      ListAPI.report,
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
