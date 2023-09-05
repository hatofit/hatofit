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
              controller.add(DateTime.now().microsecondsSinceEpoch,
                  bleService.detectedDevices.last.hr.value);
              if (controller.hrList.length % 2 == 0) {
                controller.calcHr();
              }
              controller.userZone(bleService.detectedDevices.first.hr.value);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Elapsed : ${TimeUtils.elapsed(
                        controller.hrList.first['time'],
                        controller.hrList.last['time'],
                      )}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Now ${controller.hrStats.value.last}'),
                      Text('Min ${controller.hrStats.value.min}'),
                      Text('Max ${controller.hrStats.value.max}'),
                      Text('Avg ${controller.hrStats.value.avg}'),
                    ],
                  ),
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
