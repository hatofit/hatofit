import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

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
  List<WSessionChart>? hrChart;
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
    this.hrChart ,
    required this.avgHr,
    this.maxHr,
    this.minHr,
    required this.calories,
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
    final parser = IParser(dataSamples, (data) {
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
      final brand = samples.value7.brand ?? "Unknown";
      final model = samples.value7.name;
      for (var hr in samples.value1) {
        final List<SessionDataItemDeviceParams> devices = [];
        devices.add(
          SessionDataItemDeviceParams(
            type: ble.name.contains("Polar")
                ? 'PolarDataType.hr'
                : "CommonDataType.hr",
            identifier: identifier,
            brand: brand,
            model: model,
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
            // final time = ecg.timeStamp.toString();
            // log.f("Ecg Timestamp : ${time}");
            devices.add(SessionDataItemDeviceParams(
              type: 'PolarDataType.ecg',
              identifier: identifier,
              brand: brand,
              model: model,
              value: [
                {
                  'timeStamp': ecg.timeStamp.microsecondsSinceEpoch,
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
              brand: brand,
              model: model,
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
              brand: brand,
              model: model,
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
              brand: brand,
              model: model,
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
              brand: brand,
              model: model,
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
