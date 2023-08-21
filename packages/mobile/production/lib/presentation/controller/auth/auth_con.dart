import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/app.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/utils/image_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

import '../../../app/services/local_storage.dart';
import '../../../app/themes/app_theme.dart';
import '../../../data/models/user.dart';
import '../../../domain/usecases/api/auth/login_uc.dart';
import '../../../domain/usecases/api/auth/register_uc.dart';

class AuthCon extends GetxController {
  final RegisterUC _registerUC;
  final LoginUC _loginUC;
  final store = Get.find<LocalStorageService>();
  AuthCon(this._registerUC, this._loginUC);

  Future<bool> handlePerm() async {
    final locationStatus = await Permission.location.status;
    final storageStatus = await Permission.storage.status;
    if (locationStatus.isDenied || storageStatus.isDenied) {
      await Polar().requestPermissions();
      await Permission.location.request();
      await Permission.storage.request();
      final storageStatus = await Permission.storage.status;
      if (storageStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future _permDialog(String firstName) async {
    return Get.defaultDialog(
      title: 'Permission',
      middleText: 'Please allow required permissions to use this app properly.',
      textConfirm: 'ALLOW',
      confirmTextColor: Colors.black,
      buttonColor: Colors.greenAccent,
      titleStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          color: ThemeManager().isDarkMode ? Colors.white : Colors.black),
      onConfirm: () async {
        final res = await handlePerm();
        if (res) {
          Future.delayed(const Duration(seconds: 2));
          Get.offAllNamed(AppRoutes.dashboard);
          Future.delayed(const Duration(seconds: 2));
          Get.snackbar(
            'Hi, $firstName',
            'Welcome to Hato Fit',
          );
        } else {
          Get.snackbar('Error', 'Something went wrong');
        }
      },
    );
  }

  Future<void> register(User user) async {
    try {
      final res = await _registerUC.execute(user);
      res.fold((failure) {
        Get.snackbar(failure.message, failure.details);
      }, (success) {
        if (success.code == 'OK') {
          login(email: user.email, password: user.password!);
        }
      });
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final res = await _loginUC.execute(Tuple2(email, password));
      res.fold((failure) {
        Get.snackbar(failure.message, failure.details);
      }, (success) async {
        logger.i(success.data);
        final user = User.fromJson(success.data['user']);
        store.user = user;
        store.token = success.data['token'];
        if (user.photo != 'No Photo') {
          await ImageUtils.fromBase64(user.photo!);
        }
        await _permDialog(user.firstName!);
      });
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }
}
