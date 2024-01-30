import 'package:hatofit/domain/domain.dart';
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
    Hive.registerAdapter(UserEntityAdapter());
    Hive.registerAdapter(MetricUnitsEntityAdapter());
  }

  static Future<void> initHive() async {
    await Hive.initFlutter();

    await userRegister();

    if (!Hive.isBoxOpen(BoxKeys.user.name)) {
      _userBox = _createBox(BoxKeys.user.name);
    }
    if (!Hive.isBoxOpen(BoxKeys.exercise.name)) {
      _exerciseBox = _createBox(BoxKeys.exercise.name);
    }
    if (!Hive.isBoxOpen(BoxKeys.session.name)) {
      _sessionBox = _createBox(BoxKeys.session.name);
    }
  }

  BoxClient() {
    try {} catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  Box get userBox {
    try {
      _userBox = _createBox(BoxKeys.user.name);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _userBox;
  }

  Box get exerciseBox {
    try {
      _exerciseBox = _createBox(BoxKeys.exercise.name);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _exerciseBox;
  }

  Box get sessionBox {
    try {
      _sessionBox = _createBox(BoxKeys.session.name);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _sessionBox;
  }

  static Box _createBox(String boxName) => Hive.box(boxName);
}
