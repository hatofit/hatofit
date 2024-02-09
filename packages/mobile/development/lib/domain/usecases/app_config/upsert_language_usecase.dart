import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpesertLanguageUsecase extends FPUC<String, String> {
  final AppConfigRepo _repo;

  UpesertLanguageUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call(String params) async =>
      _repo.upsertLanguage(params);
}
