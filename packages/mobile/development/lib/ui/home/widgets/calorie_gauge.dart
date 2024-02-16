import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/home/home.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CalorieGauge extends StatelessWidget {
  final HomeState hState;
  const CalorieGauge({super.key, required this.hState});

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      child: Column(
        children: [
          Row(
            children: [
              IconWrapper(
                icon: Icons.local_fire_department_rounded,
                color: Theme.of(context).extension<AppColors>()!.mauve!,
              ),
              SizedBox(width: Dimens.width8),
              Text(
                Strings.of(context)!.caloriesBurn,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(
            height: Dimens.height100,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  startAngle: 270,
                  endAngle: 270,
                  showLabels: false,
                  showTicks: false,
                  maximum: hState.user?.metricUnits?.energyUnits == "kcal"
                      ? 5000
                      : 20000,
                  pointers: [
                    RangePointer(
                      value: hState.calories,
                      color: Theme.of(context).extension<AppColors>()!.mauve!,
                      cornerStyle: CornerStyle.bothCurve,
                      enableAnimation: true,
                      animationDuration: 1000,
                    ),
                  ],
                  annotations: [
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${hState.calories.toInt()}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            hState.user?.metricUnits?.energyUnits ?? "kcal",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      angle: 90,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
