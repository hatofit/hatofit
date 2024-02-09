import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ForgotPasswordUsecase
    extends FPUC<BaseResponseEntity, ForgotPasswordParams> {
  final AuthRepo _repo;

  ForgotPasswordUsecase(this._repo);

  @override
  Future<Either<Failure, BaseResponseEntity>> call(
          ForgotPasswordParams params) =>
      _repo.forgotPassword(params);
}
