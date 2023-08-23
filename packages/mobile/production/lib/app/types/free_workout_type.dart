import 'package:lottie/lottie.dart';

enum FreeWorkoutType { walk, run, bike, swim }

extension TabItem on FreeWorkoutType {
  LottieBuilder get gifImage {
    switch (this) {
      case FreeWorkoutType.walk:
        return Lottie.asset(
          'assets/animations/walking.json',
        );
      case FreeWorkoutType.run:
        return Lottie.asset(
          'assets/animations/run.json',
        );
      case FreeWorkoutType.bike:
        return Lottie.asset(
          'assets/animations/run.json',
        );
      case FreeWorkoutType.swim:
        return Lottie.asset(
          'assets/animations/run.json',
        );
    }
  }

  String get title {
    switch (this) {
      case FreeWorkoutType.walk:
        return 'Walk';
      case FreeWorkoutType.run:
        return 'Run';
      case FreeWorkoutType.bike:
        return 'Bike';
      case FreeWorkoutType.swim:
        return 'Swim';
    }
  }
}
