import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/report_model.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/utils/mood_utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryDetailPage extends StatefulWidget {
  final String exerciseId;
  const HistoryDetailPage(this.exerciseId, {Key? key}) : super(key: key);

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  final argument = Get.arguments;
  final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
    enablePinching: true,
    enableDoubleTapZooming: true,
    zoomMode: ZoomMode.xy,
    enablePanning: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Report',
            style: Theme.of(context).textTheme.displaySmall),
      ),
      body: FutureBuilder(
        future: InternetService().fetchReport(widget.exerciseId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final data = ReportModel.fromJson(snapshot.data!['report']);
            final hrReport =
                data.reports.firstWhere((element) => element.type == 'hr');
            final duration =
                Duration(microseconds: data.endTime - data.startTime);
            if (hrReport.data.isNotEmpty) {
              return ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? ColorConstants.darkContainer
                          : ColorConstants.lightContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Name: ${snapshot.data!['exercise']['name']}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? ColorConstants.darkContainer
                          : ColorConstants.lightContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        'Date: ${DateFormat('d MMMM yyyy').format(DateTime.fromMicrosecondsSinceEpoch(data.startTime))}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? ColorConstants.darkContainer
                          : ColorConstants.lightContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        // Corrected here
                        'Duration: ${duration.inHours}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  snapshot.data!['mood'] == null
                      ? const SizedBox()
                      : Container(
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? ColorConstants.darkContainer
                                : ColorConstants.lightContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                              // Corrected here
                              'Mood: ${MoodUtils.message(snapshot.data!['mood'])}',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (data.reports.any((element) => element.type == 'hr')) ...{
                    Container(
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildHr(
                          data.reports
                              .firstWhere((element) => element.type == 'hr'),
                          context),
                    )
                  },
                  const SizedBox(
                    height: 16,
                  ),
                  if (data.reports.any((element) => element.type == 'acc')) ...{
                    Container(
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildAcc(
                          data.reports
                              .firstWhere((element) => element.type == 'acc'),
                          context),
                    )
                  }
                ],
              );
            } else {
              return const Text('No HR report found.');
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildContainer(
    String title,
    String value,
    BuildContext context,
  ) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title == ''
              ? const SizedBox()
              : Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
          value == ''
              ? const SizedBox()
              : Text(
                  value,
                  style: Theme.of(context).textTheme.displaySmall,
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
      final averageHr = valueList
              .map((value) => value[1].toDouble())
              .reduce((a, b) => a + b) /
          valueList.length;
      final maxHr = valueList
          .map((value) => value[1].toDouble())
          .reduce((a, b) => a > b ? a : b);

      final minHr = valueList
          .map((value) => value[1].toDouble())
          .reduce((a, b) => a < b ? a : b);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
            child: Column(
              children: [
                Text('Heart Rate',
                    style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recap :',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer(
                        'Avg', averageHr.toStringAsFixed(0), context),
                    buildContainer('Min', minHr.toStringAsFixed(0), context),
                    buildContainer('Max', maxHr.toStringAsFixed(0), context),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Data :',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
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
                zoomPanBehavior: _zoomPanBehavior,
                primaryXAxis: NumericAxis(
                  numberFormat: NumberFormat('#'),
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 208 - (0.7 * age),
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
      final minAccX = valueList
          .map((value) => value[1].toDouble())
          .reduce((a, b) => a < b ? a : b);
      final minAccY = valueList
          .map((value) => value[2].toDouble())
          .reduce((a, b) => a < b ? a : b);
      final minAccZ = valueList
          .map((value) => value[3].toDouble())
          .reduce((a, b) => a < b ? a : b);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
            child: Column(
              children: [
                Text('Accelerometer',
                    style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recap :',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? Colors.grey[900]
                            : Colors.grey[300],
                      ),
                      child: const Text('Avg'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? Colors.grey[900]
                            : Colors.grey[300],
                      ),
                      child: const Text('Min'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? Colors.grey[900]
                            : Colors.grey[300],
                      ),
                      child: const Text('Max'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? Colors.grey[900]
                            : Colors.grey[300],
                      ),
                      child: const Text('X'),
                    ),
                    buildContainer('', avgAccX.toStringAsFixed(0), context),
                    buildContainer('', minAccX.toStringAsFixed(0), context),
                    buildContainer('', maxAccX.toStringAsFixed(0), context),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? Colors.grey[900]
                            : Colors.grey[300],
                      ),
                      child: const Text('Y'),
                    ),
                    buildContainer('', avgAccY.toStringAsFixed(0), context),
                    buildContainer('', minAccY.toStringAsFixed(0), context),
                    buildContainer('', maxAccY.toStringAsFixed(0), context),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.isDarkMode
                            ? Colors.grey[900]
                            : Colors.grey[300],
                      ),
                      child: const Text('Z'),
                    ),
                    buildContainer('', avgAccZ.toStringAsFixed(0), context),
                    buildContainer('', minAccZ.toStringAsFixed(0), context),
                    buildContainer('', maxAccZ.toStringAsFixed(0), context),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Data :',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
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
                zoomPanBehavior: _zoomPanBehavior,
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
