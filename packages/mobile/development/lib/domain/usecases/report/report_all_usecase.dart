import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReportAllUsecase extends FPUC<List<ReportEntity>, ByLimitParams> {
  final ReportRepo _repo;

  ReportAllUsecase(this._repo);

  @override
  Future<Either<Failure, List<ReportEntity>>> call(ByLimitParams params) =>
      _repo.readReportAll(params);
}
