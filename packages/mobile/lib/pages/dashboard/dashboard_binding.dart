import 'package:get/get.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/pages/history/history_controller.dart';
import 'package:polar_hr_devices/pages/home/home_controller.dart';
import 'package:polar_hr_devices/pages/setting/setting_controller.dart';
import 'package:polar_hr_devices/pages/workout/workout_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<WorkoutController>(() => WorkoutController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
