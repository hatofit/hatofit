import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/utils/image_picker.dart';
import 'package:hatofit/utils/image_utils.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final selectedGender = ''.obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userDateOfBirth = DateTime.now().obs;
  final formattedDate = ''.obs;
  final isGenderSelected = false.obs;
  final pickedImageBase64 = ''.obs;
  final Rx<File> pickedImage = Rx<File>(File(''));


  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

  void pickImage() async {
    final file = await CustomImagePicker.pickImage();
    if (file != null) {
      pickedImage.value = file;
      pickedImageBase64.value = await ImageUtils.toBase64(file);
    }
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
    isGenderSelected.value = true;
  }

  void saveUserInfo() {
    final UserModel authModel = UserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: selectedGender.value,
      dateOfBirth: userDateOfBirth.value,
      photo: pickedImageBase64.value,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    FocusManager.instance.primaryFocus?.unfocus();
    Get.toNamed(
      AppRoutes.inputUserMetric,
      arguments: authModel,
    );
  }
}
