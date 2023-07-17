import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/register/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                        Text(
                          'Fill Form Below',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
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
                                  'assets/images/male.png',
                                  'male',
                                  ColorConstants.male,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                _buildGenderItem(
                                  context,
                                  'assets/images/female.png',
                                  'female',
                                  ColorConstants.female,
                                ),
                              ],
                            ),
                            const SizedBox(height: 48),
                            TextFormField(
                              onChanged: (value) {
                                controller.refreshController();
                              },
                              controller: controller.firstNameController.value,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.user,
                                  size: 16,
                                ),
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: controller.lastNameController.value,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.user,
                                  size: 16,
                                ),
                                labelText: 'Last Name',
                                hintText: 'Enter your last name',
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    controller.refreshController();
                                  },
                                  controller:
                                      controller.dateOfBirthController.value,
                                  enabled: false,
                                  keyboardType: TextInputType.datetime,
                                  style: TextStyle(
                                      color: controller.dateOfBirthController
                                              .value.text.isNotEmpty
                                          ? Colors.white
                                          : null),
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.calendar,
                                      size: 16,
                                    ),
                                    labelText: 'Date of Birth',
                                    hintText: 'Enter your age',
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 12,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      ).then((pickedDate) {
                                        if (pickedDate != null) {
                                          String formattedDate =
                                              '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
                                          controller.dateOfBirthController.value
                                              .text = formattedDate;
                                          controller.formattedDate.value =
                                              '${pickedDate.year}-${pickedDate.day}-${pickedDate.month}';
                                              controller.userDateOfBirth.value = pickedDate;
                                          controller.refreshController();
                                        }
                                      });
                                    },
                                    child: const SizedBox(
                                      height: 48,
                                      width: 48,
                                      child: Icon(
                                        CupertinoIcons.calendar,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // email
                            TextFormField(
                              controller: controller.emailController.value,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 16,
                                ),
                                labelText: 'Email',
                                hintText: 'Enter your email',
                              ),
                              onChanged: (value) {
                                controller.refreshController();
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // password
                            TextFormField(
                              controller: controller.passwordController.value,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 16,
                                ),
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                // suffix icon for reveal password
                              ),
                              onChanged: (value) {
                                controller.refreshController();
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // confirm password
                            TextFormField(
                              controller:
                                  controller.confirmPasswordController.value,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 16,
                                ),
                                labelText: 'Confirm Password',
                                hintText: 'Enter your password',
                              ),
                              onChanged: (value) {
                                controller.refreshController();
                              },
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
                              backgroundColor: controller.firstNameController
                                          .value.value.text.isEmpty ||
                                      controller.lastNameController.value.value
                                          .text.isEmpty ||
                                      controller.dateOfBirthController.value
                                          .value.text.isEmpty ||
                                      controller.emailController.value.value
                                          .text.isEmpty ||
                                      controller.passwordController.value.value
                                          .text.isEmpty ||
                                      controller.confirmPasswordController.value
                                          .value.text.isEmpty ||
                                      controller.isGenderSelected.value == false
                                  ? Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.2)
                                  : Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              controller.refreshController();
                              if (controller.firstNameController.value.value
                                      .text.isEmpty ||
                                  controller.lastNameController.value.value.text
                                      .isEmpty ||
                                  controller.dateOfBirthController.value.value
                                      .text.isEmpty ||
                                  controller.emailController.value.value.text
                                      .isEmpty ||
                                  controller.passwordController.value.value.text
                                      .isEmpty ||
                                  controller.confirmPasswordController.value
                                      .value.text.isEmpty ||
                                  controller.isGenderSelected.value == false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please fill all fields',
                                    ),
                                  ),
                                );
                              } else {
                                if (controller
                                        .passwordController.value.value.text !=
                                    controller.confirmPasswordController.value
                                        .value.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Password and confirm password does not match',
                                      ),
                                    ),
                                  );
                                } else {
                                  controller.saveUserInfo();
                                }
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
      ),
    );
  }

  Widget _buildGenderItem(
      BuildContext context, String svgAsset, String gender, Color genderColor) {
    final isSelected = controller.selectedGender.value == gender;

    return GestureDetector(
      onTap: () {
        controller.selectGender(gender);
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
            Image.asset(
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
