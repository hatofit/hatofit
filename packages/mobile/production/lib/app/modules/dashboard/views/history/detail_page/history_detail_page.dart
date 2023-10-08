import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/report_model.dart';
import 'package:hatofit/app/modules/dashboard/views/history/detail_page/history_detail_controller.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryDetailPage extends GetView<HistoryDetailController> {
  final String exerciseId;
  const HistoryDetailPage(this.exerciseId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Center(
          child: FutureBuilder(
            future: InternetService().fetchReport(exerciseId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final data = ReportModel.fromJson(snapshot.data!['report']);
                final hrReport =
                    data.reports.firstWhere((element) => element.type == 'hr');

                if (hrReport.data.isNotEmpty) {
                  return ListView(
                    children: [
                      if (data.reports
                          .any((element) => element.type == 'hr')) ...{
                        _buildHr(
                            data.reports
                                .firstWhere((element) => element.type == 'hr'),
                            context)
                      },
                      if (data.reports
                          .any((element) => element.type == 'acc')) ...{
                        _buildAcc(
                            data.reports
                                .firstWhere((element) => element.type == 'acc'),
                            context)
                      }
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

  Widget buildContainer(String title, String value, BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorConstants.darkContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildHr(ReportData hrReport, BuildContext context) {
    final store = Get.find<PreferencesService>();
    if (hrReport.data.isNotEmpty) {
      final dob = store.user!.dateOfBirth;
      final age = DateTime.now().year - dob!.year;
      final hrData = hrReport.data;
      final valueList = hrData.first.value;
      final spots = valueList.map((value) {
        final ts = value[0].toDouble();
        final hr = value[1].toDouble();
        return ChartData(ts, hr);
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

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer(
                        'Avg HR', averageHr.toStringAsFixed(0), context),
                    buildContainer('Max HR', maxHr.toStringAsFixed(0), context),
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
                zoomPanBehavior: controller.zoomPanBehavior,
                primaryXAxis: NumericAxis(
                  numberFormat: NumberFormat('#'),
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 220 - age.toDouble(),
                  interval: 30,
                  numberFormat: NumberFormat('#'),
                ),
                series: <ChartSeries>[
                  LineSeries<ChartData, double>(
                    dataSource: spots,
                    xValueMapper: (ChartData data, _) => data.second,
                    yValueMapper: (ChartData data, _) => data.hr,
                    color: Colors.red,
                    width: 5,
                    markerSettings: const MarkerSettings(isVisible: false),
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
  }

  Widget _buildAcc(ReportData accReport, BuildContext context) {
    if (accReport.data.isNotEmpty) {
      final accData = accReport.data;
      final valueList = accData.first.value;
      final spots = valueList.map((value) {
        final ts = value[0].toDouble();
        final x = value[1].toDouble();
        final y = value[2].toDouble();
        final z = value[3].toDouble();
        return AccData(ts, x, y, z);
      }).toList();
      final avgAccX = valueList
              .map((value) => value[1].toDouble())
              .reduce((a, b) => a + b) /
          valueList.length;
      final avgAccY = valueList
              .map((value) => value[2].toDouble())
              .reduce((a, b) => a + b) /
          valueList.length;
      final avgAccZ = valueList
              .map((value) => value[3].toDouble())
              .reduce((a, b) => a + b) /
          valueList.length;
      final maxAccX = valueList
          .map((value) => value[1].toDouble())
          .reduce((a, b) => a > b ? a : b);
      final maxAccY = valueList
          .map((value) => value[2].toDouble())
          .reduce((a, b) => a > b ? a : b);
      final maxAccZ = valueList
          .map((value) => value[3].toDouble())
          .reduce((a, b) => a > b ? a : b);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer(
                        'Avg X', avgAccX.toStringAsFixed(2), context),
                    buildContainer(
                        'Avg Y', avgAccY.toStringAsFixed(2), context),
                    buildContainer(
                        'Avg Z', avgAccZ.toStringAsFixed(2), context),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer(
                        'Max X', maxAccX.toStringAsFixed(2), context),
                    buildContainer(
                        'Max Y', maxAccY.toStringAsFixed(2), context),
                    buildContainer(
                        'Max Z', maxAccZ.toStringAsFixed(2), context),
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
                zoomPanBehavior: controller.zoomPanBehavior,
                primaryXAxis: NumericAxis(
                  numberFormat: NumberFormat('#'),
                ),
                primaryYAxis: NumericAxis(
                  numberFormat: NumberFormat('#'),
                ),
                series: <ChartSeries>[
                  LineSeries<AccData, double>(
                    dataSource: spots,
                    xValueMapper: (AccData data, _) => data.second,
                    yValueMapper: (AccData data, _) => data.x,
                    color: Colors.red,
                    width: 5,
                    markerSettings: const MarkerSettings(isVisible: false),
                  ),
                  LineSeries<AccData, double>(
                    dataSource: spots,
                    xValueMapper: (AccData data, _) => data.second,
                    yValueMapper: (AccData data, _) => data.y,
                    color: Colors.green,
                    width: 5,
                    markerSettings: const MarkerSettings(isVisible: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return const Text('No HR report found.');
    }
  }
}

class ChartData {
  final double second;
  final double hr;

  ChartData(this.second, this.hr);
}

class AccData {
  final double second;
  final double x;
  final double y;
  final double z;

  AccData(this.second, this.x, this.y, this.z);
}
