import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum BoxKeys {
  user,
  exercise,
  session,
  report,
}

class BoxClient with FirebaseCrashLogger {
  static late Box _userBox;
  static late Box<ExerciseEntity> _exerciseBox;
  static late Box<SessionEntity> _sessionBox;
  static late Box<ReportEntity> _reportBox;

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
      _exerciseBox = await Hive.openBox<ExerciseEntity>(BoxKeys.exercise.name);
    }
    if (!Hive.isBoxOpen(BoxKeys.session.name)) {
      _sessionBox = await Hive.openBox(BoxKeys.session.name);
    }
    if (!Hive.isBoxOpen(BoxKeys.report.name)) {
      _reportBox = await Hive.openBox(BoxKeys.report.name);
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

  Box<ExerciseEntity> get exerciseBox => _exerciseBox;

  Box<SessionEntity> get sessionBox => _sessionBox;

  Box<ReportEntity> get reportBox => _reportBox;
}
