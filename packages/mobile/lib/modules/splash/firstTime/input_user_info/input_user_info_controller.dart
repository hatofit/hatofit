import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

import '../../../../main.dart';

class InputUserInfoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxString selectedGender = ''.obs;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final isGenderSelected = false.obs;
  final isNameEmpty = true.obs;
  final isAgeEmpty = true.obs;

  final storage = StorageService().storage;
  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
    isGenderSelected.value = true;
  }

  void saveUserInfo() {
    storage.write('isAuth', false);
    storage.write('EnergyUnit', 'Kilocalories');
    storage.write('name', nameController.text);
    storage.write('age', ageController.text);
    storage.write('gender', selectedGender.value);
    if (selectedGender.value == 'male') {
      storage.write('genderAsset', 'assets/images/male.svg');
    } else {
      storage.write('genderAsset', 'assets/images/female.svg');
    }
    Get.offAllNamed(AppRoutes.inputUserMetric);
  }
}
