import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part 'login_usecase.freezed.dart';
part 'login_usecase.g.dart';

class LoginUsecase extends WithParamsUseCase<AuthResponseEntity, LoginParams> {
  final AuthRepository _repo;

  LoginUsecase(this._repo);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(LoginParams params) =>
      _repo.login(params);
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default("") String email,
    @Default("") String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
