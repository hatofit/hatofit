import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/home/cubit/home_cubit.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HrBarChart extends StatelessWidget {
  const HrBarChart({super.key, required this.hrData});
  final List<HrBarChartItem> hrData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius15),
        color: context.isDarkMode ? Colors.grey[900] : Colors.grey[300],
      ),
      child: SfCartesianChart(
        series: [
          ColumnSeries<HrBarChartItem, String>(
            dataSource: hrData,
            xValueMapper: (HrBarChartItem hr, _) =>
                DateFormat('HH:mm').format(hr.date),
            yValueMapper: (HrBarChartItem hr, _) => hr.avgHr,
            color: Theme.of(context).extension<AppColors>()?.red!,
            width: 0.3,
            isTrackVisible: true,
            borderRadius: const BorderRadius.all(Radius.circular(66)),
          ),
        ],
        primaryYAxis: const NumericAxis(
          isVisible: false,
        ),
        borderWidth: 0,
        primaryXAxis: const CategoryAxis(
          isVisible: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
