import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class ProfileController extends GetxController {
  final List<String> genders = ['Male', 'Female'];
  final userGender = ''.obs;
  final genderAsset = ''.obs;
  final storage = StorageService().storage;
  final fullNameController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final userDateOfBirth = DateTime.now().obs;
  final formattedDate = ''.obs;
  void refreshController() {
    fullNameController.refresh();
    dateOfBirthController.refresh();
    emailController.refresh();
    passwordController.refresh();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      genderAsset.value = pickedImage.path;

      final Directory? directory = await getExternalStorageDirectory();
      //
      final File file = File('${directory?.path}/${pickedImage.name}');
      await file.writeAsBytes(await pickedImage.readAsBytes());
      print('===***===\n'
          'path: ${pickedImage.path}\n'
          'pickedImage: \n'
          'saved path: ${file.path}\n'
          '===***===');
      // storage.write('genderAsset', file.path);
      update();
    }
  }

  @override
  void onInit() {
    fullNameController.value.text = storage.read('fullName');
    userDateOfBirth.value = storage.read('dateOfBirth');
    dateOfBirthController.value.text =
        DateFormat('dd-MM-yyyy').format(userDateOfBirth.value).toString();
    userGender.value = storage.read('gender');
    emailController.value.text = storage.read('email');
    final asset = storage.read('genderAsset');
    if (asset == null) {
      final gender = storage.read('gender');
      if (gender == 'male') {
        genderAsset.value = 'assets/images/male.png';
      } else {
        genderAsset.value = 'assets/images/female.png';
      }
    } else {
      genderAsset.value = asset;
    }
    passwordController.value.text = '********';
    super.onInit();
  }
}
