import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
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
                        color: Get.isDarkMode ? Colors.white : Colors.black,
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
                                foregroundColor:
                                    Theme.of(context).iconTheme.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  side: BorderSide(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    width: 2,
                                  ),
                                ),
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.fullNameController.value.text = value;
                    controller.refreshController();
                  },
                  controller: controller.fullNameController.value,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                    ),
                    labelText: 'Full Name',
                  ),
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
                      controller: controller.dateOfBirthController.value,
                      enabled: false,
                      keyboardType: TextInputType.datetime,
                      style: TextStyle(
                          color: controller
                                  .dateOfBirthController.value.text.isNotEmpty
                              ? Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black
                              : null),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.calendar,
                          size: 16,
                        ),
                        labelText: 'Date of Birth',
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
                            initialDate: controller.userDateOfBirth.value,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((pickedDate) {
                            if (pickedDate != null) {
                              String formattedDate =
                                  '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
                              controller.dateOfBirthController.value.text =
                                  formattedDate;
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
                DropdownButtonFormField<String>(
                  value: controller.userGender.value,
                  onChanged: (value) {
                    controller.userGender.value = value!;
                    controller.refreshController();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.person),
                    labelText: 'Gender',
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'male',
                      child: Text(
                        'Male',
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'female',
                      child: Text(
                        'Female',
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.emailController.value.text = value;
                    controller.refreshController();
                  },
                  controller: controller.emailController.value,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                      ),
                      labelText: 'Email'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.passwordController.value,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                    ),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.updateUser();
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
