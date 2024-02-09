import 'package:flutter/material.dart';

enum HrZoneType { veryLight, light, moderate, hard, max }

extension HrZoneTypeExt on HrZoneType {
  String get name {
    switch (this) {
      case HrZoneType.veryLight:
        return 'Very Light';
      case HrZoneType.light:
        return 'Light';
      case HrZoneType.moderate:
        return 'Moderate';
      case HrZoneType.hard:
        return 'Hard';
      case HrZoneType.max:
        return 'Maximum';
      default:
        return 'Other';
    }
  }

  Color get color {
    switch (this) {
      case HrZoneType.veryLight:
        return Colors.blue;
      case HrZoneType.light:
        return Colors.green;
      case HrZoneType.moderate:
        return Colors.yellow;
      case HrZoneType.hard:
        return Colors.orange;
      case HrZoneType.max:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
