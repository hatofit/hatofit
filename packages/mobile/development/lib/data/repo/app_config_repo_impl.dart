import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class AppConfigRepoImpl implements AppConfigRepo {
  final AppConfigLocalDataSource _local;

  AppConfigRepoImpl(this._local);

  @override
  Either<Failure, bool> readOfflineMode() => _local.readOfflineMode();

  @override
  Either<Failure, ActiveTheme> readActiveTheme() => _local.readActiveTheme();

  @override
  Either<Failure, String> readLanguage() => _local.readLanguage();

  @override
  Future<Either<Failure, bool>> upsertOfflineMode(
    bool value,
  ) async =>
      await _local.upsertOfflineMode(value);

  @override
  Future<Either<Failure, ActiveTheme>> upsertActiveTheme(
    ActiveTheme theme,
  ) async =>
      await _local.upsertActiveTheme(theme);

  @override
  Future<Either<Failure, String>> upsertLanguage(
    String language,
  ) async =>
      await _local.upsertLanguage(language);
}
