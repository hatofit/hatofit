import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

class RemoteConfig with FirebaseCrashLogger {
  static late FirebaseRemoteConfig _remoteConfig;

  static Future<bool> init() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    _remoteConfig.ensureInitialized();
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await _remoteConfig.setDefaults({
      FirebaseConstant.get.homeHeroKey:
          "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg",
    });
    final res = await _remoteConfig.fetchAndActivate();
    return res;
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
      return left(FirebaseFailure(e.message ?? "FirebaseException"));
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return left(FirebaseFailure(e.toString()));
    }
  }
}
