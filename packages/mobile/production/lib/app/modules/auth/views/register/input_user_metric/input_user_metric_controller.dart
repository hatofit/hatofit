import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/utils/snackbar.dart';

import '../../../../../../utils/image_utils.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../services/preferences_service.dart';

class InputUserMetricController extends GetxController {
  final UserModel previousData = Get.arguments;

  final isLoading = false.obs;

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
      energyUnits: 'kCal',
      heightUnits: selectedHeightUnitMeasure.value,
      weightUnits: selectedWeightUnitMeasure.value,
    );
    register();
  }

  void register() async {
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
        final perm = await BluetoothService().askPermission();

        if (perm) {
          try {
            isLoading.value = true;

            previousData.toJson().removeWhere((key, value) => value == null);
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
                  if (user.photo!.isEmpty ||
                      user.photo == null ||
                      user.photo == '') {
                    if (user.gender == 'male') {
                      ImageUtils.saveFromAsset('assets/images/avatar/male.png');
                    } else {
                      ImageUtils.saveFromAsset(
                          'assets/images/avatar/female.png');
                    }
                  } else {
                    ImageUtils.fromBase64(user.photo!);
                  }

                  MySnackbar.success(
                      'Success', 'You have successfully registered');
                  Get.offAllNamed(AppRoutes.dashboard);
                } else {
                  MySnackbar.error('Error', loginResponse.body['message']);
                }
              } catch (error) {
                MySnackbar.error('Error', 'Error while trying to login');
              } finally {
                isLoading.value = false;
              }
            } else {
              MySnackbar.error('Error', response.body['message']);
            }
          } catch (error) {
            MySnackbar.error('Error', 'Error while trying to register');
          } finally {
            isLoading.value = false;
          }
        } else {
          register();
        }
      },
    );
  }
}
