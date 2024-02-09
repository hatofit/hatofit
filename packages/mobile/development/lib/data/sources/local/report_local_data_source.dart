import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/local/box_client.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ReportLocalDataSource {
  Future<Either<Failure, ReportEntity>> cacheReport(
    ReportEntity entity,
  );
  Future<Either<Failure, ReportEntity>> readReportById(
    ByIdParams params,
  );
  Future<Either<Failure, List<ReportEntity>>> readReportAll();
}

class ReportLocalDataSourceImpl implements ReportLocalDataSource {
  final BoxClient _box;

  ReportLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, ReportEntity>> cacheReport(
    ReportEntity report,
  ) async {
    final all = _box.reportBox.toMap();
    int key = 0;

    for (var element in all.entries) {
      if (element.value.id == report.id) {
        await _box.reportBox.put(element.key, report);
      } else {
        key = await _box.reportBox.add(report);
      }
    }

    final res = _box.reportBox.get(key);
    if (res == null) {
      return const Left(CacheFailure("Failed to cache report"));
    }

    return Right(res);
  }

  @override
  Future<Either<Failure, ReportEntity>> readReportById(
    ByIdParams params,
  ) async {
    final all = _box.reportBox.toMap();
    ReportEntity? found;

    for (var element in all.entries) {
      if (element.value.id == params.id) {
        found = element.value;
      }
    }

    if (found == null) {
      return const Left(CacheFailure("Report not found"));
    }

    return Right(found);
  }

  @override
  Future<Either<Failure, List<ReportEntity>>> readReportAll() async {
    final all = _box.reportBox.values;

    if (all.isEmpty) {
      return const Left(CacheFailure("Reports not found"));
    }

    return Right(all.toList());
  }
}
