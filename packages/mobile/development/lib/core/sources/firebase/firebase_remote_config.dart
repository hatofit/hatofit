import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

class RemoteConfig with FirebaseCrashLogger {
  static late FirebaseRemoteConfig _remoteConfig;

  static Future<bool> init() async {
    try {
      _remoteConfig = FirebaseRemoteConfig.instance;
      _remoteConfig.ensureInitialized();
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await _remoteConfig.setDefaults({
        FirebaseConstant.get.homeHeroKey:
            "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg",
        FirebaseConstant.get.isGoogleFitAvailable: false,
        FirebaseConstant.get.isGoogleOAuthAvailable: false,
        FirebaseConstant.get.baseUrl: "https://api.hatofit.com",
      });
      final res = await _remoteConfig.fetchAndActivate();
      return res;
    } catch (e) {
      return false;
    }
  }

  RemoteConfig() {
    try {
      init().then((_) => null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  Future<Either<Failure, String>> getString(String key) async {
    try {
      final value = _remoteConfig.getString(key);
      if (value.isEmpty) return const Left(NoDataFailure("No data found"));
      return Right(value);
    } on FirebaseException catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(FirebaseFailure(e.message ?? "FirebaseException"));
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(FirebaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> getBool(String key) async {
    try {
      final value = _remoteConfig.getBool(key);
      return Right(value);
    } on FirebaseException catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(FirebaseFailure(e.message ?? "FirebaseException"));
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
