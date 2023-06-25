import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

import '../dashboard/dashboard_controller.dart';
import 'history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.backgroundColor,
      ),
      body: Center(
        child: SizedBox(
          width: dashboardController.screenWidth * 0.95,
          child: Obx(
            () => ListView.builder(
              itemCount: controller.workouts.length,
              itemBuilder: (context, index) {
                var workout = controller.workouts[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.historyDetail, arguments: workout);
                  },
                  child: buildWorkoutCard(
                      workout, dashboardController.screenHeight),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWorkoutCard(Workout workout, double screenHeight) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorPalette.black00,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: ColorPalette.black25,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                  CustomText(
                    text: workout.name,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CustomText(
                text: workout.date,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Divider(
            color: ColorPalette.black50,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildWorkoutMetricContainer(
                  'Average HR',
                  FontAwesomeIcons.heartPulse,
                  ColorPalette.crimsonRed,
                  ColorPalette.crimsonRed20,
                  100.toString(),
                  'bpm',
                  screenHeight),
              buildWorkoutMetricContainer(
                  'Calories',
                  FontAwesomeIcons.fire,
                  ColorPalette.purple,
                  ColorPalette.purple20,
                  50.toString(),
                  'kcal',
                  screenHeight),
              buildWorkoutMetricContainer(
                'Duration',
                FontAwesomeIcons.stopwatch,
                ColorPalette.aqua,
                ColorPalette.aqua20,
                10.toString(),
                '',
                screenHeight,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildWorkoutMetricContainer(
    String title,
    IconData icon,
    Color iconColor,
    Color backgroundColor,
    String value,
    String unit,
    double height,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorPalette.black00,
          border: Border.all(
            color: backgroundColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: backgroundColor,
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ]),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: ColorPalette.black50,
                width: 1,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 8),
                Icon(
                  icon,
                  color: iconColor,
                  size: 14,
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: value,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(width: 4),
              CustomText(
                text: unit,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
