import 'package:get/get.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class UserInfoController extends GetxController {
  final userName = ''.obs;
  final userAge = ''.obs;
  final userGender = ''.obs;
  final userWeight = ''.obs;
  final userHeight = ''.obs;

  final storage = StorageService().storage;

  @override
  void onInit() {
    userName.value = storage.read('name');
    userAge.value = storage.read('age');
    userGender.value = storage.read('gender');
    userWeight.value = storage.read('weight');
    userHeight.value = storage.read('height');
    print('============================='
        '${storage.read('genderAsset')}'
        '=============================');
    super.onInit();
  }
}
