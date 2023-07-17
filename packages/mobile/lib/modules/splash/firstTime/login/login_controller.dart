import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/internet_service.dart';
import 'package:polar_hr_devices/services/polar_service.dart';
import 'package:polar_hr_devices/services/storage_service.dart';
import 'package:video_player/video_player.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final storage = StorageService().storage;
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/videos/login.mp4');

  @override
  void onInit() {
    super.onInit();
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/login.mp4');
    videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
      update();
    });
  }

  @override
  void onClose() {
    emailController.value.dispose();
    videoPlayerController.dispose();
    passwordController.value.dispose();
    super.onClose();
  }

  void login() async {
    await InternetService()
        .loginUser(
      emailController.value.text,
      passwordController.value.text,
    )
        .then((value) {
      if (value.contains('Failed') || value.contains('Error')) {
        Get.snackbar(
          'Error',
          value,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        print("===================\n"
            "LoginController.login() value: $value\n"
            "===================");
        storage.write('userToken', value);
        PolarService().polar.requestPermissions().then(
              (value) => Permission.location.request().then(
                    (value) => Permission.storage.request().then(
                      (value) async {
                        if (value.isGranted) {
                          Get.offAllNamed(AppRoutes.dashboard);
                        }
                      },
                    ),
                  ),
            );
      }
    });
  }
}
