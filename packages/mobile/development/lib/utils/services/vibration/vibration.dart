import 'package:vibration/vibration.dart';

mixin class VibratorMixin {
  Future<void> vibrateOnce() async {
    if (await Vibration.hasVibrator() == true) {
      if (await Vibration.hasAmplitudeControl() == true) {
        Vibration.vibrate(amplitude: 128);
      } else {
        Vibration.vibrate();
      }
    }
  }

  Future<void> vibrateTwice() async {
    if (await Vibration.hasVibrator() == true) {
      if (await Vibration.hasAmplitudeControl() == true) {
        Vibration.vibrate(pattern: [500, 1000, 500, 1000], amplitude: 128);
      } else {
        Vibration.vibrate(pattern: [500, 1000, 500, 1000]);
      }
    }
  }
}
