import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

extension DoubleExtensions on double {
  String toBmiStatus(BuildContext context) {
    if (this < 18.5) {
      return Strings.of(context)!.underweight;
    } else if (this >= 18.5 && this < 25) {
      return Strings.of(context)!.normal;
    } else if (this >= 25 && this < 30) {
      return Strings.of(context)!.overweight;
    } else {
      return Strings.of(context)!.obese;
    }
  }

  Color toBmiColor(BuildContext context) {
    if (this < 18.5) {
      return Theme.of(context).extension<AppColors>()!.roseWater!;
    } else if (this >= 18.5 && this < 25) {
      return Theme.of(context).extension<AppColors>()!.sapphire!;
    } else if (this >= 25 && this < 30) {
      return Theme.of(context).extension<AppColors>()!.peach!;
    } else {
      return Theme.of(context).extension<AppColors>()!.maroon!;
    }
  }

  double hrPercentConvertion() {
    if (this < 50) {
      return this / 3;
    } else if (this < 60) {
      return this / 2.5;
    } else if (this < 70) {
      return this / 2;
    } else if (this < 80) {
      return this / 1.5;
    } else if (this < 90) {
      return this / 1.25;
    } else {
      return this;
    }
  }
}
