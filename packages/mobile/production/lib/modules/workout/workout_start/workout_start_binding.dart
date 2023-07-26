import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/workout/workout_start/workout_start_controller.dart';

class WorkoutStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutStartController>(() => WorkoutStartController());
  }
}
