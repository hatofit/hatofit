import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/local/local.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

enum UserBoxKeys {
  user,
  token,
  todayMood,
  locale,
  weight,
  height,
  theme,
  energyUnit,
  weightUnit,
  heightUnit,
  gender,
  dateOfBirth,
}

abstract class UserLocalDataSource {
  Either<Failure, UserEntity> getUser();
  Either<Failure, void> saveUser(UserEntity user);

  Either<Failure, String?> getToken();
  Either<Failure, void> saveToken(String token);

  Either<Failure, void> saveTodayMood(String mood);
  Either<Failure, String?> getTodayMood();

  Either<Failure, void> saveLocale(String locale);
  Either<Failure, String?> getLocale();

  Either<Failure, void> saveWeight(double weight);
  Either<Failure, double?> getWeight();

  Either<Failure, void> saveHeight(double height);
  Either<Failure, double?> getHeight();

  Either<Failure, void> saveTheme(ActiveTheme theme);
  Either<Failure, ActiveTheme?> getTheme();

  Either<Failure, void> saveEnergyUnit(String energyUnit);
  Either<Failure, String?> getEnergyUnit();

  Either<Failure, void> saveWeightUnit(String weightUnit);
  Either<Failure, String?> getWeightUnit();

  Either<Failure, void> saveHeightUnit(String heightUnit);
  Either<Failure, String?> getHeightUnit();

  Either<Failure, void> saveGender(String gender);
  Either<Failure, String?> getGender();

  Either<Failure, void> saveDateOfBirth(String dateOfBirth);
  Either<Failure, String?> getDateOfBirth();
}

class UserLocalDataSourceImpl
    with FirebaseCrashLogger
    implements UserLocalDataSource {
  final BoxClient _client;

  const UserLocalDataSourceImpl(this._client);

  @override
  Either<Failure, UserEntity> getUser() {
    try {
      final UserEntity? res = _client.userBox.get(UserBoxKeys.user.name);
      if (res == null) throw Left(CacheFailure("User not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getToken() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.token.name);
      if (res == null) throw Left(CacheFailure("Token not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getDateOfBirth() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.dateOfBirth.name);
      if (res == null) throw Left(CacheFailure("Date of birth not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getEnergyUnit() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.energyUnit.name);
      if (res == null) throw Left(CacheFailure("Energy unit not found"));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getGender() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.gender.name);
      if (res == null) throw Left(CacheFailure('Gender not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, double?> getHeight() {
    try {
      final double? res = _client.userBox.get(UserBoxKeys.height.name);
      if (res == null) throw Left(CacheFailure('Height not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getHeightUnit() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.heightUnit.name);
      if (res == null) throw Left(CacheFailure('Height unit not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getLocale() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.locale.name);
      if (res == null) throw Left(CacheFailure('Locale not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, ActiveTheme?> getTheme() {
    try {
      final ActiveTheme? res = _client.userBox.get(UserBoxKeys.theme.name);
      if (res == null) throw Left(CacheFailure('Theme not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getTodayMood() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.todayMood.name);
      if (res == null) throw Left(CacheFailure('Today mood not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, double?> getWeight() {
    try {
      final double? res = _client.userBox.get(UserBoxKeys.weight.name);
      if (res == null) throw Left(CacheFailure('Weight not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, String?> getWeightUnit() {
    try {
      final String? res = _client.userBox.get(UserBoxKeys.weightUnit.name);
      if (res == null) throw Left(CacheFailure('Weight unit not found'));
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveUser(UserEntity user) {
    try {
      _client.userBox.put(UserBoxKeys.user.name, user);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveToken(String token) {
    try {
      _client.userBox.put(UserBoxKeys.token.name, token);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveDateOfBirth(String dateOfBirth) {
    try {
      _client.userBox.put(UserBoxKeys.dateOfBirth.name, dateOfBirth);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveEnergyUnit(String energyUnit) {
    try {
      _client.userBox.put(UserBoxKeys.energyUnit.name, energyUnit);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveGender(String gender) {
    try {
      _client.userBox.put(UserBoxKeys.gender.name, gender);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveHeight(double height) {
    try {
      _client.userBox.put(UserBoxKeys.height.name, height);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveHeightUnit(String heightUnit) {
    try {
      _client.userBox.put(UserBoxKeys.heightUnit.name, heightUnit);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveLocale(String locale) {
    try {
      _client.userBox.put(UserBoxKeys.locale.name, locale);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveTheme(ActiveTheme theme) {
    try {
      _client.userBox.put(UserBoxKeys.theme.name, theme);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveTodayMood(String mood) {
    try {
      _client.userBox.put(UserBoxKeys.todayMood.name, mood);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveWeight(double weight) {
    try {
      _client.userBox.put(UserBoxKeys.weight.name, weight);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Either<Failure, void> saveWeightUnit(String weightUnit) {
    try {
      _client.userBox.put(UserBoxKeys.weightUnit.name, weightUnit);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(CacheFailure("Error saving weight unit"));
    }
  }
}
