import 'package:get/get.dart';
import 'package:polar_hr_devices/pages/dashboard_binding.dart';
import 'package:polar_hr_devices/pages/dashboard_page.dart';
import 'package:polar_hr_devices/pages/history_detail_page.dart';
import 'package:polar_hr_devices/pages/history_page.dart';
import 'package:polar_hr_devices/pages/home_page.dart';
import 'package:polar_hr_devices/pages/setting_page.dart';
import 'package:polar_hr_devices/pages/workout_details_page.dart';
import 'package:polar_hr_devices/pages/workout_page.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

class AppPages {
  static var list = [
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
    ),
    GetPage(
      name: AppRoutes.workoutDetail,
      page: () => const WorkoutDetailPage(),
    ),
    GetPage(
      name: AppRoutes.historyDetail,
      page: () => const HistoryDetailPage(),
    ),
  ];
}
