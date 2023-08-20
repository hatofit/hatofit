import 'package:dartz/dartz.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import '../../../../app/core/usecases/param_uc.dart';
import '../../../../data/models/user.dart';
import '../../../repos/auth_repo_abs.dart';

class RegisterUC extends ParamUseCase<Either<Failure, Success>, User> {
  final AuthRepoAbs _authRepoAbs;
  RegisterUC(this._authRepoAbs);

  @override
  Future<Either<Failure, Success>> execute(
    User param,
  ) {
    return _authRepoAbs.register(param);
  }
}
