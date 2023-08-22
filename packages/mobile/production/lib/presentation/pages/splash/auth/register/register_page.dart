import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/presentation/controller/reg/reg_con.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../app/themes/colors_constants.dart';
import '../../../../../data/repos/image_repo_iml.dart';
import '../../../../widget/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final regCon = Get.find<RegCon>();
    Get.put(() => ImageRepoIml());
    regCon.fNameCon.text = 'Rahmat';
    regCon.lNameCon.text = 'Hidayat';
    regCon.emailCon.text = 'rhmat@gmail.com';
    regCon.passwordCon.text = 'password';
    regCon.confirmPasswordCon.text = 'password';
    regCon.dateOfBirthCon.text = '12-12-1999';
    regCon.formattedDate.value = '1999-12-12';
    regCon.userDateOfBirth.value = DateTime(1999, 12, 12); 
regCon.selectGender('male');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        controller: regCon.scrlCon,
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Form(
                key: regCon.formKey,
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
                                  regCon.pickImage(ImageSource.gallery);
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Obx(
                                        () => Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 3,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: regCon.pickedImage.value.path
                                                  .isEmpty
                                              ? const Icon(
                                                  FontAwesomeIcons.user,
                                                  size: 75,
                                                  color: Colors.grey,
                                                )
                                              : CircleAvatar(
                                                  backgroundImage: FileImage(
                                                    regCon.pickedImage.value,
                                                  ),
                                                ),
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
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                side: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 3,
                                                ),
                                              ),
                                              backgroundColor:
                                                  ColorConstants.crimsonRed,
                                            ),
                                            onPressed: () {
                                              regCon.pickImage(
                                                  ImageSource.camera);
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
                                  Obx(
                                    () => _buildGenderItem(
                                        context: context,
                                        svgAsset: 'assets/images/male.png',
                                        gender: 'male',
                                        genderColor: ColorConstants.male,
                                        regCon: regCon),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Obx(
                                    () => _buildGenderItem(
                                        context: context,
                                        svgAsset: 'assets/images/female.png',
                                        gender: 'female',
                                        genderColor: ColorConstants.female,
                                        regCon: regCon),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 48),
                              CustomTextFormField(
                                controller: regCon.fNameCon,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                                prefixIcon: FontAwesomeIcons.user,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextFormField(
                                controller: regCon.lNameCon,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                                labelText: 'Last Name',
                                hintText: 'Enter your last name',
                                prefixIcon: FontAwesomeIcons.user,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Stack(
                                children: [
                                  CustomTextFormField(
                                    controller: regCon.dateOfBirthCon,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your date of birth';
                                      }
                                      return null;
                                    },
                                    enabled: false,
                                    keyboardType: TextInputType.datetime,
                                    labelText: 'Date of Birth',
                                    hintText: 'Enter your age',
                                    prefixIcon: FontAwesomeIcons.calendar,
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
                                            regCon.dateOfBirthCon.text =
                                                formattedDate;
                                            regCon.formattedDate.value =
                                                '${pickedDate.year}-${pickedDate.day}-${pickedDate.month}';
                                            regCon.userDateOfBirth.value =
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
                              CustomTextFormField(
                                controller: regCon.emailCon,
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
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                prefixIcon: FontAwesomeIcons.envelope,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              // password
                              CustomTextFormField(
                                controller: regCon.passwordCon,
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
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: FontAwesomeIcons.lock,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              // confirm password
                              CustomTextFormField(
                                controller: regCon.confirmPasswordCon,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  if (value != regCon.passwordCon.text) {
                                    return 'Password does not match';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                prefixIcon: FontAwesomeIcons.lock,
                                labelText: 'Confirm Password',
                                hintText: 'Enter your confirm password',
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
                              onPressed: () async {
                                final formIsValid =
                                    regCon.formKey.currentState!.validate();
                                if (formIsValid &&
                                    regCon.passwordCon.text ==
                                        regCon.confirmPasswordCon.text) {
                                  FocusScope.of(context).unfocus();
                                  Future.delayed(const Duration(seconds: 1));
                                  Get.toNamed(AppRoutes.inputUserMetric);
                                } else if (!formIsValid) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please input all required field')),
                                  );
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
                ))),
      ),
    );
  }

  Widget _buildGenderItem({
    required BuildContext context,
    required String svgAsset,
    required String gender,
    required Color genderColor,
    required RegCon regCon,
  }) {
    final isSelected = regCon.selectedGender.value == gender;

    return GestureDetector(
      onTap: () async {
        print('===***===\n'
            'gemder $gender\n'
            '===***===\n');
        await regCon.selectGender(gender);
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
