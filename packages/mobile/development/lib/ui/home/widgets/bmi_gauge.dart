import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/home/home.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIGauge extends StatelessWidget {
  final HomeState hState;
  const BMIGauge({super.key, required this.hState});

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      child: Column(
        children: [
          Row(
            children: [
              IconWrapper(
                icon: Icons.monitor_weight_rounded,
                color: Theme.of(context).extension<AppColors>()!.green!,
              ),
              SizedBox(width: Dimens.width8),
              Text(
                Constants.get.bmi,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: Dimens.height8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hState.bmi.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                padding: EdgeInsets.all(Dimens.width4),
                decoration: BoxDecoration(
                  color: hState.bmi.toBmiColor(context).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(Dimens.width8),
                ),
                child: Text(
                  hState.bmi.toBmiStatus(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimens.height16),
          SfLinearGauge(
            minimum: 16,
            maximum: 39,
            interval: 8,
            labelOffset: Dimens.height8,
            showTicks: false,
            axisTrackStyle: LinearAxisTrackStyle(
                thickness: Dimens.height12,
                edgeStyle: LinearEdgeStyle.bothCurve,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).extension<AppColors>()!.roseWater!,
                    Theme.of(context).extension<AppColors>()!.sapphire!,
                    Theme.of(context).extension<AppColors>()!.peach!,
                    Theme.of(context).extension<AppColors>()!.maroon!,
                  ],
                )),
            markerPointers: [
              LinearShapePointer(
                value: hState.bmi,
                color: Palette.primary,
                shapeType: LinearShapePointerType.circle,
                borderWidth: 3,
                borderColor: Colors.black,
                offset: Dimens.height4,
              )
            ],
          )
        ],
      ),
    );
  }
}
