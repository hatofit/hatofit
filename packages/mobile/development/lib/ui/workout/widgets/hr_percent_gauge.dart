import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hatofit/core/core.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HrPercentGauge extends StatelessWidget {
  final int percent;
  final HrZoneType zoneType;
  const HrPercentGauge(
      {super.key, required this.percent, required this.zoneType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.height8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: zoneType.color.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: 149.h,
        child: Column(
          children: [
            Text(
              Strings.of(context)!.percentage,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            SizedBox(height: Dimens.height8),
            SizedBox(
              height: 118.h,
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
          ],
        ),
      ),
    );
  }
}
