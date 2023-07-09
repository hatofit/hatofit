import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';

import '../dashboard/dashboard_controller.dart';
import 'history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());

    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
      ),
      body: Center(
        child: SizedBox(
          width: dashboardController.screenWidth * 0.95,
          child: Column(
            children: [
              // Obx(
              //   () => ListView.builder(
              //     itemCount: controller.workouts.length,
              //     itemBuilder: (context, index) {
              //       var workout = controller.workouts[index];
              //       return GestureDetector(
              //         onTap: () {
              //           Get.toNamed(AppRoutes.historyDetail,
              //               arguments: workout);
              //         },
              //         child: buildWorkoutCard(
              //             workout, dashboardController.screenHeight),
              //       );
              //     },
              //   ),
              // ),
              TextButton(onPressed: () {}, child: const Text('Add Workout'))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWorkoutCard(
      BuildContext context, Workout workout, double screenHeight) {
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
                  Text(
                    workout.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              Text(
                workout.date,
                style: Theme.of(context).textTheme.headlineSmall,
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
                  context,
                  'Average HR',
                  FontAwesomeIcons.heartPulse,
                  ColorPalette.crimsonRed,
                  ColorPalette.crimsonRed20,
                  100.toString(),
                  'bpm',
                  screenHeight),
              buildWorkoutMetricContainer(
                  context,
                  'Calories',
                  FontAwesomeIcons.fire,
                  ColorPalette.purple,
                  ColorPalette.purple20,
                  50.toString(),
                  'kcal',
                  screenHeight),
              buildWorkoutMetricContainer(
                context,
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
    BuildContext context,
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
                Text(
                   title,
                  style: Theme.of(context).textTheme.headlineLarge,
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
              Text(value, style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(width: 4),
              Text(
                unit,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
