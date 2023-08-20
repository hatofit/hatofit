import 'package:get/get.dart';
import 'package:hatofit/data/repos/workout_repo_iml.dart';
import 'package:hatofit/data/repos/image_repo_iml.dart';

import '../../data/repos/auth_repo_iml.dart';

class DI {
  static init() {
    Get.lazyPut(() => AuthRepoIml());
    Get.lazyPut(() => ImageRepoIml());
    Get.lazyPut(() => WorkoutRepoIml());
  }
}
