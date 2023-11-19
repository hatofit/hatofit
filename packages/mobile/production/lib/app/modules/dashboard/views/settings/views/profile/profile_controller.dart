import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/utils/image_picker.dart';
import 'package:hatofit/utils/image_utils.dart';
import 'package:hatofit/utils/snackbar.dart';
import 'package:intl/intl.dart';

import '../../../../../../services/preferences_service.dart';

class ProfileController extends GetxController {
  final userGender = ''.obs;
  final genderAsset = ''.obs;
  final fullNameController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final userDateOfBirth = DateTime.now().obs;
  final formattedDate = ''.obs;
  final store = Get.find<PreferencesService>();
  void refreshController() {
    fullNameController.refresh();
    dateOfBirthController.refresh();
    emailController.refresh();
    passwordController.refresh();
  }

  final Rx<File> pickedImage = Rx<File>(File(''));

  final pickedImageBase64 = ''.obs;
  void pickImage() async {
    final file = await CustomImagePicker.pickImage();
    if (file != null) {
      pickedImage.value = file;
      pickedImageBase64.value = await ImageUtils.toBase64(file);
    }
  }

  UserModel? user;

  @override
  void onInit() async {
    pickedImage.value = File(
        '/storage/emulated/0/Android/data/com.hatofit.hatofit/files/photo-profile.jpg');
    final firstName = store.user!.firstName!;
    final lastName = store.user!.lastName!;
    fullNameController.value.text = '$firstName $lastName';

    userDateOfBirth.value = store.user!.dateOfBirth!;
    dateOfBirthController.value.text =
        DateFormat('dd-MM-yyyy').format(userDateOfBirth.value).toString();
    userGender.value = store.user!.gender!;
    emailController.value.text = store.user!.email!;

    passwordController.value.text = '********';
    user = store.user;
    super.onInit();
  }

  void updateUser() async {
    user!.firstName = fullNameController.value.text.split(' ')[0];
    user!.lastName = fullNameController.value.text.split(' ')[1];
    user!.dateOfBirth = userDateOfBirth.value;
    user!.gender = userGender.value;
    user!.photo = pickedImageBase64.value;
    user!.email = emailController.value.text;
    user!.password = passwordController.value.text;
    final res = await InternetService().updateUser(user!);

    if (res.body['success'] == true) {
      MySnackbar.success('Success', res.body['message']);
      store.user = UserModel.fromJson(res.body['user']);
      refreshController();
    } else {
      MySnackbar.error('Error', 'Failed to update profile');
    }
  }
}
