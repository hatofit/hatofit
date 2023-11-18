import 'package:get/get.dart';
import 'package:hatofit/app/modules/auth/loading_splash_screen.dart';
import 'package:hatofit/app/modules/auth/views/forgot_password/forgot_password_binding.dart';
import 'package:hatofit/app/modules/auth/views/forgot_password/forgot_password_page.dart';
import 'package:hatofit/app/modules/auth/views/greeting/greeting_page.dart';
import 'package:hatofit/app/modules/auth/views/login/login_binding.dart';
import 'package:hatofit/app/modules/auth/views/login/login_page.dart';
import 'package:hatofit/app/modules/auth/views/register/input_user_metric/input_user_metric_binding.dart';
import 'package:hatofit/app/modules/auth/views/register/input_user_metric/input_user_metric_page.dart';
import 'package:hatofit/app/modules/auth/views/register/register_binding.dart';
import 'package:hatofit/app/modules/auth/views/register/register_page.dart';
import 'package:hatofit/app/modules/dashboard/dashboard_binding.dart';
import 'package:hatofit/app/modules/dashboard/dashboard_page.dart';
import 'package:hatofit/app/modules/dashboard/views/history/history_page.dart';
import 'package:hatofit/app/modules/dashboard/views/home/home_page.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/setting_binding.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/setting_page.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/change_unit/change_unit_binding.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/change_unit/change_unit_page.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/profile/profile_binding.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/profile/profile_page.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/free_workout/free_workout_binding.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/free_workout/view/pick_wo_type.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_detail/workout_details_binding.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_detail/workout_details_page.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_page.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_start/workout_start_binding.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_start/workout_start_page.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/services_binding.dart';

import '../modules/dashboard/views/workout/free_workout/free_workout_page.dart';

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
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      bindings: [DashboardBinding(), ServicesBinding()],
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
      name: AppRoutes.pickWoType,
      page: () => const PickWoType(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryPage(),
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
  ];
}
