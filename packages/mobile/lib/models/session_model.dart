import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SessionModel {
  @JsonKey(name: '_id')
  final String exerciseId;
  final int startTime;
  final int endTime;
  final List<SessionTimeline> timelines;
  final List<SessionDataItem> data;

  SessionModel({
    required this.exerciseId,
    required this.startTime,
    required this.endTime,
    required this.timelines,
    required this.data,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
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
  List<Map<String, dynamic>> value;

  SessionDataItemDevice({
    required this.type,
    required this.identifier,
    required this.value,
  });

  factory SessionDataItemDevice.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDataItemDeviceToJson(this);
}
