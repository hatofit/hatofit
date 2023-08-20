import 'package:dartz/dartz.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import '../../../../app/core/usecases/param_uc.dart';
import '../../../repos/auth_repo_abs.dart';

class LoginUC extends ParamUseCase<
    Either<Failure, Success<Map<String, dynamic>>>, Tuple2<String, String>> {
  final AuthRepoAbs _authRepoAbs;
  LoginUC(this._authRepoAbs);
  @override
  Future<Either<Failure, Success<Map<String, dynamic>>>> execute(
      Tuple2<String, String> param) {
    return _authRepoAbs.login(param.value1, param.value2);
  }
}
