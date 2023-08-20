import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/utils/image_utils.dart';
import 'package:hatofit/data/models/user.dart';
import 'package:hatofit/domain/usecases/image_camera_uc.dart';
import 'package:image_picker/image_picker.dart';

class RegCon extends GetxController {
  final ImageCameraUC _imageCameraUC;
  RegCon(this._imageCameraUC);
  final formKey = GlobalKey<FormState>();
  final fNameCon = TextEditingController();
  final lNameCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  final confirmPasswordCon = TextEditingController();
  final dateOfBirthCon = TextEditingController();
  final scrlCon = ScrollController();
  var pickedImage = Rx(File(''));
  final formattedDate = ''.obs;
  final userDateOfBirth = DateTime.now().obs;
  final isGenderSelected = false.obs;
  var selectedGender = ''.obs;

  @override
  onInit() {
    scrlCon.addListener(() {
      if (scrlCon.offset >= scrlCon.position.maxScrollExtent &&
          !scrlCon.position.outOfRange) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
    super.onInit();
  }

  Future<void> pickImage(ImageSource src) async {
    final res = await _imageCameraUC.execute(src);
    res.fold(
      (failure) => Get.snackbar(failure.code, failure.message),
      (success) async =>
          pickedImage.value = await ImageUtils.toFile(success.data),
    );
  }

  Future<User> getUserData() async {
    String photoBase64;
    if (pickedImage.value.path.isNotEmpty) {
      photoBase64 = await ImageUtils.toBase64(pickedImage.value);
    } else {
      photoBase64 = 'No Photo';
    }
    FocusManager.instance.primaryFocus?.unfocus();
    Future.delayed(const Duration(seconds: 1));
    final user = User(
      firstName: fNameCon.text,
      lastName: lNameCon.text,
      dateOfBirth: userDateOfBirth.value,
      photo: photoBase64,
      email: emailCon.text,
      password: passwordCon.text,
      confirmPassword: confirmPasswordCon.text,
      gender: selectedGender.value,
      height: userHeight.value,
      weight: userWeight.value,
      metricUnits: MetricsUnits(
        heightUnits: selectedHeightUnitMeasure.value,
        weightUnits: selectedWeightUnitMeasure.value,
        energyUnits: EnergyUnits.kCal,
      ),
    );
    return user;
  }

  Future<void> selectGender(String gender) async {
    selectedGender.value = gender;
    isGenderSelected.value = true;
    update();
  }

  final selectedHeightUnitMeasure = HeightUnits.cm.obs;
  final selectedWeightUnitMeasure = WeightUnits.kg.obs;
  final userWeight = 100.obs;
  final userHeight = 150.obs;
  final isUserWeightSelected = false.obs;
  final isUserHeightSelected = false.obs;

  void selectHeightUnitMeasure(HeightUnits unitMeasure) {
    selectedHeightUnitMeasure.value = unitMeasure;
    isUserHeightSelected.value = true;
  }

  void selectWeightUnitMeasure(WeightUnits unitMeasure) {
    selectedWeightUnitMeasure.value = unitMeasure;
    isUserWeightSelected.value = true;
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../app/routes/app_routes.dart';
// import '../../../../../app/utils/image_utils.dart';
// import '../../../../../data/models/auth_model.dart';


// class RegisterController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   final selectedGender = ''.obs;
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final dateOfBirthController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final userDateOfBirth = DateTime.now().obs;
//   final formattedDate = ''.obs;
//   final isGenderSelected = false.obs;

//   final pickedImageBase64 = ''.obs;
//   final Rx<File> pickedImage = Rx<File>(File(''));

//   @override
//   void onClose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     dateOfBirthController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();

//     super.onClose();
//   }

//   void pickImage() async {
//     final image = await ImageUtils.imagePicker();
//     pickedImage.value = File(image!.path);
//     pickedImageBase64.value = await ImageUtils.toBase64(image);
//   }

//   void selectGender(String gender) {
//     selectedGender.value = gender;
//     isGenderSelected.value = true;
//   }

//   void saveUserInfo() {
//     final AuthModel authModel = AuthModel(
//       firstName: firstNameController.text,
//       lastName: lastNameController.text,
//       gender: selectedGender.value,
//       dateOfBirth: userDateOfBirth.value,
//       photo: pickedImageBase64.value,
//       email: emailController.text,
//       password: passwordController.text,
//       confirmPassword: confirmPasswordController.text,
//     );
//     FocusManager.instance.primaryFocus?.unfocus();
//     Get.toNamed(
//       AppRoutes.inputUserMetric,
//       arguments: authModel,
//     );
//   }
// }
