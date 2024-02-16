import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

extension IntExtesion on int {
  String toStringMonth(BuildContext context) {
    switch (this) {
      case 1:
        return Strings.of(context)!.january;
      case 2:
        return Strings.of(context)!.february;
      case 3:
        return Strings.of(context)!.march;
      case 4:
        return Strings.of(context)!.april;
      case 5:
        return Strings.of(context)!.may;
      case 6:
        return Strings.of(context)!.june;
      case 7:
        return Strings.of(context)!.july;
      case 8:
        return Strings.of(context)!.august;
      case 9:
        return Strings.of(context)!.september;
      case 10:
        return Strings.of(context)!.october;
      case 11:
        return Strings.of(context)!.november;
      case 12:
        return Strings.of(context)!.december;
      default:
        return '';
    }
  }

  int hrPercent(int age) {
    final maxHr = 208 - (0.7 * age);
    return ((this / maxHr) * 100).round();
  }
}
