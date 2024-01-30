import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class LoginUsecase extends WithParamsUseCase<AuthResponseEntity, LoginParams> {
  final AuthRepository _repo;

  LoginUsecase(this._repo);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(LoginParams params) =>
      _repo.login(params);
}
