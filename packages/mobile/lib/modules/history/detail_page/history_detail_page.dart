import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/history/detail_page/history_detail_controller.dart';
import 'package:polar_hr_devices/services/internet_service.dart';

class HistoryDetailPage extends GetView<HistoryDetailController> {
  final String exerciseId;
  const HistoryDetailPage(this.exerciseId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Center(
        child: Container(
          child: AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: FutureBuilder(
                future: InternetService().fetchReport(exerciseId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as Map<String, dynamic>;
                    final reports = data['reports'] as List<dynamic>;
                    final hrReport = reports.firstWhere(
                      (report) => report['type'] == 'hr',
                      orElse: () => null,
                    );
                    if (hrReport != null) {
                      final hrData = hrReport['data'] as List<dynamic>;
                      final valueList = hrData.first['value'] as List<dynamic>;
                      final spots = valueList.map((value) {
                        final x = value[0].toDouble();
                        final y = value[1].toDouble();
                        print('x: $x, y: $y');
                        return FlSpot(x, y);
                      }).toList();
                      // find minX stand for the first value of x axis

                      return LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: false,
                            drawVerticalLine: true,
                            horizontalInterval: 1,
                            verticalInterval: 1,
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: const Color(0xff37434d)),
                          ),
                          titlesData: FlTitlesData(
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: spots,
                              isCurved: true,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.redAccent,
                                ],
                              ),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.cyanAccent,
                                    Colors.blueAccent,
                                  ]
                                      .map((color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text('No HR report found.');
                    }
                  } else {
                    return CupertinoActivityIndicator(
                      radius: 16,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
