import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadActiveThemeUsecase extends FNPUC<ActiveTheme> {
  final AppConfigRepo _repo;

  ReadActiveThemeUsecase(this._repo);

  @override
  Future<Either<Failure, ActiveTheme>> call() async => _repo.readActiveTheme();
}
