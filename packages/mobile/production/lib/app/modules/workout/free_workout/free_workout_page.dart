import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/heart_Rate.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/utils/time_utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'free_workout_controller.dart';

class FreeWorkoutPage extends GetView<FreeWorkoutController> {
  const FreeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BluetoothService bleService = Get.find<BluetoothService>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoutes.pickWoType);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(controller.title),
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(AppRoutes.pickWoType);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              controller.addHr(
                  DateTime.now().microsecondsSinceEpoch,
                  bleService.detectedDevices
                      .firstWhere((element) => element.isConnect.value == true)
                      .hr
                      .value);
              if (controller.hrList.length % 2 == 0) {
                controller.calcHr();
              }
              controller.userZone(bleService.detectedDevices.first.hr.value);
              return Column(
                children: [
                  Container(
                      width: Get.width * 0.9,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
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
                            TimeUtils.elapsed(
                              controller.hrList.first['time'],
                              controller.hrList.last['time'],
                            ),
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
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
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
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text('Now'),
                                    Text(
                                      controller.hrList.last['hr'].toString(),
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
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text('Min'),
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
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text('Max'),
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
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text('Avg'),
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
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
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
