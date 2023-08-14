import 'package:get/get.dart';

import 'workout_start_controller.dart';
class WorkoutStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutStartController>(() => WorkoutStartController());
  }
}
