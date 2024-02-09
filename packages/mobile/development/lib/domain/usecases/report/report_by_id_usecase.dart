import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReportByIdUsecase extends FPUC<ReportEntity, ByIdParams> {
  final ReportRepo _repo;

  ReportByIdUsecase(this._repo);

  @override
  Future<Either<Failure, ReportEntity>> call(ByIdParams params) =>
      _repo.readReportById(params);
}
