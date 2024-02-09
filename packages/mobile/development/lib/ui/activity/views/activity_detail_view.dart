import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityDetailView extends StatelessWidget {
  final SessionEntity session;
  const ActivityDetailView({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final r = ReportModel.fromSession(session);
    final ecg = r.reports?.firstWhere(
      (element) =>
          element.type!.contains("ecg") || element.type!.contains("ECG"),
    );
    log.f("ECG: $ecg");
    final ecgChart = ecg?.generateEcgChart();
    log.f("ECG: ${ecgChart!.last.voltage}");
    return Parent(
      appBar: AppBar(
        title: Text(session.exercise?.name ?? ''),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: Column(
        children: [
          ContainerWrapper(child: Text(session.exercise?.name ?? '')),
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              // date format that show hour, minute, second, millisecond, and microsecond
              // dateFormat: DateFormat("HH:mm:ss:SSS:u"),
              // majorGridLines: MajorGridLines(width: 0),
              dateFormat: DateFormat.ms(),
              interval: 1,
            ),
            series: <LineSeries<EcgChartModel, DateTime>>[
              LineSeries<EcgChartModel, DateTime>(
                dataSource: ecgChart,
                xValueMapper: (EcgChartModel data, _) =>
                    DateTime.fromMicrosecondsSinceEpoch(data.timestamp),
                yValueMapper: (EcgChartModel data, _) => data.voltage,
              ),
            ],
          )
        ],
      ),
    );
  }
}
