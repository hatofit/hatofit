import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/polar_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../utils/image_utils.dart';
import '../../../../services/preferences_service.dart';
import '../../../../routes/app_routes.dart';

class InputUserMetricController extends GetxController {
  final UserModel previousData = Get.arguments;

  final selectedHeightUnitMeasure = ''.obs;
  final selectedWeightUnitMeasure = ''.obs;
  final userWeight = 100.obs;
  final userHeight = 150.obs;
  final isUserWeightSelected = false.obs;
  final isUserHeightSelected = false.obs;

  final store = Get.find<PreferencesService>();

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
    register();
  }

  void register() async {
    final prefs = PreferencesService();
    await Get.defaultDialog(
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
      onConfirm: () async {
        await PolarService().polar.requestPermissions();
        final locationPermissionStatus = await Permission.location.request();
        final storagePermissionStatus = await Permission.storage.request();

        if (locationPermissionStatus.isGranted &&
            storagePermissionStatus.isGranted) {
          try {
            final Response response =
                await InternetService().registerUser(previousData);

            if (response.body['success'] == true) {
              try {
                final loginResponse =
                    await InternetService().loginUser(previousData);

                if (loginResponse.body['success'] == true) {
                  final body = loginResponse.body;
                  final UserModel user = UserModel.fromJson(body['user']);

                  store.user = user;
                  store.token = body['token'];
                  if (user.photo!.isEmpty) {
                    if (user.gender == 'male') {
                      ImageUtils.saveFromAsset('assets/images/male.png');
                    } else {
                      ImageUtils.saveFromAsset('assets/images/female.png');
                    }
                  } else {
                    ImageUtils.fromBase64(user.photo!);
                  }

                  Get.snackbar(
                    'Success',
                    'Welcome back ${user.firstName}',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );

                  Get.offAllNamed(AppRoutes.dashboard);
                } else {
                  Get.snackbar(
                    'Error Login',
                    loginResponse.body['message'],
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              } catch (error) {
                Get.snackbar(
                  'Error',
                  'An error occurred during the login process: HatoFit server is not responding',
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
          } catch (error) {
            Get.snackbar(
              'Error',
              'An error occurred during the registration process: HatoFit server is not responding',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } else {
          register();
        }
      },
    );
  }
}
