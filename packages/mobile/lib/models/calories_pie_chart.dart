import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class CaloriesPieChart extends StatelessWidget {
  final double value;

  const CaloriesPieChart({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayValue = value;
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: '${displayValue.toString()}%',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorPalette.black,
              ),
              const CustomText(
                text: 'Kcal',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: ColorPalette.black75,
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

class CaloriesPieScreen extends StatelessWidget {
  final double height;
  final double width;

  const CaloriesPieScreen({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: height * 0.6,
            width: width * 0.85,
            child: const CaloriesPieChart(
              value: 75,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 1,
                    height: height * 0.1,
                    decoration: const BoxDecoration(
                      color: ColorPalette.purple,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Eaten',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.black50,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/eaten.png',
                            height: 16,
                            width: 16,
                          ),
                          const CustomText(
                            text: '1000 Kcal',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.black50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 1,
                    height: height * 0.1,
                    decoration: const BoxDecoration(
                      color: ColorPalette.crimsonRed,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Burned',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.black50,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/burned.png',
                            height: 16,
                            width: 16,
                          ),
                          const CustomText(
                            text: '9999 Kcal',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.black50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
