import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

class StepsChartWidget extends StatelessWidget {
  final double width;
  final double height;
  const StepsChartWidget(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorPalette.ceruleanBlue20,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
          color: ColorPalette.black00,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Steps',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                IconWrapper(
                  icon: FontAwesomeIcons.ruler,
                  backgroundColor: ColorPalette.ceruleanBlue35,
                  iconColor: ColorPalette.ceruleanBlue,
                ),
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  StepsLineChart(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          CustomText(
                            text: '700',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                          CustomText(
                            text: ' steps',
                            fontSize: 14,
                          ),
                        ],
                      ),
                      CustomText(
                        text: ' / ',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          CustomText(
                            text: '6',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                          CustomText(
                            text: ' km',
                            fontSize: 14,
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
      ColorPalette.aqua,
      ColorPalette.ceruleanBlue
    ];
    final List<Color> gradientColors = [
      ColorPalette.black00,
      ColorPalette.ceruleanBlue
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
