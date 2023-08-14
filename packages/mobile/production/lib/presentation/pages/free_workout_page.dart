import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/services/polar_service.dart';
import '../controllers/free_workout_controller.dart';

class FreeWorkoutPage extends StatelessWidget {
  const FreeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PolarService pCon = Get.find<PolarService>();
    final FreeWorkoutController fWCon = Get.put(FreeWorkoutController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            fWCon.savePrompt();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(fWCon.title),
        actions: [
          IconButton(
            onPressed: () {
              fWCon.savePrompt();
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
              fWCon.add(DateTime.now().millisecondsSinceEpoch,
                  int.parse(pCon.heartRate.value));
              if (fWCon.hrList.length % 2 == 0) {
                fWCon.calcHr();
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Elapsed ${fWCon.findElapsed()}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Now ${fWCon.hrStats.value.last}'),
                      Text('Min ${fWCon.hrStats.value.min}'),
                      Text('Max ${fWCon.hrStats.value.max}'),
                      Text('Avg ${fWCon.hrStats.value.avg}'),
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
                              spots: fWCon.hrStats.value.flSpot,
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
