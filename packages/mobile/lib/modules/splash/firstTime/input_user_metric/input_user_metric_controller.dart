import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';

class InputUserMetricController extends GetxController {
  final polar = Polar();
  RxString selectedHeightUnitMeasure = ''.obs;
  RxString selectedWeightUnitMeasure = ''.obs;
  final userWeight = 0.obs;
  final userHeight = 0.obs;
  final isUserWeightSelected = false.obs;
  final isUserHeightSelected = false.obs;

  void selectHeightUnitMeasure(String unitMeasure) {
    selectedHeightUnitMeasure.value = unitMeasure;
    isUserHeightSelected.value = true;
  }

  void selectWeightUnitMeasure(String unitMeasure) {
    selectedWeightUnitMeasure.value = unitMeasure;
    isUserWeightSelected.value = true;
  }

  void saveUserInfo() {
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
    storage.write('height', userWeight.value);
    storage.write('weight', userWeight.value);
    requestPermission();
  }

  requestPermission() {
    Get.defaultDialog(
      title: 'Permission',
      middleText:
          'Please allow all needed permissions to use this app perfectly',
      textConfirm: 'ALLOW',
      confirmTextColor: Colors.black,
      buttonColor: Colors.greenAccent,
      titleStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          color: AppTheme().isDarkMode ? Colors.white : Colors.black),
      onConfirm: () {
        polar.requestPermissions().then((value) => Permission.location
            .request()
            .then((value) => Permission.storage.request().then((value) {
                  if (value.isGranted) {
                    if (storage.read('height') != null &&
                        storage.read('weight') != null) {
                      Get.offAllNamed(AppRoutes.dashboard);
                    }
                  } else {
                    requestPermission();
                  }
                })));

        update();
      },
    );
  }
}
