import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

import '../../../../../main.dart';

class InputUserInfoController extends GetxController {
  final polar = Polar();

  RxString selectedGender = ''.obs;
  RxString selectedHeightUnitMeasure = 'cm'.obs;
  RxString selectedWeightUnitMeasure = 'kg'.obs;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void selectHeightUnitMeasure(String unitMeasure) {
    selectedHeightUnitMeasure.value = unitMeasure;
  }

  void selectWeightUnitMeasure(String unitMeasure) {
    selectedWeightUnitMeasure.value = unitMeasure;
  }

  void saveUserInfo() {
    storage.write('isAuth', false);
    storage.write('EnergyUnit', 'Kilocalories');
    storage.write('name', nameController.text);
    storage.write('age', ageController.text);
    storage.write('gender', selectedGender.value);
    storage.write('height', heightController.text);
    storage.write('weight', weightController.text);
    if (selectedGender.value == 'male') {
      storage.write('genderAsset', 'assets/images/male.svg');
    } else {
      storage.write('genderAsset', 'assets/images/female.svg');
    }
    if (selectedHeightUnitMeasure.value == 'cm') {
      storage.write('heightUnit', 'Centimeters');
    } else {
      storage.write('heightUnit', 'Feet');
    }
    if (selectedWeightUnitMeasure.value == 'kg') {
      storage.write('weightUnit', 'Kilograms');
    } else {
      storage.write('weightUnit', 'Lbs');
    }
    requestPermission();
  }

  requestPermission() {
    Get.defaultDialog(
      title: 'Permission',
      middleText: 'Please allow all permissions to use this app',
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      onConfirm: () {
        polar.requestPermissions().then((value) => Permission.location
            .request()
            .then((value) => Permission.storage.request().then((value) {
                  if (value.isGranted) {
                    Get.offAllNamed(AppRoutes.dashboard);
                  } else {
                    requestPermission();
                  }
                })));

        update();
      },
    );
  }
}
