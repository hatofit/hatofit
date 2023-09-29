// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      exerciseId: json['exerciseId'] as String,
      sessionId: json['sessionId'] as String,
      startTime: json['startTime'] as int,
      endTime: json['endTime'] as int,
      devices: (json['devices'] as List<dynamic>)
          .map((e) => ReportDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      reports: (json['reports'] as List<dynamic>)
          .map((e) => ReportData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'sessionId': instance.sessionId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'devices': instance.devices.map((e) => e.toJson()).toList(),
      'reports': instance.reports.map((e) => e.toJson()).toList(),
    };

ReportDevice _$ReportDeviceFromJson(Map<String, dynamic> json) => ReportDevice(
      name: json['name'] as String,
      identifier: json['identifier'] as String,
    );

Map<String, dynamic> _$ReportDeviceToJson(ReportDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'identifier': instance.identifier,
    };

ReportData _$ReportDataFromJson(Map<String, dynamic> json) => ReportData(
      type: json['type'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportDataToJson(ReportData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataValue _$DataValueFromJson(Map<String, dynamic> json) => DataValue(
      device: json['device'] as String,
      value: (json['value'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$DataValueToJson(DataValue instance) => <String, dynamic>{
      'device': instance.device,
      'value': instance.value,
    };
