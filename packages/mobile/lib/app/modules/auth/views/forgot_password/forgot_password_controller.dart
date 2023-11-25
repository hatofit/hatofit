import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/auth/views/forgot_password/views/reset_password_view.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/utils/snackbar.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final firstVerCodeController = TextEditingController();
  final secondVerCodeController = TextEditingController();
  final thirdVerCodeController = TextEditingController();
  final fourthVerCodeController = TextEditingController();
  final fifthVerCodeController = TextEditingController();
  final sixthVerCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isLoadingSendEmail = false.obs;
  final isLoadingVerifyCode = false.obs;
  final isLoadingResetPassword = false.obs;
  final isAuthorized = false.obs;

  void clearOTP() {
    firstVerCodeController.clear();
    secondVerCodeController.clear();
    thirdVerCodeController.clear();
    fourthVerCodeController.clear();
    fifthVerCodeController.clear();
    sixthVerCodeController.clear();
  }

  void sendEmail() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoadingSendEmail.value = true;

    if (!GetUtils.isEmail(emailController.text)) {
      MySnackbar.error('Error', 'Please enter a valid email');
      isLoadingSendEmail.value = false;
      return;
    }
    final res = await InternetService().forgetPassword(emailController.text);
    debugPrint(res.body.toString());
    if (res.body['success'] == true) {
      isLoadingSendEmail.value = false;
      MySnackbar.success(
          'Success', 'Please check your email for verification code');
      Get.to(() => const ResetPasswordView());
    } else {
      isLoadingSendEmail.value = false;
      MySnackbar.error('Error', res.body['message']);
    }
  }

  void verifyCode() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoadingVerifyCode.value = true;

    final res = await InternetService().verifyCode(
        emailController.text,
        firstVerCodeController.text +
            secondVerCodeController.text +
            thirdVerCodeController.text +
            fourthVerCodeController.text +
            fifthVerCodeController.text +
            sixthVerCodeController.text);
    debugPrint(res.body.toString());
    if (res.body['success'] == true) {
      isAuthorized.value = true;
      isLoadingVerifyCode.value = false;
      MySnackbar.success('Success', 'Verification code is correct');
    } else {
      isLoadingVerifyCode.value = false;
      MySnackbar.error('Error', res.body['message']);
    }
  }

  void resetPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoadingResetPassword.value = true;

    if (passwordController.text != confirmPasswordController.text) {
      MySnackbar.error('Error', 'Password and confirm password not match');
      isLoadingResetPassword.value = false;
      return;
    }

    final res = await InternetService().resetPassword(
        emailController.text,
        firstVerCodeController.text +
            secondVerCodeController.text +
            thirdVerCodeController.text +
            fourthVerCodeController.text +
            fifthVerCodeController.text +
            sixthVerCodeController.text,
        passwordController.text,
        confirmPasswordController.text);
    debugPrint(res.body.toString());
    if (res.body['success'] == true) {
      isAuthorized.value = false;
      isLoadingResetPassword.value = false;
      Get.back();
      Get.back();
      MySnackbar.success('Success', 'Password has been reset, please login');
    } else {
      isLoadingResetPassword.value = false;
      MySnackbar.error('Error', res.body['message']);
    }
  }
}
