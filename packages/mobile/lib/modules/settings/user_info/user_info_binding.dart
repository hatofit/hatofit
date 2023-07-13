import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/settings/user_info/user_info_controller.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInfoController>(() => UserInfoController());
  }
}
