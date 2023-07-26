import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/workout/workout_detail/workout_details_controller.dart';

class WorkoutDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutDetailsController>(() => WorkoutDetailsController());
  }
}
