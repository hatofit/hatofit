import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/app/core/usecases/param_uc.dart';
import 'package:hatofit/domain/repos/report_repo_abs.dart';

class FetchReportApiUC extends ParamUseCase<Either<Failure, Success>, String> {
  final ReportRepoAbs _reportRepoAbs;
  FetchReportApiUC(this._reportRepoAbs);

  @override
  Future<Either<Failure, Success>> execute(String param) {
    return _reportRepoAbs.fetchReportApi(param);
  }
}
