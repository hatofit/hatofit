import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource _remote;
  final ReportLocalDataSource _local;
  final NetworkInfo _info;

  const ReportRepositoryImpl(
    this._remote,
    this._local,
    this._info,
  );

  @override
  Future<Either<Failure, ReportEntity>> getReport(
    GetReportParams params,
  ) async {
    if (await _info.isConnected) {
      final res = await _remote.getReport(params);
      return res.fold(
        (failure) async {
          return await _local.getReport(params);
        },
        (reportModel) {
          final entity = reportModel.toEntity();
          _local.cacheReport(entity.id ?? "", entity);
          return Right(entity);
        },
      );
    } else {
      return await _local.getReport(params);
    }
  }

  @override
  Future<Either<Failure, List<ReportEntity>>> getReports(
    GetReportsParams params,
  ) async {
    if (await _info.isConnected) {
      final res = await _remote.getReports(params);
      return res.fold(
        (failure) async {
          return await _local.getReports();
        },
        (reportModels) async {
          final parser = ModelToEntityIsolateParser<List<ReportEntity>>(
            reportModels,
            (res) {
              return res.map((e) => e.toEntity()).toList();
            },
          );
          final res = await parser.parseInBackground();
          for (var element in res) {
            await _local.cacheReport(element.id ?? "", element);
          }
          return Right(res);
        },
      );
    } else {
      return await _local.getReports();
    }
  }
}
