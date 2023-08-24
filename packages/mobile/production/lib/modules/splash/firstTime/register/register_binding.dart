import 'package:get/get.dart';
import 'package:hatofit/modules/splash/firstTime/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
