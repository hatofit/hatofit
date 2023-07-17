import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
    storage.write('fullName', fullNameController.value.text);
    storage.write('dateOfBirth', userDateOfBirth);
    storage.write('email', emailController.value.text);
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      genderAsset.value = pickedImage.path;
      storage.write('genderAsset', pickedImage);
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
    genderAsset.value = storage.read('genderAsset');
    super.onInit();
  }
}
