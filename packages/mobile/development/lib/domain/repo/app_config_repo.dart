import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';

abstract class AppConfigRepo {
  Either<Failure, bool> readOfflineMode();
  Future<Either<Failure, bool>> upsertOfflineMode(bool value);

  Either<Failure, ActiveTheme> readActiveTheme();
  Future<Either<Failure, ActiveTheme>> upsertActiveTheme(ActiveTheme theme);

  Either<Failure, String> readLanguage();
  Future<Either<Failure, String>> upsertLanguage(String language);
}
