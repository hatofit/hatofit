import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ReportRepo {
  Future<Either<Failure, ReportEntity>> readReportById(
    ByIdParams params,
  );
  Future<Either<Failure, List<ReportEntity>>> readReportAll(
    ByLimitParams params,
  );
}
