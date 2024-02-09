import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityDetailView extends StatefulWidget {
  final SessionEntity session;
  const ActivityDetailView({super.key, required this.session});

  @override
  State<ActivityDetailView> createState() => _ActivityDetailViewState();
}

class _ActivityDetailViewState extends State<ActivityDetailView> {
  late ZoomPanBehavior _zoomPanBehavior;
  List<EcgChartModel> ecgChart = [];
  @override
  void initState() {
    _parseEcg();
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
      enablePinching: true,
      enableDoubleTapZooming: true,
      enablePanning: true,
    );
    super.initState();
  }

  void _parseEcg() async {
    final r = ReportModel.fromSession(widget.session);
    final ecg = r.reports?.firstWhere(
      (element) => element.type!.contains("ecg"),
    );
    log.f("ECG: $ecg");
    final ecgChart = await ecg?.generateEcgChart();
    setState(() {
      this.ecgChart = ecgChart ?? [];
    });
    log.f("ECG: ${ecgChart!.last.voltage}");
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(widget.session.exercise?.name ?? ''),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: Column(
        children: [
          ContainerWrapper(child: Text(widget.session.exercise?.name ?? '')),
          SfCartesianChart(
            zoomPanBehavior: _zoomPanBehavior,
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.ms(),
              interval: 1,
            ),
            series: <LineSeries<EcgChartModel, DateTime>>[
              LineSeries<EcgChartModel, DateTime>(
                dataSource: ecgChart,
                xValueMapper: (EcgChartModel data, _) => data.timeStamp,
                yValueMapper: (EcgChartModel data, _) => data.voltage,
              ),
            ],
          )
        ],
      ),
    );
  }
}
