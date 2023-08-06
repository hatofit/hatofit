import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/preferences_provider.dart';

class ProfileController extends GetxController {
  final List<String> genders = ['Male', 'Female'];
  final userGender = ''.obs;
  final genderAsset = ''.obs;
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
      final convert = await _convertImageToBase64(file.path);
      print('convert: $convert');
      // storage.write('genderAsset', file.path);
      update();
    }
  }

  Future<String> _convertImageToBase64(String path) async {
    final File file = File(path);
    final bytes = await file.readAsBytes();
    final base64 = base64Encode(bytes);
    return base64;
  }

  final _prefs = PreferencesProvider();
  @override
  void onInit() async {
    final firstName = await _prefs.getFirstName();
    final lastName = await _prefs.getLastName();
    fullNameController.value.text = '$firstName $lastName';
    final dateBirth = await _prefs.getDateOfBirth();
    userDateOfBirth.value = DateTime.parse(dateBirth!);
    dateOfBirthController.value.text =
        DateFormat('dd-MM-yyyy').format(userDateOfBirth.value).toString();
    userGender.value = (await _prefs.getGender())!;
    emailController.value.text = (await _prefs.getEmail())!;

    passwordController.value.text = '********';
    super.onInit();
  }
}
