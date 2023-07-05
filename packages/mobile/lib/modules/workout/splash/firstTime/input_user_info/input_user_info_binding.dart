import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/workout/splash/firstTime/input_user_info/input_user_info_controller.dart';

class InputUserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputUserInfoController>(() => InputUserInfoController());
  }
}
