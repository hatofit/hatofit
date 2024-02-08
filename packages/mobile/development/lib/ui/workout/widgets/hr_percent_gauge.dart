import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/workout/cubit/workout_cubit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HrPercentGauge extends StatelessWidget {
  final int percent;
  final HrZoneType zoneType;
  const HrPercentGauge(
      {super.key, required this.percent, required this.zoneType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.height16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: zoneType.color.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Container(
        height: Dimens.height128,
        child: SfRadialGauge(
          axes: [
            RadialAxis(
              startAngle: 270,
              endAngle: 270,
              showLabels: false,
              showTicks: false,
              pointers: [
                RangePointer(
                  value: percent.toDouble(),
                  color: zoneType.color,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 1000,
                ),
              ],
              annotations: [
                GaugeAnnotation(
                  widget: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${percent.toInt()} %',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          'of max HR',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  angle: 90,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
