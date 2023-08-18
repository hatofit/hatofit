import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable(explicitToJson: true)
class Session {
  String exerciseId;
  final int startTime;
  final int endTime;
  final List<SessionTimeline> timelines;
  final List<SessionDataItem> data;

  Session({
    required this.exerciseId,
    required this.startTime,
    required this.endTime,
    required this.timelines,
    required this.data,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SessionTimeline {
  final String name;
  final int startTime;

  SessionTimeline(this.name, this.startTime);

  factory SessionTimeline.fromJson(Map<String, dynamic> json) =>
      _$SessionTimelineFromJson(json);

  Map<String, dynamic> toJson() => _$SessionTimelineToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SessionDataItem {
  final int second;
  final int timeStamp;
  final List<SessionDataItemDevice> devices;

  SessionDataItem({
    required this.second,
    required this.timeStamp,
    required this.devices,
  });

  factory SessionDataItem.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDataItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SessionDataItemDevice {
  String type;
  String identifier;
  List<SessionDataItemDeviceValue> value;

  SessionDataItemDevice({
    required this.type,
    required this.identifier,
    required this.value,
  });

  factory SessionDataItemDevice.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDataItemDeviceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SessionDataItemDeviceValue {
  HrData? hr;
  EcgData? ecg;
  AccData? acc;
  GyroData? gyro;
  MagnetometerData? magnetometer;
  PpgData? ppg;
  PpiData? ppi;

  SessionDataItemDeviceValue({
    this.hr,
    this.ecg,
    this.acc,
    this.gyro,
    this.magnetometer,
    this.ppg,
    this.ppi,
  });

  factory SessionDataItemDeviceValue.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemDeviceValueFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDataItemDeviceValueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HrData {
  final int time;
  final int bpm;
  final List<int>? rrsMs;
  HrData({
    required this.time,
    required this.bpm,
    this.rrsMs,
  });

  factory HrData.fromJson(Map<String, dynamic> json) => _$HrDataFromJson(json);

  Map<String, dynamic> toJson() => _$HrDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EcgData {
  final int time;
  final int voltage;
  EcgData({
    required this.time,
    required this.voltage,
  });

  factory EcgData.fromJson(Map<String, dynamic> json) =>
      _$EcgDataFromJson(json);

  Map<String, dynamic> toJson() => _$EcgDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccData {
  final int time;
  final int x;
  final int y;
  final int z;
  AccData({
    required this.time,
    required this.x,
    required this.y,
    required this.z,
  });

  factory AccData.fromJson(Map<String, dynamic> json) =>
      _$AccDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GyroData {
  final int time;
  final double x;
  final double y;
  final double z;
  GyroData({
    required this.time,
    required this.x,
    required this.y,
    required this.z,
  });

  factory GyroData.fromJson(Map<String, dynamic> json) =>
      _$GyroDataFromJson(json);

  Map<String, dynamic> toJson() => _$GyroDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MagnetometerData {
  final int time;
  final double x;
  final double y;
  final double z;
  MagnetometerData({
    required this.time,
    required this.x,
    required this.y,
    required this.z,
  });

  factory MagnetometerData.fromJson(Map<String, dynamic> json) =>
      _$MagnetometerDataFromJson(json);

  Map<String, dynamic> toJson() => _$MagnetometerDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PpgData {
  final int time;
  final List<int> samples;
  PpgData({
    required this.time,
    required this.samples,
  });

  factory PpgData.fromJson(Map<String, dynamic> json) =>
      _$PpgDataFromJson(json);

  Map<String, dynamic> toJson() => _$PpgDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PpiData {
  final int time;
  final int ppi;
  final int errorEstimate;
  final int hr;
  final bool blockerBit;
  final bool skinContactStatus;
  final bool skinContactSupported;

  PpiData({
    required this.time,
    required this.ppi,
    required this.errorEstimate,
    required this.hr,
    required this.blockerBit,
    required this.skinContactStatus,
    required this.skinContactSupported,
  });

  factory PpiData.fromJson(Map<String, dynamic> json) =>
      _$PpiDataFromJson(json);

  Map<String, dynamic> toJson() => _$PpiDataToJson(this);
}
