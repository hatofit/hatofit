import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/auth_model.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final selectedGender = ''.obs;
  final firstNameController = TextEditingController() ;
  final lastNameController = TextEditingController() ;
  final dateOfBirthController = TextEditingController() ;
  final emailController = TextEditingController() ;
  final passwordController = TextEditingController() ;
  final confirmPasswordController = TextEditingController() ;
  final userDateOfBirth = DateTime.now().obs;
  final formattedDate = ''.obs;
  final isGenderSelected = false.obs;

  final storage = StorageService().storage;

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

  void selectGender(String gender) {
    selectedGender.value = gender;
    isGenderSelected.value = true;
  }

  void saveUserInfo() {
    final AuthModel authModel = AuthModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: selectedGender.value,
      dateOfBirth: userDateOfBirth.value,
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
