import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          color: Colors.white,
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
                color: Colors.black54  ,
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
