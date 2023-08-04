import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar_hr_devices/models/auth_model.dart';
import 'package:polar_hr_devices/services/internet_service.dart';
import 'package:polar_hr_devices/services/polar_service.dart';
import 'package:polar_hr_devices/services/storage_service.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';

import '../../../../routes/app_routes.dart';

class InputUserMetricController extends GetxController {
  final AuthModel previousData = Get.arguments;

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
    previousData.height = userHeight.value;
    previousData.weight = userWeight.value;
    previousData.metricUnits = MetricUnits(
      energyUnits: 'Kcal',
      heightUnits: selectedHeightUnitMeasure.value,
      weightUnits: selectedWeightUnitMeasure.value,
    );
    requestPermission();
  }

  void requestPermission() {
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
                    final Response response =
                        await InternetService().registerUser(previousData);

                    if (response.body['success'] == true) {
                      final response =
                          await InternetService().loginUser(previousData);

                      if (response.body['success'] == true) {
                        final body = response.body;
                        storage.write('userToken', body['token']);
                        storage.write(
                            'fullName',
                            body['user']['firstName'] +
                                ' ' +
                                body['user']['lastName']);
                        storage.write('email', body['user']['email']);
                        storage.write('gender', body['user']['gender']);
                        storage.write(
                            'dateOfBirth', body['user']['dateOfBirth']);
                        storage.write('height', body['user']['height']);
                        storage.write('weight', body['user']['weight']);
                        storage.write(
                            'metricUnits', body['user']['metricUnits']);
                        storage.write('createdAt', body['user']['createdAt']);
                        storage.write('updatedAt', body['user']['updatedAt']);

                        Get.snackbar(
                          'Success',
                          'User registered successfully',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );

                        Get.offAllNamed(AppRoutes.dashboard);
                      } else {
                        Get.snackbar(
                          'Error Login',
                          response.body['message'],
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Error Register',
                        response.body['message'],
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
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
