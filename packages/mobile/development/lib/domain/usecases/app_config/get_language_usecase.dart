import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetLanguageUsecase extends NoParamsUseCase<String> {
  final AppConfigRepo _repo;

  GetLanguageUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call() async => _repo.getLanguage();
}
