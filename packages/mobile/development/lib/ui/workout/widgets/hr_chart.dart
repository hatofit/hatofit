import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HrChart extends StatelessWidget {
  final WorkoutSession session;
  const HrChart({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.Hms(),
                // hide the gridlines
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 200,
              ),
              series: <AreaSeries<WSessionChart, DateTime>>[
                AreaSeries<WSessionChart, DateTime>(
                  dataSource: session.hrChart,
                  xValueMapper: (WSessionChart hr, _) => hr.time,
                  yValueMapper: (WSessionChart hr, _) => hr.hr,
                  color: Theme.of(context).extension<AppColors>()!.mauve!,
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ContainerWrapper(
                    width: null,
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      width: 1,
                    ),
                    color: Theme.of(context)
                        .extension<AppColors>()!
                        .subtitle!
                        .withOpacity(0.2),
                    child: Column(
                      children: [
                        Text("avg.",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(session.avgHr.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    )),
              ),
              SizedBox(width: Dimens.width8),
              Expanded(
                child: ContainerWrapper(
                    width: null,
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      width: 1,
                    ),
                    color: Theme.of(context)
                        .extension<AppColors>()!
                        .subtitle!
                        .withOpacity(0.2),
                    child: Column(
                      children: [
                        Text("min.",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(session.minHr.toString(),
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    )),
              ),
              SizedBox(width: Dimens.width8),
              Expanded(
                child: ContainerWrapper(
                    width: null,
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      width: 1,
                    ),
                    color: Theme.of(context)
                        .extension<AppColors>()!
                        .subtitle!
                        .withOpacity(0.2),
                    child: Column(
                      children: [
                        Text("max.",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(session.maxHr.toString(),
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
