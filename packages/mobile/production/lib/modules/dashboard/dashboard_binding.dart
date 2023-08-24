import 'package:get/get.dart';
import 'package:hatofit/modules/dashboard/dashboard_controller.dart';
import 'package:hatofit/modules/history/history_controller.dart';
import 'package:hatofit/modules/home/home_controller.dart';
import 'package:hatofit/modules/settings/setting_controller.dart';
import 'package:hatofit/modules/workout/workout_controller.dart';

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
