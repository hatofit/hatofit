part of 'workout_cubit.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState.loading() = _Loading;
  const factory WorkoutState.success(List<ExerciseEntity> exercises) = _Success;
  const factory WorkoutState.failure(Failure message) = _Failure;
  const factory WorkoutState.start({
    @Default(true) bool freeTraining,
    ExerciseEntity? exercise,
    UserEntity? user,
  }) = _Start;
  const factory WorkoutState.finish({
    @Default(true) bool freeTraining,
    ExerciseEntity? exercise,
    @Default(SessionEntity()) SessionEntity session,
  }) = _Finish;
}

class HrSample extends PolarHrSample {
//  add timestamp to the sample
  final DateTime timestamp;
  HrSample({
    required int hr,
    required this.timestamp,
    required List<int> rrsMs,
    required bool contactStatus,
    required bool contactStatusSupported,
  }) : super(
          hr: hr,
          rrsMs: rrsMs,
          contactStatus: contactStatus,
          contactStatusSupported: contactStatusSupported,
        );
}

class WorkoutSession {
  List<HrSample> hrSamples;
  final double avgHr;
  final int? maxHr;
  final int? minHr;
  final double calories;
  final Duration? duration;
  List<WSessionChart> hrChart;
  UserEntity? user;
  HrZoneType? hrZoneType;
  final int hrPecentage;

  WorkoutSession({
    required this.hrSamples,
    required this.hrChart,
    required this.avgHr,
    this.maxHr,
    this.minHr,
    required this.calories,
    this.duration,
    this.user,
    this.hrZoneType,
    required this.hrPecentage,
  });
}

class WSessionChart {
  final DateTime time;
  final int hr;

  WSessionChart(this.time, this.hr);
}

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
}
