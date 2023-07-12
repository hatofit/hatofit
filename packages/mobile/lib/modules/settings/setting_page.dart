import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/modules/settings/setting_controller.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/setting/setting_list_tile_widget.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.isDarkMode;
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorConstants.darkContainer
                        : ColorConstants.lightContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            controller.genderAsset,
                            width: 32,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName.toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "${controller.userAge} years old",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorConstants.darkContainer
                        : ColorConstants.lightContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Backup & Restore",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/logo/google.svg',
                                    width: 14,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/logo/apple.svg',
                                    width: 14,
                                  )
                                ],
                              ),
                              Text(
                                'Sign in and synchronize your data',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.sync,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        thickness: 1,
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/logo/google_fit.svg',
                                width: 18,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Sync to Google Fit",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Obx(
                            () => Transform.scale(
                              scale: 0.8,
                              child: CupertinoSwitch(
                                value: controller.isSync.value,
                                onChanged: (value) {
                                  controller.isSync.value = value;
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorConstants.darkContainer
                        : ColorConstants.lightContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      SettingListTileWidget(
                        title: 'Unit of Measurement',
                        onTap: () {
                          Get.toNamed(AppRoutes.changeUnit);
                        },
                      ),
                      Divider(
                        color: isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Change Goal',
                        onTap: () {},
                      ),
                      Divider(
                        color: isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Device Integration',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorConstants.darkContainer
                        : ColorConstants.lightContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SettingListTileWidget(
                    showLeading: true,
                    leading: const Icon(
                      FontAwesomeIcons.trashCan,
                      textDirection: TextDirection.rtl,
                      opticalSize: 20,
                      size: 20,
                      color: Colors.black54,
                    ),
                    title: 'Reset',
                    onTap: () {
                      storage.erase();
                      Get.defaultDialog(
                        title: 'Reset',
                        middleText: 'Are you sure want to reset?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: Colors.white,
                        cancelTextColor: Colors.black,
                        onConfirm: () {
                          controller.clear();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorConstants.darkContainer
                        : ColorConstants.lightContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(top: 24),
                  child: Column(
                    children: [
                      SettingListTileWidget(
                        title: 'About',
                        onTap: () {},
                      ),
                      Divider(
                        color: isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Privacy Policy',
                        onTap: () {},
                      ),
                      Divider(
                        color: isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Terms of Use',
                        onTap: () {},
                      ),
                      Divider(
                        color: isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Open Source Licenses',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: Text(
                      "Version 1.0.0",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
