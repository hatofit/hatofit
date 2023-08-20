import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/presentation/controller/wo/wo_con.dart';
import 'package:intl/intl.dart';

import '../../../../app/services/polar_service.dart';
import 'free_workout_controller.dart';

class FreeWorkoutPage extends StatelessWidget {
  const FreeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pCon = Get.find<PolarService>();
    final woCon = Get.find<WoCon>();
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
              _savePrompt();
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

  Future _savePrompt(WoCon con) {
    final woCon = con;
    woCon.getData();
    final TextEditingController titleController = TextEditingController();
    return Get.defaultDialog(
      title: 'Save Workout',
      content: Column(
        children: [
          const Text('Save Workout?'),
          const SizedBox(height: 16),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // StorageService().saveToJSON(
                  //     'session/raw/log-${titleController.text}.json', session);
                  woCon.postSession(woCon.session!);
                  Get.back();
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
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
