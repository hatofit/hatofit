import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/internet_service.dart';
import 'package:polar_hr_devices/services/polar_service.dart';
import 'package:polar_hr_devices/services/storage_service.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';

class InputUserMetricController extends GetxController {
  final Map<String, dynamic> previousData = Get.arguments ?? {};

  final selectedHeightUnitMeasure = ''.obs;
  final selectedWeightUnitMeasure = ''.obs;
  final userWeight = 100.obs;
  final userHeight = 150.obs;
  final isUserWeightSelected = false.obs;
  final isUserHeightSelected = false.obs;

  final storage = StorageService().storage;
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
    storage.write('energyUnit', 'Kcal');
    storage.write('height', userHeight.value);
    storage.write('weight', userWeight.value);
    previousData.addAll({
      'height': userHeight.value,
      'weight': userWeight.value,
    });
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
          color: ThemeManager().isDarkMode ? Colors.white : Colors.black),
      onConfirm: () {
        PolarService().polar.requestPermissions().then((value) => Permission
            .location
            .request()
            .then((value) => Permission.storage.request().then((value) async {
                  if (value.isGranted) {
                    if (storage.read('height') != null &&
                        storage.read('weight') != null) {
                      await InternetService()
                          .registerUser(previousData)
                          .then((value) {
                        if (value == 'Success Register') {
                          final email = previousData['email'];
                          final password = previousData['password'];
                          Future.delayed(const Duration(seconds: 1), () async {
                            await InternetService()
                                .loginUser(email!, password!)
                                .then((value) {
                              if (value.contains('Failed') ||
                                  value.contains('Error')) {
                                Get.snackbar(
                                  'Error',
                                  value,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } else {
                                print("===================\n"
                                    "InputUserMetricController . login user . value: $value\n"
                                    "===================");
                                storage.write('userToken', value);
                                Get.offAllNamed(AppRoutes.dashboard);
                              }
                            });
                          });
                        } else {
                          Get.snackbar(
                            'Error',
                            value,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      });
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
