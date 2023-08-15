
import '../../app/core/usecases/param_uc.dart';
import '../entities/user.dart';
import '../repositories/auth_repo_abs.dart';

class RegisterUC extends ParamUseCase<User, User> {
  final AuthRepoAbs _authRepoAbs;
  RegisterUC(this._authRepoAbs);
  @override
  Future<User> execute(User param) {
    return _authRepoAbs.register(param);
  }
}
