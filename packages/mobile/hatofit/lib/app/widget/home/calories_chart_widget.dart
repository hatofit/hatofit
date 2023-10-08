import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/home/home_controller.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CaloriesChartWidget extends GetView<HomeController> {
  const CaloriesChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Container(
        height: height * 0.26,
        width: width * 0.45,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorConstants.darkContainer
              : ColorConstants.lightContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Burn',
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
              height: height * 0.2,
              child: GetBuilder(
                  init: controller,
                  builder: (_) {
                    return CaloriesPieChart(
                      value: controller.calories,
                      height: height * 0.64,
                    );
                  }),
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
    final store = Get.find<PreferencesService>();
    final displayValue = value.toStringAsFixed(0);
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                displayValue,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                store.user!.metricUnits!.energyUnits!,
                style: Theme.of(context).textTheme.bodyMedium,
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
              : const Color.fromARGB(255, 141, 101, 194),
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
