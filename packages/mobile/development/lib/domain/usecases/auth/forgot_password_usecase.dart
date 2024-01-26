import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part 'forgot_password_usecase.freezed.dart';
part 'forgot_password_usecase.g.dart';

class ForgotPasswordUsecase
    extends WithParamsUseCase<BaseResponseEntity, ForgotPasswordParams> {
  final AuthRepository _repo;

  ForgotPasswordUsecase(this._repo);

  @override
  Future<Either<Failure, BaseResponseEntity>> call(
          ForgotPasswordParams params) =>
      _repo.forgotPassword(params);
}

@freezed
class ForgotPasswordParams with _$ForgotPasswordParams {
  const factory ForgotPasswordParams({
    @Default("") String email,
  }) = _ForgotPasswordParams;

  factory ForgotPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordParamsFromJson(json);
}
