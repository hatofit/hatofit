import 'package:get/get.dart';
import 'package:hatofit/app/modules/auth/views/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
