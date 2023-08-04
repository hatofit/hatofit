import 'package:get/get.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class SettingController extends GetxController {
  final String title = 'Setting Title';
  final userName = ''.obs;
  final userAge = ''.obs;
  final isSync = false.obs;
  final genderAsset = ''.obs;

  final storage = StorageService().storage;
  @override
  void onInit() {
    userName.value = storage.read('fullName');
    final dateOfBirth = storage.read('dateOfBirth');
    final age = DateTime.now().year - dateOfBirth.year;
    userAge.value = age.toString();
    final asset = storage.read('genderAsset');
    if (asset == null) {
      final gender = storage.read('gender');
      if (gender == 'male') {
        genderAsset.value = 'assets/images/male.png';
      } else {
        genderAsset.value = 'assets/images/female.png';
      }
    } else {
      genderAsset.value = asset;
    }
    super.onInit();
  }

  void clear() {
    storage.erase();
    Get.offAllNamed(AppRoutes.greeting);
  }
}
