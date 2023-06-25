import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/settings/change_goal/change_goal_controller.dart';
 
class ChangeGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeGoalController>(() => ChangeGoalController());
  }
}