import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/models/report/report_model.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MetaHrWidget extends StatefulWidget {
  final MetaHr? metaHr;
  final List<HrChartModel> hrChart;
  const MetaHrWidget({super.key, this.metaHr, required this.hrChart});

  @override
  State<MetaHrWidget> createState() => _MetaHrWidgetState();
}

class _MetaHrWidgetState extends State<MetaHrWidget> {
  late ZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      enablePanning: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    final cardColor = thm.extension<AppColors>()!.subtitle!.withOpacity(0.5);
    return widget.metaHr == null
        ? const SizedBox()
        : ContainerWrapper(
            margin: EdgeInsets.only(
                left: Dimens.width8,
                right: Dimens.width8,
                bottom: Dimens.width8),
            child: Column(
              children: [
                Row(
                  children: [
                    IconWrapper(
                      icon: Icons.favorite,
                      color: thm.primaryColor,
                    ),
                    SizedBox(width: Dimens.width8),
                    Text(Strings.of(context)!.heartRate,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                SizedBox(height: Dimens.height8),
                Row(
                  children: [
                    Expanded(
                      child: ContainerWrapper(
                        color: cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("avg."),
                            Text('${widget.metaHr!.avg} bpm'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Dimens.width8),
                    Expanded(
                      child: ContainerWrapper(
                        color: cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("min."),
                            Text('${widget.metaHr!.min} bpm'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Dimens.width8),
                    Expanded(
                      child: ContainerWrapper(
                        color: cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("max."),
                            Text('${widget.metaHr!.max} bpm'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimens.height8),
                widget.hrChart.isNotEmpty
                    ? SfCartesianChart(
                        zoomPanBehavior: _zoomPanBehavior,
                        primaryXAxis: DateTimeAxis(
                          dateFormat: DateFormat.ms(),
                          interval: 1,
                        ),
                        primaryYAxis: const NumericAxis(
                          minimum: 0,
                          maximum: 220,
                          interval: 20,
                        ),
                        series: <LineSeries<HrChartModel, DateTime>>[
                          LineSeries<HrChartModel, DateTime>(
                            color: thm.primaryColor,
                            dataSource: widget.hrChart,
                            xValueMapper: (HrChartModel data, _) =>
                                data.timeStamp,
                            yValueMapper: (HrChartModel data, _) => data.hr,
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          );
  }
}
