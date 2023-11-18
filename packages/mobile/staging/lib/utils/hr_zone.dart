import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:lottie/lottie.dart';

enum HrZoneType { VERYLIGHT, LIGHT, MODERATE, HARD, MAXIMUM }

extension HrZoneTypeExt on HrZoneType {
  String get name {
    switch (this) {
      case HrZoneType.VERYLIGHT:
        return 'Very Light';
      case HrZoneType.LIGHT:
        return 'Light';
      case HrZoneType.MODERATE:
        return 'Moderate';
      case HrZoneType.HARD:
        return 'Hard';
      case HrZoneType.MAXIMUM:
        return 'Maximum';
      default:
        return 'Other';
    }
  }

  Color get color {
    switch (this) {
      case HrZoneType.VERYLIGHT:
        return Colors.green;
      case HrZoneType.LIGHT:
        return Colors.blue;
      case HrZoneType.MODERATE:
        return Colors.yellow;
      case HrZoneType.HARD:
        return Colors.orange;
      case HrZoneType.MAXIMUM:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  LottieBuilder get image {
    switch (this) {
      case HrZoneType.VERYLIGHT:
        return Lottie.asset(
          'assets/animations/very-light.json',
          width: 50,
          height: 50,
        );
      case HrZoneType.LIGHT:
        return Lottie.asset(
          'assets/animations/light.json',
          width: 50,
          height: 50,
        );

      case HrZoneType.MODERATE:
        return Lottie.asset(
          'assets/animations/moderate.json',
          width: 50,
          height: 50,
        );
      case HrZoneType.HARD:
        return Lottie.asset(
          'assets/animations/hard.json',
          width: 50,
          height: 50,
        );
      case HrZoneType.MAXIMUM:
        return Lottie.asset(
          'assets/animations/maximum.json',
          width: 50,
          height: 50,
        );
      default:
        return Lottie.asset(
          'assets/animations/very_light.json',
          width: 50,
          height: 50,
        );
    }
  }
}

class HrZoneutils {
  final store = Get.find<PreferencesService>();

  HrZoneType findZone(int nowHr) {
    final dob = store.user!.dateOfBirth;
    final age = DateTime.now().year - dob!.year;
    final maxHr = 208 - (0.7 * age);

    if (nowHr < maxHr * 0.5) {
      return HrZoneType.VERYLIGHT;
    } else if (nowHr < maxHr * 0.6) {
      return HrZoneType.LIGHT;
    } else if (nowHr < maxHr * 0.7) {
      return HrZoneType.MODERATE;
    } else if (nowHr < maxHr * 0.8) {
      return HrZoneType.HARD;
    } else {
      return HrZoneType.MAXIMUM;
    }
  }

  int findPercentage(int nowHr) {
    final dob = store.user!.dateOfBirth;
    final age = DateTime.now().year - dob!.year;
    final maxHr = 208 - (0.7 * age);

    return (nowHr / maxHr * 100).round();
  }
}
