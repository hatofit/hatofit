import 'package:get/get.dart';
import 'package:hatofit/presentation/controller/auth/auth_bind.dart';
import 'package:hatofit/presentation/pages/splash/firstTime/register/view/input_user_metric_page.dart';

import '../../presentation/controller/page/page_bind.dart';
import '../../presentation/controller/reg/reg_bind.dart';
import '../services/services_binding.dart';
import 'app_routes.dart';
import '../../presentation/pages/free_workout/free_workout_page.dart';
import '../../presentation/pages/dashboard/dashboard_page.dart';
import '../../presentation/pages/history/detail_page/history_detail_page.dart';
import '../../presentation/pages/history/detail_page/histpry_detail_binding.dart';
import '../../presentation/pages/history/history_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/settings/change_unit/change_unit_binding.dart';
import '../../presentation/pages/settings/change_unit/change_unit_page.dart';
import '../../presentation/pages/settings/device_integration/device_integration_binding.dart';
import '../../presentation/pages/settings/device_integration/device_integration_page.dart';
import '../../presentation/pages/settings/profile/profile_binding.dart';
import '../../presentation/pages/settings/profile/profile_page.dart';
import '../../presentation/pages/settings/setting_binding.dart';
import '../../presentation/pages/settings/setting_page.dart';
import '../../presentation/pages/splash/firstTime/greeting/greeting_page.dart';
import '../../presentation/pages/splash/firstTime/login/login_page.dart';
import '../../presentation/pages/splash/firstTime/register/register_page.dart';
import '../../presentation/pages/splash/loading_splash_screen.dart';
import '../../presentation/pages/workout/workout_detail/workout_details_binding.dart';
import '../../presentation/pages/workout/workout_detail/workout_details_page.dart';
import '../../presentation/pages/workout/workout_page.dart';
import '../../presentation/pages/workout/workout_start/workout_start_binding.dart';
import '../../presentation/pages/workout/free_workout/free_workout_binding.dart';
import '../../presentation/pages/workout/workout_start/workout_start_page.dart';

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
      bindings: [AuthBind(), RegBind()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.inputUserMetric,
      page: () => const InputUserMetricPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      // binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      bindings: [PageBind(), ServicesBinding()],
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
      name: AppRoutes.freeWorkout,
      page: () => const FreeWorkoutPage(),
      binding: FreeWorkoutBinding(),
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
      page: () => const DeviceIntegrationPage(),
      binding: DeviceIntegrationBinding(),
      transition: Transition.cupertino,
    )
  ];
}
