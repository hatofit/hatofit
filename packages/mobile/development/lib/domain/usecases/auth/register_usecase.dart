import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part 'register_usecase.freezed.dart';
part 'register_usecase.g.dart';

class RegisterUsecase
    extends WithParamsUseCase<AuthResponseEntity, RegisterParams> {
  final AuthRepository _repo;

  RegisterUsecase(this._repo);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(RegisterParams params) =>
      _repo.register(params);
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
    @Default("") String dateOfBirth,
    @Default("") String photo,
    @Default("") String height,
    @Default("") String weight,
    @Default(null) MetricUnitsParams? metricUnitsParams,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}

@freezed
class MetricUnitsParams with _$MetricUnitsParams {
  const factory MetricUnitsParams({
    @Default("") String energyUnits,
    @Default("") String heightUnits,
    @Default("") String weightUnits,
  }) = _MetricUnitsParams;

  factory MetricUnitsParams.fromJson(Map<String, dynamic> json) =>
      _$MetricUnitsParamsFromJson(json);
}
