import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/usecases/usecase.dart';
import 'package:hatofit/modules/auth/data/models/login_response_model.dart';
import 'package:hatofit/modules/auth/domain/repositories/auth_abs_repository.dart';

part 'login_usecase.freezed.dart';
part 'login_usecase.g.dart';

class LoginUsecase extends UseCase<LoginResponseModel, LoginParams> {
  final AuthAbsRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
 
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default("") String email,
    @Default("") String password,
  }) = _LoginParams;

  const LoginParams._();

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
