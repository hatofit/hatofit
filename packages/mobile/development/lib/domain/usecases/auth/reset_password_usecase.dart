import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part "reset_password_usecase.freezed.dart";
part 'reset_password_usecase.g.dart';

class ResetPasswordUsecase
    extends WithParamsUseCase<AuthResponseEntity, ResetPasswordParams> {
  final AuthRepository _repo;

  ResetPasswordUsecase(this._repo);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(
          ResetPasswordParams params) =>
      _repo.resetPassword(params);
}

@freezed
class ResetPasswordParams with _$ResetPasswordParams {
  const factory ResetPasswordParams({
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default("") String code,
  }) = _ResetPasswordParams;

  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordParamsFromJson(json);
}
