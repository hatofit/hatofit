import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/setting_controller.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/device_integration/device_integration_page.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/setting_list_tile_widget.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/appBar/custom_app_bar.dart';

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
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.profile,
                    );
                  },
                  child: Container(
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
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(666),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: FileImage(File(
                                      '/storage/emulated/0/Android/data/com.hatofit.hatofit/files/photo-profile.jpg')),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Obx(
                              () => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.userName.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    "${controller.userAge} years old",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 24),
                //   decoration: BoxDecoration(
                //     color: isDarkMode
                //         ? ColorConstants.darkContainer
                //         : ColorConstants.lightContainer,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 8),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Row(
                //               children: [
                //                 SvgPicture.asset(
                //                   'assets/images/icons/google-fit.svg',
                //                   width: 18,
                //                 ),
                //                 const SizedBox(
                //                   width: 8,
                //                 ),
                //                 Text(
                //                   "Sync to Google Fit",
                //                   style: Theme.of(context).textTheme.bodyMedium,
                //                 ),
                //               ],
                //             ),
                //             Obx(
                //               () => Transform.scale(
                //                 scale: 0.8,
                //                 child: CupertinoSwitch(
                //                   value: controller.authorized.value,
                //                   onChanged: (value) async {
                //                     controller.authorize();
                //                   },
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
                        title: 'Device Integration',
                        onTap: () {
                          Get.to(() => const DeviceIntegrationPage());
                        },
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
                    leading: Icon(CupertinoIcons.trash,
                        textDirection: TextDirection.rtl,
                        size: 18,
                        color: Theme.of(context)
                            .iconTheme
                            .color
                            ?.withOpacity(0.5)),
                    title: 'Logout',
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Logout',
                        middleText: 'Are you sure want to logout?',
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
                // Container(
                //   decoration: BoxDecoration(
                //     color: isDarkMode
                //         ? ColorConstants.darkContainer
                //         : ColorConstants.lightContainer,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   margin: const EdgeInsets.only(top: 24),
                //   child: Column(
                //     children: [
                //       SettingListTileWidget(
                //         title: 'About',
                //         onTap: () {

                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 24, bottom: 24),
                //     child: Text(
                //       "Version 1.0.0",
                //       style: Theme.of(context).textTheme.bodySmall,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
