import 'package:get/get.dart';
import 'package:hatofit/data/repository/workout_repo_iml.dart';
import 'package:hatofit/data/repository/image_repo_iml.dart';

import '../../data/repository/auth_repo_iml.dart';

class DI {
  static init() {
    Get.lazyPut(() => AuthRepoIml());
    Get.lazyPut(() => ImageRepoIml());
    Get.lazyPut(() => WorkoutRepoIml());
  }
}
