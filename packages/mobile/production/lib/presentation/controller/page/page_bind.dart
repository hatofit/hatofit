import 'package:get/get.dart';
import 'package:hatofit/data/repository/workout_repo_iml.dart';
import 'package:hatofit/domain/usecases/workout/save_workout_local_uc.dart';
import 'package:hatofit/domain/usecases/workout/workout_local_uc.dart';

import '../../../domain/usecases/workout/workout_api_uc.dart';
import 'page_con.dart';

class PageBind extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WorkoutLocalUC(Get.find<WorkoutRepoIml>()));
    Get.lazyPut(() => WorkoutApiUC(Get.find<WorkoutRepoIml>()));
    Get.lazyPut(() => SaveWorkoutLocalUC(Get.find<WorkoutRepoIml>()));
    Get.put(PageCon(
      Get.find<WorkoutLocalUC>(),
      Get.find<WorkoutApiUC>(),
      Get.find<SaveWorkoutLocalUC>(),
    ));
  }
}
