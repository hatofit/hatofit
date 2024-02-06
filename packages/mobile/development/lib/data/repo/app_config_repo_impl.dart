import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class AppConfigRepoImpl implements AppConfigRepo {
  final AppConfigLocalDataSource _local;

  AppConfigRepoImpl(this._local);

  @override
  Either<Failure, bool> getOfflineMode() => _local.getOfflineMode();

  @override
  Either<Failure, ActiveTheme> getActiveTheme() => _local.getActiveTheme();

  @override
  Either<Failure, String> getLanguage() => _local.getLanguage();

  @override
  Future<Either<Failure, bool>> setOfflineMode(
    bool value,
  ) async =>
      await _local.setOfflineMode(value);

  @override
  Future<Either<Failure, ActiveTheme>> setActiveTheme(
    ActiveTheme theme,
  ) async =>
      await _local.setActiveTheme(theme);

  @override
  Future<Either<Failure, String>> setLanguage(
    String language,
  ) async =>
      await _local.setLanguage(language);
}
