import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/services/internet_service.dart';

class HistoryDetailPage extends StatelessWidget {
  final Future future;
  const HistoryDetailPage(this.future, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ZoomPanBehavior zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.xy,
      enablePanning: true,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Center(
          child: FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final data = snapshot.data?['report'] as Map<String, dynamic>;
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
                    return ChartData(x, y);
                  }).toList();
                  // find average hr
                  final averageHr = valueList
                          .map((value) => value[1].toDouble())
                          .reduce((a, b) => a + b) /
                      valueList.length;
                  // find max hr
                  final maxHr = valueList
                      .map((value) => value[1].toDouble())
                      .reduce((a, b) => a > b ? a : b);
                  final exercise =
                      snapshot.data?['exercise'] as Map<String, dynamic>;
                  debugPrint("===***===\n"
                      "exercise : $exercise\n"
                      "===***===\n");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Column(
                          children: [
                            Text(
                              '${exercise['name']}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${exercise['name']}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Average HR: ${averageHr.toStringAsFixed(0)}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Max HR: ${maxHr.toStringAsFixed(0)}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1.2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                            left: 12,
                            bottom: 12,
                          ),
                          child: SfCartesianChart(
                            zoomPanBehavior: zoomPanBehavior,
                            primaryXAxis: NumericAxis(
                              numberFormat: NumberFormat('#'),
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: 50,
                              maximum: 200,
                              interval: 30,
                              numberFormat: NumberFormat('#'),
                            ),
                            series: <ChartSeries>[
                              LineSeries<ChartData, double>(
                                dataSource: spots,
                                xValueMapper: (ChartData data, _) =>
                                    data.second,
                                yValueMapper: (ChartData data, _) => data.hr,
                                color: Colors.red,
                                width: 5,
                                markerSettings:
                                    const MarkerSettings(isVisible: false),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text('No HR report found.');
                }
              } else {
                return const CupertinoActivityIndicator(
                  radius: 16,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final double second;
  final double hr;

  ChartData(this.second, this.hr);
}
