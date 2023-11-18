import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
