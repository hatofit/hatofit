import 'package:get/get.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class SettingController extends GetxController {
  final String title = 'Setting Title';
  final userName = ''.obs;
  final userAge = ''.obs;
  final isSync = false.obs;
  final isAuth = false.obs;
  final genderAsset = ''.obs;

  final storage = StorageService().storage;
  @override
  void onInit() {
    isAuth.value = storage.read('isAuth');
    userName.value = storage.read('fullName');
    final age = DateTime.now().year - storage.read('dateOfBirth').year;
    userAge.value = age.toString();
    genderAsset.value = storage.read('genderAsset');
    super.onInit();
  }

  void clear() {
    storage.erase();
    Get.offAllNamed(AppRoutes.greeting);
  }
}
