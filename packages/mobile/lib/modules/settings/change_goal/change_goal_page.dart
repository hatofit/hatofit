import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/modules/settings/change_goal/change_goal_controller.dart'; 
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/setting/setting_list_tile_widget.dart';

class ChangeGoalPage extends GetView<ChangeGoalController> {
  const ChangeGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorPalette.black,
          ),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        title: const CustomText(
          text: 'Change Unit',
          color: ColorPalette.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
        backgroundColor: ColorPalette.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: CustomText(
                      text: 'Energy Unit',
                      fontSize: 12,
                      color: ColorPalette.black50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: ColorPalette.black00,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SettingListTileWidget(
                          title: 'Calories',
                          onTap: () {
                            controller.changeEnergyUnit(
                              'Calories',
                            );
                          },
                          trailing: controller.energyUnit.value == 'Calories'
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorPalette.crimsonRed,
                                  size: 16,
                                )
                              : SizedBox(),
                        ),
                        const Divider(
                          color: ColorPalette.black10,
                          thickness: 1,
                          height: 1,
                        ),
                        SettingListTileWidget(
                          title: 'Kilocalories',
                          onTap: () {
                            controller.changeEnergyUnit(
                              'Kilocalories',
                            );
                          },
                          trailing:
                              controller.energyUnit.value == 'Kilocalories'
                                  ? Icon(
                                      FontAwesomeIcons.check,
                                      color: ColorPalette.crimsonRed,
                                      size: 16,
                                    )
                                  : SizedBox(),
                        ),
                        const Divider(
                          color: ColorPalette.black10,
                          thickness: 1,
                          height: 1,
                        ),
                        SettingListTileWidget(
                          title: 'Kilojoules',
                          onTap: () {
                            controller.changeEnergyUnit(
                              'Kilojoules',
                            );
                          },
                          trailing: controller.energyUnit.value == 'Kilojoules'
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorPalette.crimsonRed,
                                  size: 16,
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: CustomText(
                      text: 'Height Unit',
                      fontSize: 12,
                      color: ColorPalette.black50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: ColorPalette.black00,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SettingListTileWidget(
                          title: 'Centimeters',
                          onTap: () {
                            controller.changeHeightUnit(
                              'Centimeters',
                            );
                          },
                          trailing: controller.heightUnit.value == 'Centimeters'
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorPalette.crimsonRed,
                                  size: 16,
                                )
                              : SizedBox(),
                        ),
                        const Divider(
                          color: ColorPalette.black10,
                          thickness: 1,
                          height: 1,
                        ),
                        SettingListTileWidget(
                          title: 'Feet',
                          onTap: () {
                            controller.changeHeightUnit(
                              'Feet',
                            );
                          },
                          trailing: controller.heightUnit.value == 'Feet'
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorPalette.crimsonRed,
                                  size: 16,
                                )
                              : SizedBox(),
                        ),
                        const Divider(
                          color: ColorPalette.black10,
                          thickness: 1,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: CustomText(
                      text: 'Weight Unit',
                      fontSize: 12,
                      color: ColorPalette.black50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: ColorPalette.black00,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SettingListTileWidget(
                          title: 'Kilograms',
                          onTap: () {
                            controller.changeWeightUnit(
                              'Kilograms',
                            );
                          },
                          trailing: controller.weightUnit.value == 'Kilograms'
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorPalette.crimsonRed,
                                  size: 16,
                                )
                              : SizedBox(),
                        ),
                        const Divider(
                          color: ColorPalette.black10,
                          thickness: 1,
                          height: 1,
                        ),
                        SettingListTileWidget(
                          title: 'Lbs',
                          onTap: () {
                            controller.changeWeightUnit(
                              'Lbs',
                            );
                          },
                          trailing: controller.weightUnit.value == 'Lbs'
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorPalette.crimsonRed,
                                  size: 16,
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
