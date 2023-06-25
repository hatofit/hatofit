import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SessionModel {
  final String exerciseId;
  final int startTime;
  final int endTime;
  final List<TimelineModel> timelines;
  final List<DataModel> data;

  SessionModel(
    this.exerciseId,
    this.startTime,
    this.endTime,
    this.timelines,
    this.data,
  );

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TimelineModel {
  final String name;
  final int startTime;

  TimelineModel(this.name, this.startTime);

  factory TimelineModel.fromJson(Map<String, dynamic> json) =>
      _$TimelineModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataModel {
  final int second;
  final int timeStamp;
  final List<DeviceModel> devices;

  DataModel(this.second, this.timeStamp, this.devices);

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeviceModel {
  final String type;
  final String identifier;
  final List<ValueModel> value;

  DeviceModel(this.type, this.identifier, this.value);

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ValueModel {
  final double? voltage;
  final int? x;
  final int? y;
  final int? z;
  final List<int>? channelSamples;
  final double? gyroX;
  final double? gyroY;
  final double? gyroZ;
  final double? magnetometerX;
  final double? magnetometerY;
  final double? magnetometerZ;
  final int? hr;
  final List<int>? rrsMs;
  final String timeStamp;

  ValueModel({
    this.voltage,
    this.x,
    this.y,
    this.z,
    this.channelSamples,
    this.gyroX,
    this.gyroY,
    this.gyroZ,
    this.magnetometerX,
    this.magnetometerY,
    this.magnetometerZ,
    this.hr,
    this.rrsMs,
    required this.timeStamp,
  });

  factory ValueModel.fromJson(Map<String, dynamic> json) =>
      _$ValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValueModelToJson(this);
}
