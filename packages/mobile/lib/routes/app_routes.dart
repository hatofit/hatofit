abstract class AppRoutes {
  static const String splash = '/splash';
  static const String greeting = '/splash/greeting';
  static const String inputUserInfo = '/splash/inputUserInfo';

  static const String dashboard = '/';
  static const String home = '/home';

  static const String workout = '/workout';
  static const String workoutDetail = '/workout/detail';
  static const String workoutStart = '/workout/start';

  static const String history = '/history';
  static const String historyDetail = '/history/detail:workoutId';

  static const String setting = '/setting';
  static const String changeUnit = '/setting/changeUnit';
  static const String changeGoal = '/setting/changeGoal';
}
