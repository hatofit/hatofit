import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource _remote;

  const ReportRepositoryImpl(
    this._remote,
  );

  @override
  Future<Either<Failure, ReportEntity>> getReport(
    GetReportParams params,
  ) async {
    final res = await _remote.getReport(params);
    return res.fold(
      (failure) async {
        return Left(failure);
      },
      (reportModel) {
        return Right(reportModel.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, List<ReportEntity>>> getReports(
    GetReportsParams params,
  ) async {
    final res = await _remote.getReports(params);
    return res.fold(
      (failure) async {
        return Left(failure);
      },
      (reportModels) {
        return Right(reportModels.map((e) => e.toEntity()).toList());
      },
    );
  }
}
