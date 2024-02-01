import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/local/box_client.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ReportLocalDataSource {
  Future<Either<Failure, ReportEntity>> getReport(
    GetReportParams params,
  );
  Future<Either<Failure, List<ReportEntity>>> getReports();
  Future<Either<Failure, ReportEntity>> cacheReport(
    String id,
    ReportEntity entity,
  );
}

class ReportLocalDataSourceImpl implements ReportLocalDataSource {
  final BoxClient _box;

  ReportLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, ReportEntity>> cacheReport(
    String id,
    ReportEntity report,
  ) async {
    await _box.reportBox.put(id, report);
    final res = _box.reportBox.get(id);
    if (res == null) {
      return const Left(CacheFailure("Failed to cache report"));
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, ReportEntity>> getReport(
    GetReportParams params,
  ) async {
    final ReportEntity? res = _box.reportBox.get(
      params.id,
    );
    if (res == null) {
      return const Left(CacheFailure("Report not found"));
    }
    return Right(res);
  }

  @override
  Future<Either<Failure, List<ReportEntity>>> getReports() async {
    final keys = _box.reportBox.keys;

    if (keys.isEmpty) {
      return const Left(CacheFailure("Reports not found"));
    }

    List<ReportEntity> found = [];

    for (var element in keys) {
      final res = _box.reportBox.get(element);
      if (res != null) {
        found.add(res);
      }
    }

    if (found.isEmpty) {
      return const Left(CacheFailure("Reports not found"));
    }
    return Right(found);
  }
}
