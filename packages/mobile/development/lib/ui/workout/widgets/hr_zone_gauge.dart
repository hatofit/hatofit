import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hatofit/core/core.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HrZoneGauge extends StatelessWidget {
  final int percent;
  final HrZoneType zoneType;
  const HrZoneGauge({super.key, required this.percent, required this.zoneType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.height8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: zoneType.color.withOpacity(0.5),
        ),
      ),
      child: SizedBox(
        height: 149.h,
        child: Column(
          children: [
            Text(
              Strings.of(context)!.zone,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            SizedBox(
              height: 104.h,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      maximum: 100,
                      canScaleToFit: true,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 48,
                            color: HrZoneType.veryLight.color,
                            sizeUnit: GaugeSizeUnit.factor,
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 16),
                            startWidth: 0.65,
                            endWidth: 0.65),
                        GaugeRange(
                          startValue: 48,
                          endValue: 60,
                          color: HrZoneType.light.color,
                          labelStyle: const GaugeTextStyle(
                              fontFamily: 'Times', fontSize: 16),
                          startWidth: 0.65,
                          endWidth: 0.65,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        GaugeRange(
                          startValue: 60,
                          endValue: 71,
                          color: HrZoneType.moderate.color,
                          labelStyle: const GaugeTextStyle(
                              fontFamily: 'Times', fontSize: 16),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                        GaugeRange(
                          startValue: 71,
                          endValue: 80,
                          color: HrZoneType.hard.color,
                          labelStyle: const GaugeTextStyle(
                              fontFamily: 'Times', fontSize: 16),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                        GaugeRange(
                          startValue: 80,
                          endValue: 100,
                          color: HrZoneType.max.color,
                          labelStyle: const GaugeTextStyle(
                              fontFamily: 'Times', fontSize: 16),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                        GaugeRange(
                          startValue: 0,
                          endValue: 100,
                          color: const Color.fromRGBO(155, 155, 155, 0.3),
                          rangeOffset: 0.5,
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.15,
                          endWidth: 0.15,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: percent.toDouble(),
                          needleLength: 0.7,
                          knobStyle: const KnobStyle(
                            knobRadius: 12,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                          ),
                        )
                      ])
                ],
              ),
            ),
            Text(
              zoneType.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
