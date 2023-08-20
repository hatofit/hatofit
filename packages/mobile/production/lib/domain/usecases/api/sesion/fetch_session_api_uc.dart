import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/app/core/usecases/param_uc.dart';
import 'package:hatofit/domain/repos/session_repo_abs.dart';

class FetchSessionApiUC extends ParamUseCase<Either<Failure, Success>, String> {
  final SessionRepoAbs _sessionRepoAbs;
  FetchSessionApiUC(this._sessionRepoAbs);

  @override
  Future<Either<Failure, Success>> execute(
    String param,
  ) {
    return _sessionRepoAbs.fetchSessionApi(param);
  }
}
