import 'package:polar/polar.dart';

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
