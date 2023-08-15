import 'package:get/get.dart';

import '../../../../../../data/repository/auth_repo_iml.dart';
import '../../../../../../domain/usecases/register_uc.dart';
import 'input_user_metric_controller.dart';

class InputUserMetricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUC(Get.find<AuthRepoIml>()));
    Get.lazyPut(() => InputUserMetricController(Get.find<RegisterUC>()));
  }
}
