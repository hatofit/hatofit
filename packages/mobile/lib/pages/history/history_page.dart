import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

import '../dashboard/dashboard_controller.dart';
import 'history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    final DashboardController dashboardController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.black00,
      ),
      body: Center(
        child: SizedBox(
          width: dashboardController.screenWidth * 0.95,
          child: Obx(
            () => ListView.builder(
              itemCount: controller.workouts.length,
              itemBuilder: (context, index) {
                var workout = controller.workouts[index];
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: ColorPalette.black00,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPalette.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(workout.icon),
                              const SizedBox(width: 8),
                              CustomText(
                                text: workout.name,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          CustomText(
                            text: workout.date,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                      const Divider(
                        color: ColorPalette.black50,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: dashboardController.screenHeight * 0.09,
                            width: dashboardController.screenWidth * 0.32,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorPalette.crimsonRed.withOpacity(0.25),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomText(
                                      text: 'Average HR',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    IconWrapper(
                                      icon: FontAwesomeIcons.heartPulse,
                                      iconColor: ColorPalette.crimsonRed,
                                      backgroundColor: ColorPalette.crimsonRed
                                          .withOpacity(0.3),
                                      iconSize: 8,
                                      containerSize: 16,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: ColorPalette.black50,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: workout.averageHR.toString(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(width: 4),
                                    const CustomText(
                                      text: ' bpm',
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: dashboardController.screenHeight * 0.09,
                            width: dashboardController.screenWidth * 0.24,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorPalette.purple.withOpacity(0.25),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomText(
                                      text: 'Calories',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    IconWrapper(
                                      icon: FontAwesomeIcons.fire,
                                      iconColor: ColorPalette.purple,
                                      backgroundColor:
                                          ColorPalette.purple.withOpacity(0.3),
                                      iconSize: 8,
                                      containerSize: 16,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: ColorPalette.black50,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: workout.calories.toString(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(width: 4),
                                    const CustomText(
                                      text: ' kcal',
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: dashboardController.screenHeight * 0.09,
                            width: dashboardController.screenWidth * 0.25,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorPalette.aqua.withOpacity(0.25),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomText(
                                      text: 'Duration',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    IconWrapper(
                                      icon: FontAwesomeIcons.stopwatch,
                                      iconColor: ColorPalette.aqua,
                                      backgroundColor:
                                          ColorPalette.aqua.withOpacity(0.3),
                                      iconSize: 8,
                                      containerSize: 16,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: ColorPalette.black50,
                                  thickness: 1,
                                ),
                                CustomText(
                                  text: workout.duration,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
