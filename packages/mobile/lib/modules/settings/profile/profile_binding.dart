import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/settings/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
