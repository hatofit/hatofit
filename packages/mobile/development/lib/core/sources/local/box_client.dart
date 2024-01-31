import 'package:hatofit/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum BoxKeys {
  user,
  exercise,
  session,
}

class BoxClient with FirebaseCrashLogger {
  static late Box _userBox;
  static late Box _exerciseBox;
  static late Box _sessionBox;

  static Future<void> userRegister() async {
    // Hive.registerAdapter(UserEntityAdapter());
    // Hive.registerAdapter(MetricUnitsEntityAdapter());
  }

  static Future<void> initHive() async {
    await Hive.initFlutter();

    await userRegister();

    if (!Hive.isBoxOpen(BoxKeys.user.name)) {
      _userBox = await Hive.openBox(BoxKeys.user.name);
    }
    if (!Hive.isBoxOpen(BoxKeys.exercise.name)) {
      _exerciseBox = await Hive.openBox(BoxKeys.exercise.name);
    }
    if (!Hive.isBoxOpen(BoxKeys.session.name)) {
      _sessionBox = await Hive.openBox(BoxKeys.session.name);
    }
  }

  BoxClient() {
    try {
      initHive().then((value) => log?.d("Hive initialized"));
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  Box get userBox => _userBox;

  Box get exerciseBox => _exerciseBox;

  Box get sessionBox => _sessionBox;
}
