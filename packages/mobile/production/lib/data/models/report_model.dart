import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReportModel {
  final String exerciseId;
  final String sessionId;
  final int startTime;
  final int endTime;
  final List<ReportDevice> devices;
  List<ReportData> reports;

  ReportModel({
    required this.exerciseId,
    required this.sessionId,
    required this.startTime,
    required this.endTime,
    required this.devices,
    required this.reports,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportDevice {
  final String name;
  final String identifier;

  ReportDevice({
    required this.name,
    required this.identifier,
  });

  factory ReportDevice.fromJson(Map<String, dynamic> json) =>
      _$ReportDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDeviceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportData {
  String type;
  final List<DataValue> data;

  ReportData({
    required this.type,
    required this.data,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataValue {
  String device;
  final List<List<dynamic>> value;

  DataValue({
    required this.device,
    required this.value,
  });

  factory DataValue.fromJson(Map<String, dynamic> json) =>
      _$DataValueFromJson(json);

  Map<String, dynamic> toJson() => _$DataValueToJson(this);
}
