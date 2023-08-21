import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/data/sources/api/report_api_repo_iml.dart';
import 'package:hatofit/domain/repos/report_repo_abs.dart';

class ReportRepoIml implements ReportRepoAbs {
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchReportApi(
      String id) async {
    final res = await ReportApiRepoIml.fetch(id: id).request();
    return res;
  }

  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchReportLocal(
      String id) {
    // TODO: implement fetchReportLocal
    throw UnimplementedError();
  }
}
