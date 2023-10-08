import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StepsChartWidget extends StatefulWidget {
  const StepsChartWidget({super.key});

  @override
  State<StepsChartWidget> createState() => _StepsChartWidgetState();
}

class _StepsChartWidgetState extends State<StepsChartWidget> {
  static final types = [
    HealthDataType.HEART_RATE,
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.STEPS, 
    HealthDataType.SLEEP_ASLEEP,
  ];
  List<HealthDataPoint> _healthDataList = [];
  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  Future fetchData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));
    _healthDataList.clear();

    try {
      // fetch health data
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);
      // save all the new data points (only the first 100)
      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (error) {
      print("Exception in getHealthDataFromTypes: $error");
    }

    // filter out duplicates
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList); 
    for (var x in _healthDataList) {
      print(x);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.45;
    final height = MediaQuery.of(context).size.height * 0.23;
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorConstants.darkContainer
              : ColorConstants.lightContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                IconWrapper(
                  icon: FontAwesomeIcons.ruler,
                  backgroundColor:
                      ColorConstants.ceruleanBlue.withOpacity(0.35),
                  iconColor: ColorConstants.ceruleanBlue,
                ),
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  StepsLineChart( 
                    data: _healthDataList
                        .where((x) => x.typeString == 'STEPS')
                        .map((x) => StepsData(
                            x.dateFrom, int.parse(x.value.toString())))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '700',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            ' steps',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        ' / ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '6',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            ' km',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class StepsLineChart extends StatelessWidget {
  final List<StepsData> data;
  const StepsLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMMd(),
              intervalType: DateTimeIntervalType.days,
              interval: 1,
              majorGridLines: const MajorGridLines(width: 0),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            primaryYAxis: NumericAxis(
              isVisible: false,
              majorGridLines: const MajorGridLines(width: 0),
            ),
            series: <ChartSeries>[
              LineSeries<StepsData, DateTime>(
                dataSource: data,
                xValueMapper: (StepsData sales, _) => sales.time,
                yValueMapper: (StepsData sales, _) => sales.steps,
                color: ColorConstants.ceruleanBlue,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelAlignment: ChartDataLabelAlignment.top,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class StepsData {
  final DateTime time;
  final int steps;
  StepsData(this.time, this.steps);
}
