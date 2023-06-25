import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/modules/settings/setting_controller.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/setting/setting_list_tile_widget.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.backgroundColor,
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
                    color: ColorPalette.black00,
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
                          controller.isAuth
                              ? const Text('Auth')
                              : SvgPicture.asset(
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
                              CustomText(
                                text: controller.userName.toString(),
                                fontSize: 16,
                              ),
                              CustomText(
                                text: "${controller.userAge} years old",
                                color: ColorPalette.black50,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPalette.black50,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: ColorPalette.black00,
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
                                  const CustomText(
                                    text: "Backup & Restore",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
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
                              const CustomText(
                                text: 'Sign in and synchronize your data',
                                color: ColorPalette.black50,
                                fontSize: 12,
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.sync,
                              color: ColorPalette.black50,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: ColorPalette.black10,
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
                              const CustomText(
                                text: "Sync to Google Fit",
                                fontSize: 14,
                              ),
                            ],
                          ),
                          Obx(
                            () => Switch(
                              value: controller.isSync.value,
                              onChanged: (value) {
                                controller.isSync.value = value;
                              },
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
                    color: ColorPalette.black00,
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
                      const Divider(
                        color: ColorPalette.black10,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Change Goal',
                        onTap: () {},
                      ),
                      const Divider(
                        color: ColorPalette.black10,
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
                    color: ColorPalette.black00,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SettingListTileWidget(
                    showLeading: true,
                    leading: const Icon(
                      FontAwesomeIcons.trashCan,
                      textDirection: TextDirection.rtl,
                      opticalSize: 20,
                      size: 20,
                      color: ColorPalette.black50,
                    ),
                    title: 'Reset',
                    onTap: () {
                      storage.erase();
                      Get.defaultDialog(
                        title: 'Reset',
                        middleText: 'Are you sure want to reset?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: ColorPalette.black00,
                        cancelTextColor: ColorPalette.black,
                        onConfirm: () {
                          controller.clear();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorPalette.black00,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(top: 24),
                  child: Column(
                    children: [
                      SettingListTileWidget(
                        title: 'About',
                        onTap: () {},
                      ),
                      const Divider(
                        color: ColorPalette.black10,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Privacy Policy',
                        onTap: () {},
                      ),
                      const Divider(
                        color: ColorPalette.black10,
                        thickness: 1,
                        height: 1,
                      ),
                      SettingListTileWidget(
                        title: 'Terms of Use',
                        onTap: () {},
                      ),
                      const Divider(
                        color: ColorPalette.black10,
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
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 24),
                    child: CustomText(
                      text: "Version 1.0.0",
                      color: ColorPalette.black50,
                      fontSize: 12,
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
