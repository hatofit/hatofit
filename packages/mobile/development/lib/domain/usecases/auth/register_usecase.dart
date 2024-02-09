import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class RegisterUsecase extends FPUC<AuthResponseEntity, RegisterParams> {
  final AuthRepo _repo;

  RegisterUsecase(this._repo);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(RegisterParams params) =>
      _repo.register(params);
}
