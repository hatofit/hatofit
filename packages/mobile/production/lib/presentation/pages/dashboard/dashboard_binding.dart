import 'package:get/get.dart';

import 'dashboard_controller.dart';

import '../history/history_controller.dart';
import '../home/home_controller.dart';
import '../settings/setting_controller.dart';
import '../workout/workout_controller.dart';

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
