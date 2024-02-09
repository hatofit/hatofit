import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ResetPasswordUsecase
    extends FPUC<AuthResponseEntity, ResetPasswordParams> {
  final AuthRepo _repo;

  ResetPasswordUsecase(this._repo);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(
          ResetPasswordParams params) =>
      _repo.resetPassword(params);
}
