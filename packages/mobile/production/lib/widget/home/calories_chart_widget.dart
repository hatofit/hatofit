import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';

import 'package:polar_hr_devices/widget/icon_wrapper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CaloriesChartWidget extends StatelessWidget {
  final double width;
  final double height;
  const CaloriesChartWidget(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
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
                  'Calories',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                IconWrapper(
                  icon: Icons.local_fire_department,
                  backgroundColor: ColorConstants.purple.withOpacity(0.35),
                  iconColor: ColorConstants.purple,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.64,
              child: CaloriesPieChart(
                value: 555,
                height: height * 0.64,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'of daily goal ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '1980 Cal',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ));
  }
}

class CaloriesPieChart extends StatelessWidget {
  final double value;
  final double height;

  const CaloriesPieChart({Key? key, required this.value, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayValue = value.toStringAsFixed(0);
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: (height * 0.3),
                child: Text(
                  displayValue,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Positioned(
                bottom: (height * 0.3),
                child: Text(
                  'Cal',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          yValueMapper: (data, _) => data.y,
          xValueMapper: (data, _) => data.x,
          dataSource: [
            ChartData('Remaining', value),
            ChartData('Eaten', 100 - value),
          ],
          cornerStyle: CornerStyle.bothCurve,
          radius: '100%',
          innerRadius: '80%',
          startAngle: 360,
          endAngle: 360,
          pointColorMapper: (ChartData data, _) => data.x == 'Remaining'
              ? ColorConstants.purple
              : ColorConstants.purple.withOpacity(0.5),
          enableTooltip: false,
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
