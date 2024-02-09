import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

abstract class AppConfigLocalDataSource {
  Either<Failure, bool> readOfflineMode();
  Future<Either<Failure, bool>> upsertOfflineMode(bool value);

  Either<Failure, ActiveTheme> readActiveTheme();
  Future<Either<Failure, ActiveTheme>> upsertActiveTheme(ActiveTheme theme);

  Either<Failure, String> readLanguage();
  Future<Either<Failure, String>> upsertLanguage(String language);
}

class AppConfigLocalDataSourceImpl
    with FirebaseCrashLogger
    implements AppConfigLocalDataSource {
  final BoxClient _client;

  AppConfigLocalDataSourceImpl(this._client);

  @override
  Either<Failure, bool> readOfflineMode() {
    try {
      final bool? offlineMode =
          _client.appConfigBox.get(AppConfigKeys.offlineMode.name);
      if (offlineMode == null) {
        return const Left(CacheFailure('Offline mode not found'));
      }
      return Right(offlineMode);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> upsertOfflineMode(
    bool value,
  ) async {
    try {
      await _client.appConfigBox.put(AppConfigKeys.offlineMode.name, value);
      return readOfflineMode();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Either<Failure, ActiveTheme> readActiveTheme() {
    try {
      final ActiveTheme? theme =
          _client.appConfigBox.get(AppConfigKeys.activeTheme.name);
      if (theme == null) {
        return const Left(CacheFailure('Active theme not found'));
      }
      return Right(theme);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActiveTheme>> upsertActiveTheme(
    ActiveTheme theme,
  ) async {
    try {
      await _client.appConfigBox.put(AppConfigKeys.activeTheme.name, theme);
      return readActiveTheme();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Either<Failure, String> readLanguage() {
    try {
      final String? language =
          _client.appConfigBox.get(AppConfigKeys.language.name);
      if (language == null) {
        return const Left(CacheFailure('Language not found'));
      }
      return Right(language);
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> upsertLanguage(
    String language,
  ) async {
    try {
      await _client.appConfigBox.put(AppConfigKeys.language.name, language);
      return readLanguage();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }
}
