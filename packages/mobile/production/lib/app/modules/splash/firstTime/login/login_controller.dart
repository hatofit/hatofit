import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/utils/image_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/internet_service.dart';
import '../../../../services/polar_service.dart';
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
    final prefs = PreferencesService();
    FocusManager.instance.primaryFocus?.unfocus();
    final  UserModel authModel =  UserModel(
      email: emailController.text,
      password: passwordController.text,
    );

    PolarService().polar.requestPermissions().then(
          (value) => Permission.location.request().then(
                (value) => Permission.storage.request().then(
                  (value) async {
                    try {
                      final response =
                          await InternetService().loginUser(authModel);
                      final body = response.body;
                      if (body['success'] == true) {
                        final  UserModel user =
                             UserModel.fromJson(body['user']);

                        store.user = user;
                        store.token = body['token'];
                        if (user.photo!.isEmpty) {
                          if (user.gender == 'male') {
                            await ImageUtils.saveFromAsset(
                                'assets/images/male.png');
                          } else {
                            await ImageUtils.saveFromAsset(
                                'assets/images/female.png');
                          }
                        } else {
                          ImageUtils.fromBase64(user.photo!);
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
                  },
                ),
              ),
        );
  }
}
