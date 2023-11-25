import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/heart_rate.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/utils/hr_zone.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'free_workout_controller.dart';

class FreeWorkoutPage extends GetView<FreeWorkoutController> {
  const FreeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoutes.pickWoType);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Free Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Column(
                children: [
                  Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Elapsed :',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            controller.hrStats.value.time,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Heart Rate',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[900]
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const Text('Now'),
                                    Text(
                                      controller.currentHeartRate.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[900]
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const Text('Min'),
                                    Text(
                                      controller.hrStats.value.min.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[900]
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const Text('Max'),
                                    Text(
                                      controller.hrStats.value.max.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[900]
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const Text('Avg'),
                                    Text(
                                      controller.hrStats.value.avg.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? ColorConstants.darkContainer
                          : ColorConstants.lightContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          LineSeries<HrChart, DateTime>(
                            dataSource: controller.hrStats.value.sfSpot,
                            xValueMapper: (HrChart hr, _) => hr.time,
                            yValueMapper: (HrChart hr, _) => hr.hr,
                            color: ColorConstants.crimsonRed,
                          ),
                        ],
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 200,
                        ),
                        primaryXAxis: DateTimeAxis(
                          dateFormat: DateFormat('HH:mm:ss'),
                          interval: 10,
                          intervalType: DateTimeIntervalType.seconds,
                          minimum: DateTime.now().subtract(
                            const Duration(seconds: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? ColorConstants.darkContainer
                                : ColorConstants.lightContainer,
                            borderRadius: BorderRadius.circular(666),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${controller.hrPecentage.value} %',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        )),
                                const Text('of max HR'),
                              ],
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? ColorConstants.darkContainer
                                : ColorConstants.lightContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Text('Zone'),
                              Text(
                                controller.hrZoneType.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: controller.hrZoneType.color,
                                    ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              );
            }),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  controller.finishWorkout();
                },
                child: const Text('End'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
