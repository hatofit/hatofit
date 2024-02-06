import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

abstract class AppConfigLocalDataSource {
  Either<Failure, bool> getOfflineMode();
  Future<Either<Failure, bool>> setOfflineMode(bool value);

  Either<Failure, ActiveTheme> getActiveTheme();
  Future<Either<Failure, ActiveTheme>> setActiveTheme(ActiveTheme theme);

  Either<Failure, String> getLanguage();
  Future<Either<Failure, String>> setLanguage(String language);
}

class AppConfigLocalDataSourceImpl
    with FirebaseCrashLogger
    implements AppConfigLocalDataSource {
  final BoxClient _client;

  AppConfigLocalDataSourceImpl(this._client);

  @override
  Either<Failure, bool> getOfflineMode() {
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
  Future<Either<Failure, bool>> setOfflineMode(bool value) async {
    try {
      await _client.appConfigBox.put(AppConfigKeys.offlineMode.name, value);
      return getOfflineMode();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Either<Failure, ActiveTheme> getActiveTheme() {
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
  Either<Failure, String> getLanguage() {
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
  Future<Either<Failure, ActiveTheme>> setActiveTheme(ActiveTheme theme) async {
    try {
      await _client.appConfigBox.put(AppConfigKeys.activeTheme.name, theme);
      return getActiveTheme();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> setLanguage(String language) async {
    try {
      await _client.appConfigBox.put(AppConfigKeys.language.name, language);
      return getLanguage();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(CacheFailure(e.toString()));
    }
  }
}
