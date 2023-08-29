import 'package:flutter/material.dart';
import 'package:hatofit/app/modules/home/home_controller.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion Charts package

class HrLinesChart extends StatelessWidget {
  const HrLinesChart({Key? key, required this.hrData}) : super(key: key);
  final List<HrWidgetChart> hrData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color.fromARGB(255, 63, 62, 62),
      ),
      child: SfCartesianChart(
        series: <ChartSeries>[
          ColumnSeries<HrWidgetChart, String>(
            dataSource: hrData,
            xValueMapper: (HrWidgetChart hr, _) =>
                DateFormat('HH:mm').format(hr.date),
            yValueMapper: (HrWidgetChart hr, _) => hr.avgHr,
            color: ColorConstants.crimsonRed,
            width: 0.5,
            isTrackVisible: true,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ],
        primaryYAxis: NumericAxis(
          isVisible: false,
        ),
        borderWidth: 0,
        primaryXAxis: CategoryAxis(
          isVisible: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
