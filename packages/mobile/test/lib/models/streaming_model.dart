import 'package:json_annotation/json_annotation.dart';
import 'package:polar/polar.dart';

part 'streaming_model.g.dart';

/// basically magnetometer data was same like [GyroData]. so it can reuse one
@JsonSerializable(explicitToJson: true)
class StreamingModel {
  final PhoneInfo phoneInfo;
  final PolarDeviceInfo polarDeviceInfo;
  final List<HrData> hrData;
  final List<AccData> accData;
  final List<PpgData> ppgData;
  final List<PpiData> ppiData;
  final List<GyroData> gyroData;
  final List<RssiData> rssiData;

  /// basically magnetometer data was same like [GyroData]. so it can reuse one
  final List<GyroData> magnData;
  final List<EcgData> ecgData;

  StreamingModel(
      {required this.phoneInfo,
      required this.polarDeviceInfo,
      required this.hrData,
      required this.accData,
      required this.ppgData,
      required this.ppiData,
      required this.gyroData,
      required this.magnData,
      required this.ecgData,
      required this.rssiData});

  factory StreamingModel.fromJson(Map<String, dynamic> json) =>
      _$StreamingModelFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingModelToJson(this);
}

@JsonSerializable()
class PhoneInfo {
  final String os;
  final String manufacturer;
  final String type;
  final String deviceId;
  final int totalProcessors;

  PhoneInfo({
    required this.os,
    required this.manufacturer,
    required this.type,
    required this.deviceId,
    required this.totalProcessors,
  });

  factory PhoneInfo.fromJson(Map<String, dynamic> json) =>
      _$PhoneInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneInfoToJson(this);
}

@JsonSerializable()
class RssiData {
  final int timestamp;
  final int rssi;

  RssiData({required this.timestamp, required this.rssi});

  factory RssiData.fromJson(Map<String, dynamic> json) =>
      _$RssiDataFromJson(json);

  Map<String, dynamic> toJson() => _$RssiDataToJson(this);
}

@JsonSerializable()
class HrData {
  final int timestamp;
  final int hr;
  final List<int> rrsMs;

  HrData({
    required this.timestamp,
    required this.hr,
    required this.rrsMs,
  });

  factory HrData.fromJson(Map<String, dynamic> json) => _$HrDataFromJson(json);

  Map<String, dynamic> toJson() => _$HrDataToJson(this);
}

@JsonSerializable()
class AccData {
  final int timestamp;
  final int x;
  final int y;
  final int z;

  AccData(
      {required this.timestamp,
      required this.x,
      required this.y,
      required this.z});

  factory AccData.fromJson(Map<String, dynamic> json) =>
      _$AccDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccDataToJson(this);
}

@JsonSerializable()
class PpgData {
  final int tS;
  final List<int> cS;

  PpgData({required this.tS, required this.cS});

  factory PpgData.fromJson(Map<String, dynamic> json) =>
      _$PpgDataFromJson(json);

  Map<String, dynamic> toJson() => _$PpgDataToJson(this);
}

@JsonSerializable()
class PpiData {
  final int tS;
  final int ppi;
  final int errorEstimate;
  final int hr;
  final bool blockerBit;
  final bool skinContactStatus;
  final bool skinContactSupported;
  PpiData(
      {required this.tS,
      required this.ppi,
      required this.errorEstimate,
      required this.hr,
      required this.blockerBit,
      required this.skinContactStatus,
      required this.skinContactSupported});

  factory PpiData.fromJson(Map<String, dynamic> json) =>
      _$PpiDataFromJson(json);

  Map<String, dynamic> toJson() => _$PpiDataToJson(this);
}

@JsonSerializable()
class GyroData {
  final int tS;
  final double x;
  final double y;
  final double z;
  GyroData(
      {required this.tS, required this.x, required this.y, required this.z});

  factory GyroData.fromJson(Map<String, dynamic> json) =>
      _$GyroDataFromJson(json);

  Map<String, dynamic> toJson() => _$GyroDataToJson(this);
}

@JsonSerializable()
class EcgData {
  final int tS;
  final int voltage;
  EcgData({required this.tS, required this.voltage});

  factory EcgData.fromJson(Map<String, dynamic> json) =>
      _$EcgDataFromJson(json);

  Map<String, dynamic> toJson() => _$EcgDataToJson(this);
}
