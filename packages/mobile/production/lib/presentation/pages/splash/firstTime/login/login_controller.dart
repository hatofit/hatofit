import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../../../../../app/routes/app_routes.dart';
import '../../../../../app/services/internet_service.dart';
import '../../../../../app/services/polar_service.dart';
import '../../../../../app/utils/image_utils.dart';
import '../../../../../app/utils/preferences_provider.dart';
import '../../../../../data/models/auth_model.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    final prefs = PreferencesProvider();
    FocusManager.instance.primaryFocus?.unfocus();
    final AuthModel authModel = AuthModel(
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
                        final AuthModel authModel =
                            AuthModel.fromJson(body['user']);

                        prefs.setUserToken(body['token']);
                        prefs.setFirstName(authModel.firstName!);
                        prefs.setLastName(authModel.lastName!);
                        prefs.setEmail(authModel.email!);
                        prefs.setDateOfBirth(
                            authModel.dateOfBirth!.toIso8601String());
                        prefs.setGender(authModel.gender!);
                        prefs.setHeight(authModel.height!);
                        prefs.setWeight(authModel.weight!);
                        prefs.setMetricUnits([
                          authModel.metricUnits!.energyUnits!,
                          authModel.metricUnits!.heightUnits!,
                          authModel.metricUnits!.weightUnits!,
                        ]);
                        prefs.setCreatedAt(
                            authModel.createdAt!.toIso8601String());
                        prefs.setUpdatedAt(
                            authModel.updatedAt!.toIso8601String());

                        if (authModel.photo!.isEmpty) {
                          if (authModel.gender == 'male') {
                            await ImageUtils.saveFromAsset(
                                'assets/images/male.png');
                          } else {
                            await ImageUtils.saveFromAsset(
                                'assets/images/female.png');
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
