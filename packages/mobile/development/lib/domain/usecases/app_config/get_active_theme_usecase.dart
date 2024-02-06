import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetActiveThemeUsecase extends NoParamsUseCase<ActiveTheme> {
  final AppConfigRepo _repo;

  GetActiveThemeUsecase(this._repo);

  @override
  Future<Either<Failure, ActiveTheme>> call() async => _repo.getActiveTheme();
}
