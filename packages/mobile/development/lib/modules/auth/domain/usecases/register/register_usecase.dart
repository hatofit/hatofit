import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/usecases/usecase.dart';
import 'package:hatofit/modules/auth/data/models/register_response_model.dart';
import 'package:hatofit/modules/auth/domain/repositories/auth_abs_repository.dart';
import 'package:hatofit/modules/user/data/models/user_model.dart';

part 'register_usecase.freezed.dart';
part 'register_usecase.g.dart';

class RegisterUsecase extends UseCase<RegisterResponseModel, RegisterParams> {
  final AuthAbsRepository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, RegisterResponseModel>> call(RegisterParams params) {
    throw UnimplementedError();
  }
}

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String gender,
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default(null) DateTime? dateOfBirth,
    @Default("") String photo,
    @Default(MetricUnitsModel()) MetricUnitsModel metricUnits,
    @Default(0) int height,
    @Default(0) int weight,
  }) = _RegisterParams;

  const RegisterParams._();

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
