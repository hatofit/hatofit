import 'package:get/get.dart';
import 'package:hatofit/presentation/controller/auth/auth_bind.dart';
import 'package:hatofit/presentation/pages/splash/auth/register/view/input_user_metric_page.dart';

import '../../presentation/controller/page/page_bind.dart';
import '../../presentation/controller/reg/reg_bind.dart';
import '../../presentation/controller/wo/wo_bind.dart';
import '../services/services_binding.dart';
import 'app_routes.dart';
import '../../presentation/pages/dashboard/dashboard_page.dart';
import '../../presentation/pages/history/history_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/splash/view/greeting_page.dart';
import '../../presentation/pages/splash/auth/login/login_page.dart';
import '../../presentation/pages/splash/auth/register/register_page.dart';
import '../../presentation/pages/splash/loading_splash_screen.dart';
import '../../presentation/pages/workout/workout_page.dart';

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
      bindings: [PageBind(), ServicesBinding(), WoBind()],
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
      name: AppRoutes.history,
      page: () => const HistoryPage(),
      transition: Transition.cupertino,
    ),
  ];
}
