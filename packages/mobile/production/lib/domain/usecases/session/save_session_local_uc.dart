import 'package:dartz/dartz.dart';

import '../../../app/core/domain/failure.dart';
import '../../../app/core/domain/success.dart';
import '../../../app/core/usecases/param_uc.dart';
import '../../../data/models/session.dart';
import '../../repositories/session_repo_abs.dart';

class SaveSessionLocalUc
    extends ParamUseCase<Either<Failure, Success>, Session> {
  final SessionRepoAbs _sessionRepoAbs;
  SaveSessionLocalUc(this._sessionRepoAbs);
  @override
  Future<Either<Failure, Success>> execute(Session param) {
    return _sessionRepoAbs.saveSessionLocal(param);
  }
}
