import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_info/input_user_info_controller.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class InputUserInfoPage extends GetView<InputUserInfoController> {
  const InputUserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorPalette.backgroundColor,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Fill Form Below',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: 'Find best workout based on your info',
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildGenderItem(
                      'assets/images/male.svg',
                      'male',
                      ColorPalette.male,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    buildGenderItem(
                      'assets/images/female.svg',
                      'female',
                      ColorPalette.female,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.user,
                            size: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Name',
                          hintText: 'Enter your name',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: controller.ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.calendar,
                            size: 16,
                          ),
                          suffix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: CustomText(text: 'y.o'),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Age',
                          hintText: 'Enter your age',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: controller.heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.ruler,
                            size: 16,
                          ),
                          suffix: SizedBox(
                            width: 105,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildUnitMeasure('height', 'cm'),
                                const SizedBox(
                                  width: 8,
                                ),
                                buildUnitMeasure('height', 'ft'),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Height',
                          hintText: 'Enter your height',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: controller.weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.weightScale,
                            size: 16,
                          ),
                          suffix: SizedBox(
                            width: 105,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildUnitMeasure('weight', 'kg'),
                                const SizedBox(
                                  width: 8,
                                ),
                                buildUnitMeasure('weight', 'lbs'),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Weight',
                          hintText: 'Enter your weight',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.saveUserInfo();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const CustomText(
                        text: 'Save',
                        color: ColorPalette.black00,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUnitMeasure(String type, String unitMeasure) {
    final InputUserInfoController inputUserInfoController =
        Get.put(InputUserInfoController());
    var isSelected = false;
    if (type == 'height') {
      isSelected = inputUserInfoController.selectedHeightUnitMeasure.value ==
          unitMeasure;
    } else if (type == 'weight') {
      isSelected = inputUserInfoController.selectedWeightUnitMeasure.value ==
          unitMeasure;
    }
    return GestureDetector(
      onTap: () {
        if (type == 'height') {
          inputUserInfoController.selectHeightUnitMeasure(unitMeasure);
        } else if (type == 'weight') {
          inputUserInfoController.selectWeightUnitMeasure(unitMeasure);
        }
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? ColorPalette.black : ColorPalette.black25,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: CustomText(
            text: unitMeasure,
            fontWeight: FontWeight.w500,
            color: ColorPalette.black,
          ),
        ),
      ),
    );
  }

  Widget buildGenderItem(String svgAsset, String gender, Color genderColor) {
    final InputUserInfoController genderController =
        Get.put(InputUserInfoController());
    final isSelected = genderController.selectedGender.value == gender;

    return GestureDetector(
      onTap: () {
        genderController.selectGender(gender);
      },
      child: AnimatedContainer(
        width: 135,
        height: 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(left: 8, right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? genderColor : ColorPalette.black25,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              svgAsset,
              width: 84,
              height: 84,
            ),
            CustomText(
              text: gender.capitalizeFirst!,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
