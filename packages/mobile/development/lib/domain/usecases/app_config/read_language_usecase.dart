import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadLanguageUsecase extends FNPUC<String> {
  final AppConfigRepo _repo;

  ReadLanguageUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call() async => _repo.readLanguage();
}
