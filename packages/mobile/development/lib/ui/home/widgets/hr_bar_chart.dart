import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/home/cubit/home_cubit.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HrBarChart extends StatelessWidget {
  final HomeState hState;
  const HrBarChart({super.key, required this.hState});

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      child: Column(
        children: [
          Row(
            children: [
              IconWrapper(
                icon: Icons.show_chart_rounded,
                color: Theme.of(context).extension<AppColors>()!.red!,
              ),
              SizedBox(width: Dimens.width8),
              Text(
                Strings.of(context)!.activityTrends,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          hState.hrData.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(height: Dimens.height8),
                    Container(
                      // padding: EdgeInsets.all(Dimens.width4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.radius15),
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                      ),
                      child: SfCartesianChart(
                        title: ChartTitle(text: Strings.of(context)!.avgHR),
                        series: [
                          ColumnSeries<HrBarChartItem, String>(
                            dataSource: hState.hrData,
                            xValueMapper: (HrBarChartItem hr, _) =>
                                DateFormat.Hm().format(hr.date),
                            yValueMapper: (HrBarChartItem hr, _) => hr.avgHr,
                            color: Theme.of(context).primaryColor,
                            width: 0.3,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(66)),
                          ),
                        ],
                        primaryYAxis: const NumericAxis(
                            // isVisible: false,
                            ),
                        borderWidth: 0,
                        primaryXAxis: const CategoryAxis(
                          isVisible: true,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(Strings.of(context)!.noExerciseDataToday,
                      style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
