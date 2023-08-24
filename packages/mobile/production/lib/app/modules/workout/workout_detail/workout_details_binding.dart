import 'package:get/get.dart';
import 'package:hatofit/app/modules/workout/workout_detail/workout_details_controller.dart';

class WorkoutDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutDetailsController>(() => WorkoutDetailsController());
  }
}
