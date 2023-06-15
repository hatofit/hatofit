import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RoundedBottleWidget extends StatelessWidget {
  const RoundedBottleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WaterData> chartData = [WaterData(1, 100, 50)];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
        minimum: 0,
        maximum: 100,
      ),
      margin: EdgeInsets.zero,
      enableSideBySideSeriesPlacement: false,
      series: <ChartSeries<WaterData, double>>[
        ColumnSeries<WaterData, double>(
          color: ColorPalette.ceruleanBlue50,
          borderRadius: BorderRadius.circular(120),
          dataSource: chartData,
          xValueMapper: (WaterData xList, _) => xList.noList,
          yValueMapper: (WaterData xList, _) => xList.xList,
          width: 1,
        ),
        ColumnSeries<WaterData, double>(
          color: ColorPalette.ceruleanBlue,
          borderRadius: BorderRadius.circular(120),
          dataSource: chartData,
          xValueMapper: (WaterData xList, _) => xList.noList,
          yValueMapper: (WaterData xList, _) => xList.yList,
          width: 1,
        ),
      ],
    );
  }
}

class WaterData {
  WaterData(this.noList, this.xList, this.yList);
  final double noList;
  final double xList;
  final double yList;
}

class WaterBottleScreen extends StatelessWidget {
  final double height;
  final double width;

  const WaterBottleScreen({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomText(
                    text: '2000',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: 'ml',
                    fontSize: 12,
                  ),
                ],
              ),
              CustomText(text: 'of daily goal 3.5L', fontSize: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorPalette.black00,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            FontAwesomeIcons.plus,
                            size: 18,
                            color: ColorPalette.royalBlue,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorPalette.black00,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            FontAwesomeIcons.minus,
                            size: 18,
                            color: ColorPalette.royalBlue,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              SizedBox(
                height: height * 0.5,
                width: width * 0.23,
                child: const RoundedBottleWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
