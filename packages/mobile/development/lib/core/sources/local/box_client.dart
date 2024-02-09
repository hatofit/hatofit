import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum BoxKeys {
  appConfig,
  user,
  exercise,
  session,
  report,
}

class BoxClient with FirebaseCrashLogger {
  static late Box _appConfigBox;
  static late Box _userBox;
  static late Box<ExerciseEntity> _exerciseBox;
  static late Box<SessionEntity> _sessionBox;
  static late Box<ReportEntity> _reportBox;

  static void registAdapter() {
    regisTheme();
    regisUser();
    regisExercise();
    regisSession();
    regisReport();
  }

  static Future<void> initHive() async {
    await Hive.initFlutter();
    registAdapter();

    if (!Hive.isBoxOpen(BoxKeys.appConfig.name)) {
      _appConfigBox = await Hive.openBox(BoxKeys.appConfig.name);
    }
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
      initHive().then((_) => null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  Box get userBox => _userBox;

  Box<ExerciseEntity> get exerciseBox => _exerciseBox;

  Box<SessionEntity> get sessionBox => _sessionBox;

  Box<ReportEntity> get reportBox => _reportBox;

  Box get appConfigBox => _appConfigBox;
 
}
