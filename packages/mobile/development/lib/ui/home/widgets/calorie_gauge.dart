import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/home/home.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CalorieGauge extends StatelessWidget {
  const CalorieGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
                      pointers: [
                        RangePointer(
                          value: state.calories,
                          width: Dimens.width16,
                          color:
                              Theme.of(context).extension<AppColors>()!.mauve!,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
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
                                '${state.calories.toInt()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                state.user?.metricUnits?.energyUnits ?? "kcal",
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
      },
    );
  }
}
