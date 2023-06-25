import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/modules/history/history_controller.dart';
import 'package:polar_hr_devices/modules/home/home_controller.dart';
import 'package:polar_hr_devices/modules/settings/setting_controller.dart';
import 'package:polar_hr_devices/modules/workout/workout_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<WorkoutController>(() => WorkoutController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
