import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/modules/settings/change_unit/change_unit_controller.dart';

import 'package:polar_hr_devices/widget/setting/setting_list_tile_widget.dart';

class ChangeUnitPage extends GetView<ChangeUnitController> {
  const ChangeUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          title: Text(
            'Change Unit',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
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
                    child: Text('Energy Unit',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorConstants.crimsonRed,
                                  size: 16,
                                )
                              : const SizedBox(),
                        ),
                        const Divider(
                          color: Colors.black12,
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
                                  ? const Icon(
                                      FontAwesomeIcons.check,
                                      color: ColorConstants.crimsonRed,
                                      size: 16,
                                    )
                                  : const SizedBox(),
                        ),
                        const Divider(
                          color: Colors.black12,
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
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorConstants.crimsonRed,
                                  size: 16,
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      'Height Unit',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorConstants.crimsonRed,
                                  size: 16,
                                )
                              : const SizedBox(),
                        ),
                        const Divider(
                          color: Colors.black12,
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
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorConstants.crimsonRed,
                                  size: 16,
                                )
                              : const SizedBox(),
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      'Weight Unit',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorConstants.crimsonRed,
                                  size: 16,
                                )
                              : const SizedBox(),
                        ),
                        const Divider(
                          color: Colors.black12,
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
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: ColorConstants.crimsonRed,
                                  size: 16,
                                )
                              : const SizedBox(),
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
