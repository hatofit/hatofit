import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../services/preferences_service.dart';

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
  final store = Get.find<PreferencesService>();
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

      final File file = File('${directory?.path}/${pickedImage.name}');
      await file.writeAsBytes(await pickedImage.readAsBytes());

      update();
    }
  }

  final _prefs = PreferencesService();
  @override
  void onInit() async {
    final firstName = store.user!.firstName!;
    final lastName = store.user!.lastName!;
    fullNameController.value.text = '$firstName $lastName';

    userDateOfBirth.value = store.user!.dateOfBirth!;
    dateOfBirthController.value.text =
        DateFormat('dd-MM-yyyy').format(userDateOfBirth.value).toString();
    userGender.value = store.user!.gender!;
    emailController.value.text = store.user!.email!;

    passwordController.value.text = '********';
    super.onInit();
  }
}
