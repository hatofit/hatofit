import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpdateLanguageUsecase extends WithParamsUseCase<String, String> {
  final AppConfigRepo _repo;

  UpdateLanguageUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call(String params) async =>
      _repo.setLanguage(params);
}
