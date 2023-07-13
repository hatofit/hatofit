import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_info/input_user_info_controller.dart';

class InputUserInfoPage extends StatefulWidget {
  const InputUserInfoPage({super.key});

  @override
  State<InputUserInfoPage> createState() => _InputUserInfoPageState();
}

class _InputUserInfoPageState extends State<InputUserInfoPage> {
  final _inputUserController = Get.put(InputUserInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Form(
            key: _inputUserController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Column(
                    children: [
                      Text(
                        'Fill Form Below',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  letterSpacing: 1.5,
                                ),
                      ),
                      Text(
                        'Find best workout based on your info',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 48),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildGenderItem(
                                context,
                                'assets/images/male.svg',
                                'male',
                                ColorConstants.male,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              _buildGenderItem(
                                context,
                                'assets/images/female.svg',
                                'female',
                                ColorConstants.female,
                              ),
                            ],
                          ),
                          const SizedBox(height: 48),
                          TextFormField(
                            onChanged: (value) {
                              _inputUserController.ageController.text.isEmpty
                                  ? _inputUserController.isAgeEmpty.value = true
                                  : _inputUserController.isAgeEmpty.value =
                                      false;
                              _inputUserController.nameController.text.isEmpty
                                  ? _inputUserController.isNameEmpty.value =
                                      true
                                  : _inputUserController.isNameEmpty.value =
                                      false;
                            },
                            controller: _inputUserController.nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                                size: 16,
                              ),
                              labelText: 'Name',
                              hintText: 'Enter your name',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              _inputUserController.nameController.text.isEmpty
                                  ? _inputUserController.isNameEmpty.value =
                                      true
                                  : _inputUserController.isNameEmpty.value =
                                      false;
                              _inputUserController.ageController.text.isEmpty
                                  ? _inputUserController.isAgeEmpty.value = true
                                  : _inputUserController.isAgeEmpty.value =
                                      false;
                            },
                            controller: _inputUserController.ageController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.calendar,
                                size: 16,
                              ),
                              suffix: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text('y.o'),
                              ),
                              labelText: 'Age',
                              hintText: 'Enter your age',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _inputUserController.isAgeEmpty.value == true ||
                                        _inputUserController
                                                .isNameEmpty.value ==
                                            true ||
                                        _inputUserController
                                                .isGenderSelected.value ==
                                            false
                                    ? Theme.of(context)
                                        .primaryColorDark
                                        .withOpacity(0.2)
                                    : Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            if (_inputUserController.isAgeEmpty.value ==
                                    false &&
                                _inputUserController.isNameEmpty.value ==
                                    false) {
                              _inputUserController.saveUserInfo();
                            }
                          },
                          child: const Text(
                            'Next',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderItem(
      BuildContext context, String svgAsset, String gender, Color genderColor) {
    final isSelected = _inputUserController.selectedGender.value == gender;

    return GestureDetector(
      onTap: () {
        _inputUserController.selectGender(gender);
      },
      child: AnimatedContainer(
        width: 150,
        height: 175,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(left: 8, right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? genderColor : Colors.grey.withOpacity(0.5),
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
            Text(
              gender.capitalizeFirst!,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(letterSpacing: 1.5, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
