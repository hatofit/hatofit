import 'package:get/get.dart';
import 'package:hatofit/app/modules/auth/views/register/input_user_metric/input_user_metric_controller.dart';

class InputUserMetricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputUserMetricController());
  }
}
