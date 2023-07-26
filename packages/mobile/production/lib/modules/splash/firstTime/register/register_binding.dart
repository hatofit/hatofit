import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
