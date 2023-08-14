import 'package:get/get.dart';

import 'input_user_metric_controller.dart';

class InputUserMetricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputUserMetricController());
  }
}
