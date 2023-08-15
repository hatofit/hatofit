import 'package:get/get.dart';

import '../../data/repository/auth_repo_iml.dart';

class DI {
  static init() {
    Get.lazyPut(() => AuthRepoIml());
  }
}
