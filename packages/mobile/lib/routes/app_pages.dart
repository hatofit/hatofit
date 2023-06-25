import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_binding.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_page.dart';
import 'package:polar_hr_devices/modules/history/detail_page/history_detail_page.dart';
import 'package:polar_hr_devices/modules/history/history_page.dart';
import 'package:polar_hr_devices/modules/home/home_page.dart';
import 'package:polar_hr_devices/modules/settings/change_goal/change_goal_binding.dart';
import 'package:polar_hr_devices/modules/settings/change_goal/change_goal_page.dart';
import 'package:polar_hr_devices/modules/settings/change_unit/change_unit_binding.dart';
import 'package:polar_hr_devices/modules/settings/change_unit/change_unit_page.dart';
import 'package:polar_hr_devices/modules/settings/setting_binding.dart';
import 'package:polar_hr_devices/modules/settings/setting_page.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_info_page.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_info_binding.dart';
import 'package:polar_hr_devices/modules/splash/loading_splash_screen.dart';
import 'package:polar_hr_devices/modules/workout/workout_page.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

class AppPages {
  static final list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const LoadingSplashScreen(),
    ),
    GetPage(
      name: AppRoutes.inputUserInfo,
      page: () => const InputUserInfoPage(),
      binding: InputUserInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.workout,
      page: () => const WorkoutPage(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryPage(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.changeUnit,
      page: () => const ChangeUnitPage(),
      binding: ChangeUnitBinding(),
    ),
    GetPage(
      name: AppRoutes.changeGoal,
      page: () => const ChangeGoalPage(),
      binding: ChangeGoalBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.workoutDetail,
    //   page: () => const WorkoutDetailsPage(),
    // ),
    GetPage(
      name: AppRoutes.historyDetail,
      page: () => const HistoryDetailPage(),
    ),
  ];
}
