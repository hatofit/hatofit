import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/charts/hr_widget.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion Charts package

class HrLinesChart extends StatelessWidget {
  const HrLinesChart({Key? key, required this.hrData}) : super(key: key);
  final RxList<HrWidgetChart> hrData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[300],
      ),
      child: SfCartesianChart(
        series: <ChartSeries>[
          ColumnSeries<HrWidgetChart, String>(
            dataSource: hrData,
            xValueMapper: (HrWidgetChart hr, _) =>
                DateFormat('HH:mm').format(hr.date),
            yValueMapper: (HrWidgetChart hr, _) => hr.avgHr,
            color: ColorConstants.crimsonRed,
            width: 0.3,
            isTrackVisible: true,
            borderRadius: const BorderRadius.all(Radius.circular(66)),
          ),
        ],
        primaryYAxis: NumericAxis(
          isVisible: false,
        ),
        borderWidth: 0,
        primaryXAxis: CategoryAxis(
          isVisible: true,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
