import 'package:get/get.dart';

import '../../controllers/free_workout_controller.dart';


class FreeWorkoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreeWorkoutController>(() => FreeWorkoutController());
  }
}
