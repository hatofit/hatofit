import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final selectedGender = ''.obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final userDateOfBirth = DateTime.now().obs;
  final formattedDate = ''.obs;
  final isGenderSelected = false.obs;

  final storage = StorageService().storage;

  @override
  void onClose() {
    firstNameController.value.dispose();
    lastNameController.value.dispose();
    dateOfBirthController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();

    super.onClose();
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
    isGenderSelected.value = true;
  }

  void saveUserInfo() {
    storage.write('isAuth', false);
    storage.write('EnergyUnit', 'Kilocalories');
    storage.write('fullName',
        '${firstNameController.value.text} ${lastNameController.value.text}');
    storage.write('gender', selectedGender.value);
    storage.write('email', emailController.value.text);
    final Map<String, dynamic> data = {
      "firstName": firstNameController.value.text,
      "lastName": lastNameController.value.text,
      "gender": selectedGender.value,
      "birthDate": userDateOfBirth.value.toString(),
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "confirmPassword": confirmPasswordController.value.text,
    };
    Get.toNamed(
      AppRoutes.inputUserMetric,
      arguments: data,
    );
  }

  void refreshController() {
    firstNameController.refresh();
    lastNameController.refresh();
    dateOfBirthController.refresh();
    emailController.refresh();
    passwordController.refresh();
    confirmPasswordController.refresh();
  }
}
