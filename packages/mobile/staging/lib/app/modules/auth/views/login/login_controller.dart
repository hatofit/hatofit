import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/utils/image_utils.dart';
import 'package:hatofit/utils/snackbar.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/internet_service.dart';
import '../../../../services/preferences_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoadingLogin = false.obs;
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/videos/login.mp4');

  final store = Get.find<PreferencesService>();
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

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoadingLogin.value = true;
    final UserModel userModel = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final perm = await BluetoothService().askPermission();
    if (formKey.currentState!.validate() && perm) {
      try {
        final response = await InternetService().loginUser(userModel);
        final body = response.body;
        Logger().i(body);
        if (body['success'] == true) {
          final UserModel user = UserModel.fromJson(body['user']);

          store.user = user;
          store.token = body['token'];
          if (user.photo!.isEmpty || user.photo == null || user.photo == '') {
            if (user.gender == 'male') {
              ImageUtils.saveFromAsset('assets/images/avatar/male.png');
            } else {
              ImageUtils.saveFromAsset('assets/images/avatar/female.png');
            }
          } else {
            ImageUtils.fromBase64(user.photo!);
          }

          MySnackbar.success('Success', 'Welcome back ${user.firstName}');

          Get.offAllNamed(AppRoutes.dashboard);
        } else {
          MySnackbar.error('Error', body['message']);
        }
      } catch (error) {
        MySnackbar.error('Error', 'Error while trying to login');
      } finally {
        isLoadingLogin.value = false;
      }
    }
  }
}
