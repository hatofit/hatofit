import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/dashboard_controller.dart';
import 'package:hatofit/app/modules/dashboard/views/history/history_controller.dart';
import 'package:hatofit/app/modules/dashboard/views/home/home_controller.dart';
import 'package:hatofit/app/modules/dashboard/views/home/views/mood_picker_widget.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/setting_controller.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<WorkoutController>(() => WorkoutController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<MoodController>(() => MoodController());
  }
}
