import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar_hr_devices/models/auth_model.dart';
import 'package:polar_hr_devices/services/storage_service.dart';
import 'package:video_player/video_player.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/internet_service.dart';
import '../../../../services/polar_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
    emailController.dispose();
    videoPlayerController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();
    final AuthModel authModel = AuthModel(
      email: emailController.text,
      password: passwordController.text,
    );
    PolarService().polar.requestPermissions().then(
          (value) => Permission.location.request().then(
                (value) => Permission.storage.request().then(
                  (value) async {
                    final response =
                        await InternetService().loginUser(authModel);
                    final body = response.body;
                    if (body['success'] == true) {
                      storage.write('userToken', body['token']);
                      storage.write(
                          'fullName',
                          body['user']['firstName'] +
                              ' ' +
                              body['user']['lastName']);
                      storage.write('email', body['user']['email']);
                      storage.write('gender', body['user']['gender']);
                      storage.write('dateOfBirth', body['user']['dateOfBirth']);
                      storage.write('height', body['user']['height']);
                      storage.write('weight', body['user']['weight']);
                      storage.write('metricUnits', body['user']['metricUnits']);
                      storage.write('createdAt', body['user']['createdAt']);
                      storage.write('updatedAt', body['user']['updatedAt']);

                      Get.snackbar(
                        'Success',
                        'Welcome back ${body['user']['firstName']}',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );

                      Get.offAllNamed(AppRoutes.dashboard);
                    } else {
                      Get.snackbar(
                        'Error',
                        body['message'],
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
              ),
        );
  }
}
