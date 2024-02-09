import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpdateActiveThemeUsecase extends FPUC<ActiveTheme, ActiveTheme> {
  final AppConfigRepo _repo;

  UpdateActiveThemeUsecase(this._repo);

  @override
  Future<Either<Failure, ActiveTheme>> call(ActiveTheme params) =>
      _repo.upsertActiveTheme(params);
}
