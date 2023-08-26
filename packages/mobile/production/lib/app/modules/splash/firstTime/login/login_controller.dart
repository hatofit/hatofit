import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/utils/debug_logger.dart';
import 'package:hatofit/utils/image_utils.dart';
import 'package:video_player/video_player.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/internet_service.dart';
import '../../../../services/preferences_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/videos/login.mp4');

  final store = Get.find<PreferencesService>();
  @override
  void onInit() {
    // TODO: remove in production
    emailController.text = 'rh@mail.com';
    passwordController.text = '12345678';
    // TODO: remove in production
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

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final UserModel userModel = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final perm = await BluetoothService().askPermission();
    logger.d('Login Controller:\n $perm\n');
    if (formKey.currentState!.validate() && perm) {
      try {
        final response = await InternetService().loginUser(userModel);
        final body = response.body;
        logger.d('Login Controller:\n $body\n');

        if (body['success'] == true) {
          final UserModel user = UserModel.fromJson(body['user']);

          store.user = user;
          store.token = body['token'];
          logger.d('User: ${store.user!.toJson()}');
          if (user.photo!.isEmpty || user.photo == null || user.photo == '') {
            if (user.gender == 'male') {
              ImageUtils.saveFromAsset('assets/images/avatar/male.png');
            } else {
              ImageUtils.saveFromAsset('assets/images/avatar/female.png');
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
            'Error',
            body['message'],
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
    }
  }
}
