import 'package:get/get.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class SettingController extends GetxController {
  final String title = 'Setting Title';
  String userName = ''.obs.value;
  String userAge = ''.obs.value;
  final isSync = false.obs;
  bool isAuth = false.obs.value;
  String genderAsset = ''.obs.value;

  final storage = StorageService().storage;
  @override
  void onInit() {
    isAuth = storage.read('isAuth');
    userName = storage.read('name');
    userAge = storage.read('age');
    genderAsset = storage.read('genderAsset');
    super.onInit();
  }

  void clear() {
    storage.erase();
    Get.offAllNamed(AppRoutes.greeting);
  }
}
