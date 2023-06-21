import 'package:get/get.dart';
import 'package:polar_hr_devices/controller/dashboard_controller.dart';
import 'package:polar_hr_devices/controller/history_controller.dart';
import 'package:polar_hr_devices/controller/home_controller.dart';
import 'package:polar_hr_devices/controller/setting_controller.dart';
import 'package:polar_hr_devices/controller/workout_controller.dart';

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
