import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/workout/cubit/workout_cubit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HrZoneGauge extends StatelessWidget {
  final int percent;
  final HrZoneType zoneType;
  const HrZoneGauge({super.key, required this.percent, required this.zoneType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.height16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Container(
        height: Dimens.height128,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
                showLabels: false,
                showAxisLine: falses,
                showTicks: false,
                maximum: 99,
                radiusFactor: 0.8,
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 33,
                      color: const Color(0xFFFE2A25),
                      sizeUnit: GaugeSizeUnit.factor,
                      labelStyle:
                          GaugeTextStyle(fontFamily: 'Times', fontSize: 16),
                      startWidth: 0.65,
                      endWidth: 0.65),
                  GaugeRange(
                    startValue: 33,
                    endValue: 66,
                    color: const Color(0xFFFFBA00),
                    labelStyle:
                        GaugeTextStyle(fontFamily: 'Times', fontSize: 16),
                    startWidth: 0.65,
                    endWidth: 0.65,
                    sizeUnit: GaugeSizeUnit.factor,
                  ),
                  GaugeRange(
                    startValue: 66,
                    endValue: 99,
                    color: const Color(0xFF00AB47),
                    labelStyle:
                        GaugeTextStyle(fontFamily: 'Times', fontSize: 16),
                    sizeUnit: GaugeSizeUnit.factor,
                    startWidth: 0.65,
                    endWidth: 0.65,
                  ),
                  GaugeRange(
                    startValue: 66,
                    endValue: 99,
                    color: const Color(0xFF00AB47),
                    labelStyle:
                        GaugeTextStyle(fontFamily: 'Times', fontSize: 16),
                    sizeUnit: GaugeSizeUnit.factor,
                    startWidth: 0.65,
                    endWidth: 0.65,
                  ),
                  // Added small height range in bottom to show shadow effect.
                  GaugeRange(
                    startValue: 0,
                    endValue: 99,
                    color: const Color.fromRGBO(155, 155, 155, 0.3),
                    rangeOffset: 0.5,
                    sizeUnit: GaugeSizeUnit.factor,
                    startWidth: 0.15,
                    endWidth: 0.15,
                  ),
                ],
                pointers: const <GaugePointer>[
                  NeedlePointer(
                      value: 60,
                      needleLength: 0.7,
                      knobStyle: KnobStyle(
                        knobRadius: 12,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                      ))
                ])
          ],
        ),
      ),
    );
  }
}
