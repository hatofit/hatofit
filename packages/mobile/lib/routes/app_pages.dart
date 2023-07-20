import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_binding.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_page.dart';
import 'package:polar_hr_devices/modules/history/detail_page/history_detail_page.dart';
import 'package:polar_hr_devices/modules/history/detail_page/histpry_detail_binding.dart';
import 'package:polar_hr_devices/modules/history/history_page.dart';
import 'package:polar_hr_devices/modules/home/home_page.dart';
import 'package:polar_hr_devices/modules/settings/change_unit/change_unit_binding.dart';
import 'package:polar_hr_devices/modules/settings/change_unit/change_unit_page.dart';
import 'package:polar_hr_devices/modules/settings/device_integration/device_integration_binding.dart';
import 'package:polar_hr_devices/modules/settings/device_integration/device_integration_page.dart';
import 'package:polar_hr_devices/modules/settings/setting_binding.dart';
import 'package:polar_hr_devices/modules/settings/setting_page.dart';
import 'package:polar_hr_devices/modules/settings/profile/profile_binding.dart';
import 'package:polar_hr_devices/modules/settings/profile/profile_page.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/greeting/greeting_page.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/login/login_binding.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/login/login_page.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/register/register_page.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/register/register_binding.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_metric/input_user_metric_binding.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_metric/input_user_metric_page.dart';
import 'package:polar_hr_devices/modules/splash/loading_splash_screen.dart';
import 'package:polar_hr_devices/modules/workout/workout_detail/workout_details_binding.dart';
import 'package:polar_hr_devices/modules/workout/workout_detail/workout_details_page.dart';
import 'package:polar_hr_devices/modules/workout/workout_page.dart';
import 'package:polar_hr_devices/modules/workout/workout_start/workout_start_binding.dart';
import 'package:polar_hr_devices/modules/workout/workout_start/workout_start_page.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/services_binding.dart';

class AppPages {
  AppPages._();

  static final list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const LoadingSplashScreen(),
      binding: ServicesBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.greeting,
      page: () => const GreetingPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.inputUserMetric,
      page: () => const InputUserMetricPage(),
      binding: InputUserMetricBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.workout,
      page: () => const WorkoutPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.workoutDetail,
      page: () => WorkoutDetailsPage(Get.arguments),
      binding: WorkoutDetailsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.workoutStart,
      page: () => WorkoutStartPage(Get.arguments),
      binding: WorkoutStartBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.historyDetail,
      page: () => HistoryDetailPage(Get.arguments),
      binding: HistoryDetailBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingPage(),
      binding: SettingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.changeUnit,
      page: () => const ChangeUnitPage(),
      binding: ChangeUnitBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.deviceIntegration,
      page: () => DeviceIntegrationPage(),
      binding: DeviceIntegrationBinding(),
      transition: Transition.cupertino,
    )
  ];
}
