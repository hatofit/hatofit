import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:intl/intl.dart';

import 'free_workout_controller.dart';

class FreeWorkoutPage extends GetView<FreeWorkoutController> {
  const FreeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BluetoothService bleService = Get.find<BluetoothService>();
    controller.startWorkout();
    return WillPopScope(
      onWillPop: () async {
        controller.savePrompt();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.savePrompt();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(controller.title),
          actions: [
            IconButton(
              onPressed: () {
                controller.savePrompt();
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Obx(() {
                controller.add(DateTime.now().millisecondsSinceEpoch,
                    bleService.heartRate.value);
                if (controller.hrList.length % 2 == 0) {
                  controller.calcHr();
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Elapsed ${controller.findElapsed()}'),
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
                        child: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: Colors.blueGrey.withOpacity(0.5),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: const Border(
                                bottom: BorderSide(color: Colors.white),
                                left: BorderSide(color: Colors.white),
                                right: BorderSide(color: Colors.transparent),
                                top: BorderSide(color: Colors.transparent),
                              ),
                            ),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    String time = DateFormat('mm:ss').format(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                            value.toInt()));
                                    return bottomTitleWidgets(time, meta);
                                  },
                                ),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: controller.hrStats.value.flSpot,
                                isCurved: false,
                                belowBarData: BarAreaData(applyCutOffY: true),
                                isStrokeCapRound: false,
                                isStrokeJoinRound: false,
                                barWidth: 3,
                                color: Colors.red,
                                dotData: const FlDotData(show: false),
                              ),
                            ],
                            minY: 0,
                            maxY: 200,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(String value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Transform(
        transform: Matrix4.identity()..rotateZ(45 * pi / 180),
        child: Text(
          value,
        ),
      ),
    );
  }
}
