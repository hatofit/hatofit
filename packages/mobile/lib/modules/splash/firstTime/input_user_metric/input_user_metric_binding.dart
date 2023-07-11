import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_metric/input_user_metric_controller.dart';

class InputUserMetricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputUserMetricController());
  }
}
