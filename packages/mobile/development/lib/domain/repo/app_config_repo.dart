import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';

abstract class AppConfigRepo {
  Either<Failure, bool> getOfflineMode();
  Future<Either<Failure, bool>> setOfflineMode(bool value);

  Either<Failure, ActiveTheme> getActiveTheme();
  Future<Either<Failure, ActiveTheme>> setActiveTheme(ActiveTheme theme);

  Either<Failure, String> getLanguage();
  Future<Either<Failure, String>> setLanguage(String language);
}
