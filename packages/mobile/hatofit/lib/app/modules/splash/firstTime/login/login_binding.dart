import 'package:get/get.dart';
import 'package:hatofit/app/modules/splash/firstTime/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
