import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_start/workout_start_controller.dart';

class WorkoutStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutStartController>(() => WorkoutStartController());
  }
}
