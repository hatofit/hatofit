import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
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
          boxShadow: const [
            BoxShadow(
              color: ColorPalette.purple20,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
          color: ColorPalette.black00,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Calories',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                IconWrapper(
                  icon: Icons.local_fire_department,
                  backgroundColor: ColorPalette.purple35,
                  iconColor: ColorPalette.purple,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                CustomText(
                  text: 'of daily goal ',
                  fontSize: 12,
                  color: ColorPalette.black50,
                ),
                CustomText(
                  text: '1980 Cal',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
                child: CustomText(
                  text: displayValue,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Positioned(
                bottom: (height * 0.3),
                child: const CustomText(
                  text: 'Cal',
                  fontSize: 14,
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
              ? ColorPalette.purple
              : ColorPalette.purple50,
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
