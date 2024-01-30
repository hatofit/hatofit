import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ReportRepository {
  Future<Either<Failure, List<ReportEntity>>> getReports(
    GetReportsParams params,
  );
  Future<Either<Failure, ReportEntity>> getReport(
    GetReportParams params,
  );
}
