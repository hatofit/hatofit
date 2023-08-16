import 'package:get/get.dart';
import 'package:hatofit/data/repository/exercise_repo_iml.dart';
import 'package:hatofit/domain/usecases/exercise_local_uc.dart';

import '../../../domain/usecases/exercise_api_uc.dart';
import 'page_con.dart';

class PageBind extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ExerciseLocalUC(Get.find<ExerciseRepoIml>()));
    Get.lazyPut(() => ExerciseApiUC(Get.find<ExerciseRepoIml>()));
    Get.put(PageCon(Get.find<ExerciseLocalUC>(), Get.find<ExerciseApiUC>()));
  }
}
