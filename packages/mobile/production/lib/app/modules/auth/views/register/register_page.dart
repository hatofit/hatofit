import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/auth/views/register/register_controller.dart';
import 'package:hatofit/app/themes/colors_constants.dart';

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
                            InkWell(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  clipBehavior: Clip.none,
                                  children: [
                                    controller.pickedImage.value.path.isEmpty
                                        ? const Icon(
                                            FontAwesomeIcons.user,
                                            size: 75,
                                            color: Colors.grey,
                                          )
                                        : CircleAvatar(
                                            backgroundImage: FileImage(
                                              controller.pickedImage.value,
                                            ),
                                          ),
                                    Positioned(
                                      right: -8,
                                      bottom: 0,
                                      child: SizedBox(
                                        height: 46,
                                        width: 46,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50)),
                                              side: BorderSide(
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          onPressed: () {
                                            controller.pickImage();
                                          },
                                          child: const Icon(
                                            CupertinoIcons.photo_camera,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildGenderItem(
                                  context,
                                  'assets/images/avatar/male.png',
                                  'male',
                                  ColorConstants.male,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                _buildGenderItem(
                                  context,
                                  'assets/images/avatar/female.png',
                                  'female',
                                  ColorConstants.female,
                                ),
                              ],
                            ),
                            const SizedBox(height: 38),
                            TextFormField(
                              controller: controller.firstNameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
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
                              controller: controller.lastNameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.user,
                                  size: 16,
                                ),
                                labelText: 'Last Name',
                                hintText: 'Enter your last name',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
                              children: [
                                TextFormField(
                                  controller: controller.dateOfBirthController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your date of birth';
                                    }
                                    return null;
                                  },
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
                                          controller.dateOfBirthController
                                              .text = formattedDate;
                                          controller.formattedDate.value =
                                              '${pickedDate.year}-${pickedDate.day}-${pickedDate.month}';
                                          controller.userDateOfBirth.value =
                                              pickedDate;
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
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (value.isEmail == false) {
                                  return 'Please enter valid email';
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 16,
                                ),
                                labelText: 'Email',
                                hintText: 'Enter your email',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // password
                            TextFormField(
                              controller: controller.passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
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
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            // confirm password
                            TextFormField(
                              controller: controller.confirmPasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                if (value !=
                                    controller.passwordController.text) {
                                  return 'Password does not match';
                                }
                                return null;
                              },
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
                                    Theme.of(context).primaryColor),
                            onPressed: () {
                              controller.formKey.currentState!.validate();
                              if (controller.passwordController.text !=
                                  controller.confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Password and confirm password does not match',
                                    ),
                                  ),
                                );
                              } else {
                                if (controller.formKey.currentState!
                                    .validate()) {
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
