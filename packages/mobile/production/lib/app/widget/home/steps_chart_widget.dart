import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';

class StepsChartWidget extends StatelessWidget {
  const StepsChartWidget({super.key});

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
                  const StepsLineChart(),
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
  const StepsLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
        ),
        child: LineChart(
          _createData(),
        ),
      ),
    );
  }

  LineChartData _createData() {
    final List<Color> lineColors = [
      ColorConstants.aqua,
      ColorConstants.ceruleanBlue
    ];
    final List<Color> gradientColors = [
      Colors.white,
      ColorConstants.ceruleanBlue
    ];

    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: lineColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
