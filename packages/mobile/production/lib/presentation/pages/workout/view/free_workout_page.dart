import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/presentation/controller/wo/wo_con.dart';
import 'package:intl/intl.dart';

class FreeWorkoutPage extends GetView<WoCon> {
  const FreeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final pCon = Get.find<PolarService>();
    final woCon = controller;
    final bCon = Get.find<BluetoothService>();
    woCon.currentZone = '';
    return WillPopScope(
      onWillPop: () async {
        woCon.savePrompt(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              woCon.savePrompt(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Free Workout'),
          actions: [
            IconButton(
              onPressed: () {
                woCon.savePrompt(context);
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
                woCon.add(DateTime.now().microsecondsSinceEpoch,
                    bCon.heartRate.value);
                if (woCon.hrList.length % 2 == 0) {
                  woCon.calcHr();
                }
                woCon.hrZone(bCon.heartRate.value);
                woCon.sessionData.add(bCon.currSecDataItem);
                return woCon.hrStats.value == null
                    ? const SizedBox()
                    : Column(
                        children: [
                          Text('Elapsed ${woCon.findElapsed(
                            woCon.hrList.first['time'],
                            woCon.hrList.last['time'],
                          )}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Now ${woCon.hrStats.value!.last}'),
                              Text('Min ${woCon.hrStats.value!.min}'),
                              Text('Max ${woCon.hrStats.value!.max}'),
                              Text('Avg ${woCon.hrStats.value!.avg}'),
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
                                      tooltipBgColor:
                                          Colors.blueGrey.withOpacity(0.5),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: true,
                                    border: const Border(
                                      bottom: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                      right:
                                          BorderSide(color: Colors.transparent),
                                      top:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          String time = DateFormat('mm:ss')
                                              .format(DateTime
                                                  .fromMicrosecondsSinceEpoch(
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
                                      spots: woCon.hrStats.value!.flSpot,
                                      isCurved: false,
                                      belowBarData:
                                          BarAreaData(applyCutOffY: true),
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
                              ),
                            ),
                          ),
                          Text(woCon.currentZone),
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
