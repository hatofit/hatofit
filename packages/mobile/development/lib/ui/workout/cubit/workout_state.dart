part of 'workout_cubit.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState.loading() = _Loading;
  const factory WorkoutState.success(List<ExerciseEntity> exercises) = _Success;
  const factory WorkoutState.failure(Failure message) = _Failure;
  // const factory WorkoutState.start({
  //   @Default(true) bool freeTraining,
  //   ExerciseEntity? exercise,
  //   UserEntity? user,
  // }) = _Start;
}

class HrSample extends PolarHrSample {
  final DateTime timeStamp;
  final int second;
  HrSample({
    required this.timeStamp,
    required this.second,
    required int hr,
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

class EcgSample extends PolarEcgSample {
  final int second;
  EcgSample({
    required this.second,
    required DateTime timeStamp,
    required int voltage,
  }) : super(
          timeStamp: timeStamp,
          voltage: voltage,
        );
}

class AccSample extends PolarAccSample {
  final int second;
  AccSample({
    required this.second,
    required DateTime timeStamp,
    required int x,
    required int y,
    required int z,
  }) : super(
          timeStamp: timeStamp,
          x: x,
          y: y,
          z: z,
        );
}

class GyroSample extends PolarGyroSample {
  final int second;
  GyroSample({
    required this.second,
    required DateTime timeStamp,
    required double x,
    required double y,
    required double z,
  }) : super(
          timeStamp: timeStamp,
          x: x,
          y: y,
          z: z,
        );
}

class MagnetometerSample extends PolarMagnetometerSample {
  final int second;
  MagnetometerSample({
    required this.second,
    required DateTime timeStamp,
    required double x,
    required double y,
    required double z,
  }) : super(
          timeStamp: timeStamp,
          x: x,
          y: y,
          z: z,
        );
}

class PpgSample extends PolarPpgSample {
  final int second;
  PpgSample({
    required this.second,
    required DateTime timeStamp,
    required List<int> channelSamples,
  }) : super(
          timeStamp: timeStamp,
          channelSamples: channelSamples,
        );
}

class WorkoutSession {
  List<HrSample>? hrSamples;
  List<EcgSample>? ecgSamples;
  List<AccSample>? accSamples;
  List<GyroSample>? gyroSamples;
  List<MagnetometerSample>? magnetometerSamples;
  List<PpgSample>? ppgSamples;
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
    this.hrSamples,
    this.ecgSamples,
    this.accSamples,
    this.gyroSamples,
    this.magnetometerSamples,
    this.ppgSamples,
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

  WorkoutSession copyWith({
    List<HrSample>? hrSamples,
    List<EcgSample>? ecgSamples,
    List<AccSample>? accSamples,
    List<GyroSample>? gyroSamples,
    List<MagnetometerSample>? magnetometerSamples,
    List<PpgSample>? ppgSamples,
    double? avgHr,
    int? maxHr,
    int? minHr,
    double? calories,
    Duration? duration,
    List<WSessionChart>? hrChart,
    UserEntity? user,
    HrZoneType? hrZoneType,
    int? hrPecentage,
  }) {
    return WorkoutSession(
      hrSamples: hrSamples ?? this.hrSamples,
      ecgSamples: ecgSamples ?? this.ecgSamples,
      accSamples: accSamples ?? this.accSamples,
      gyroSamples: gyroSamples ?? this.gyroSamples,
      magnetometerSamples: magnetometerSamples ?? this.magnetometerSamples,
      ppgSamples: ppgSamples ?? this.ppgSamples,
      avgHr: avgHr ?? this.avgHr,
      maxHr: maxHr ?? this.maxHr,
      minHr: minHr ?? this.minHr,
      calories: calories ?? this.calories,
      duration: duration ?? this.duration,
      hrChart: hrChart ?? this.hrChart,
      user: user ?? this.user,
      hrZoneType: hrZoneType ?? this.hrZoneType,
      hrPecentage: hrPecentage ?? this.hrPecentage,
    );
  }

  Future<CreateSessionParams> createParams(UserEntity user,
      ExerciseEntity exercise, String mood, BleEntity ble) async {
    final Tuple7<
        List<HrSample>,
        List<EcgSample>,
        List<AccSample>,
        List<GyroSample>,
        List<MagnetometerSample>,
        List<PpgSample>,
        BleEntity> dataSamples = Tuple7(
      hrSamples ?? [],
      ecgSamples ?? [],
      accSamples ?? [],
      gyroSamples ?? [],
      magnetometerSamples ?? [],
      ppgSamples ?? [],
      ble,
    );
    final parser = ModelToEntityIsolateParser(dataSamples, (data) {
      Tuple7<List<HrSample>, List<EcgSample>, List<AccSample>, List<GyroSample>,
              List<MagnetometerSample>, List<PpgSample>, BleEntity> samples =
          data as Tuple7<
              List<HrSample>,
              List<EcgSample>,
              List<AccSample>,
              List<GyroSample>,
              List<MagnetometerSample>,
              List<PpgSample>,
              BleEntity>;
      List<SessionDataItemParams> hrBased = [];
      final identifier = samples.value7.polarId ?? samples.value7.address;

      for (var hr in samples.value1) {
        final List<SessionDataItemDeviceParams> devices = [];
        devices.add(
          SessionDataItemDeviceParams(
            type: ble.name.contains("Polar")
                ? 'PolarDataType.hr'
                : "CommonDataType.hr",
            identifier: identifier,
            value: [
              {
                'timeStamp': hr.timeStamp.microsecondsSinceEpoch,
                'hr': hr.hr,
                'rrsMs': hr.rrsMs,
              },
            ],
          ),
        );
        for (var ecg in samples.value2) {
          if (hr.second == ecg.second) {
            devices.add(SessionDataItemDeviceParams(
              type: 'PolarDataType.ecg',
              identifier: identifier,
              value: [
                {
                  'timeStamp': ecg.timeStamp.toIso8601String(),
                  'voltage': ecg.voltage,
                },
              ],
            ));
          }
        }

        for (var acc in samples.value3) {
          if (hr.second == acc.second) {
            devices.add(SessionDataItemDeviceParams(
              type: 'PolarDataType.acc',
              identifier: identifier,
              value: [
                {
                  'timeStamp': acc.timeStamp.microsecondsSinceEpoch,
                  'x': acc.x,
                  'y': acc.y,
                  'z': acc.z,
                },
              ],
            ));
          }
        }
        for (var gyro in samples.value4) {
          if (hr.second == gyro.second) {
            devices.add(SessionDataItemDeviceParams(
              type: 'PolarDataType.gyro',
              identifier: identifier,
              value: [
                {
                  'timeStamp': gyro.timeStamp.microsecondsSinceEpoch,
                  'x': gyro.x,
                  'y': gyro.y,
                  'z': gyro.z,
                },
              ],
            ));
          }
        }
        for (var magnetometer in samples.value5) {
          if (hr.second == magnetometer.second) {
            devices.add(SessionDataItemDeviceParams(
              type: 'PolarDataType.magnetometer',
              identifier: identifier,
              value: [
                {
                  'timeStamp': magnetometer.timeStamp.microsecondsSinceEpoch,
                  'x': magnetometer.x,
                  'y': magnetometer.y,
                  'z': magnetometer.z,
                },
              ],
            ));
          }
        }
        for (var ppg in samples.value6) {
          if (hr.second == ppg.second) {
            devices.add(SessionDataItemDeviceParams(
              type: 'PolarDataType.ppg',
              identifier: identifier,
              value: [
                {
                  'timeStamp': ppg.timeStamp.microsecondsSinceEpoch,
                  'channelSamples': ppg.channelSamples,
                },
              ],
            ));
          }
        }
        hrBased.add(SessionDataItemParams(
          second: hr.second,
          timeStamp: hr.timeStamp.microsecondsSinceEpoch,
          devices: devices,
        ));
      }
      return hrBased;
    });
    final res = await parser.parseInBackground();
    return CreateSessionParams(
      userId: user.id ?? '',
      exerciseId: exercise.id ?? '',
      startTime: hrSamples?.first.timeStamp.microsecondsSinceEpoch ?? 0,
      endTime: hrSamples?.last.timeStamp.microsecondsSinceEpoch ?? 0,
      mood: mood,
      timelines: [],
      data: res,
    );
  }
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
        return Colors.blue;
      case HrZoneType.LIGHT:
        return Colors.green;
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
