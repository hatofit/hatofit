import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetReportsUsecase
    extends WithParamsUseCase<List<ReportEntity>, GetReportsParams> {
  final ReportRepository _repo;

  GetReportsUsecase(this._repo);

  @override
  Future<Either<Failure, List<ReportEntity>>> call(GetReportsParams params) =>
      _repo.getReports(params);
}
