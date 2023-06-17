import 'package:get/get.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_binding.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_page.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
