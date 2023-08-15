import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../app/routes/app_routes.dart';
import '../../../../../../app/services/internet_service.dart';
import '../../../../../../app/services/polar_service.dart';
import '../../../../../../app/themes/app_theme.dart';
import '../../../../../../app/utils/image_utils.dart';
import '../../../../../../app/utils/preferences_provider.dart';
import '../../../../../../data/models/auth_model.dart';
import '../../../../../../domain/entities/user.dart';
import '../../../../../../domain/usecases/register_uc.dart';

class InputUserMetricController extends GetxController {
  final RegisterUC _registerUC;
  InputUserMetricController(this._registerUC);
  reg(User user) async {
    try {
      final res = await _registerUC.execute(user);
      if (res.id != null) {
        print('User registered successfully');
      } else {}
    } catch (e) {}
  }

  final previousData = Get.arguments;

  final selectedHeightUnitMeasure = ''.obs;
  final selectedWeightUnitMeasure = ''.obs;
  final userWeight = 100.obs;
  final userHeight = 150.obs;
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
    final prefs = PreferencesProvider();
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
                  final AuthModel authModel = AuthModel.fromJson(body['user']);

                  prefs.setUserToken(body['token']);
                  prefs.setFirstName(authModel.firstName!);
                  prefs.setLastName(authModel.lastName!);
                  prefs.setEmail(authModel.email!);
                  prefs
                      .setDateOfBirth(authModel.dateOfBirth!.toIso8601String());
                  prefs.setGender(authModel.gender!);
                  prefs.setHeight(authModel.height!);
                  prefs.setWeight(authModel.weight!);
                  prefs.setMetricUnits([
                    authModel.metricUnits!.energyUnits!,
                    authModel.metricUnits!.heightUnits!,
                    authModel.metricUnits!.weightUnits!,
                  ]);
                  prefs.setCreatedAt(authModel.createdAt!.toIso8601String());
                  prefs.setUpdatedAt(authModel.updatedAt!.toIso8601String());

                  if (authModel.photo!.isEmpty) {
                    if (authModel.gender == 'male') {
                      ImageUtils.saveFromAsset('assets/images/male.png');
                    } else {
                      ImageUtils.saveFromAsset('assets/images/female.png');
                    }
                  } else {
                    ImageUtils.fromBase64(authModel.photo!);
                  }

                  Get.snackbar(
                    'Success',
                    'Welcome back ${authModel.firstName}',
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
