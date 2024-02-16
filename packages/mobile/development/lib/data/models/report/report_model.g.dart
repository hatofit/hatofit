// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      id: json['_id'] as String?,
      sessionId: json['sessionId'] as String?,
      exerciseId: json['exerciseId'] as String?,
      startTime: json['startTime'] as int?,
      endTime: json['endTime'] as int?,
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => ReportDeviceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => ReportDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sessionId': instance.sessionId,
      'exerciseId': instance.exerciseId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'devices': instance.devices?.map((e) => e.toJson()).toList(),
      'reports': instance.reports?.map((e) => e.toJson()).toList(),
    };

_$ReportDeviceModelImpl _$$ReportDeviceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportDeviceModelImpl(
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      identifier: json['identifier'] as String?,
    );

Map<String, dynamic> _$$ReportDeviceModelImplToJson(
        _$ReportDeviceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'identifier': instance.identifier,
    };

_$ReportDataModelImpl _$$ReportDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportDataModelImpl(
      type: json['type'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportDataValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportDataModelImplToJson(
        _$ReportDataModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_$ReportDataValueModelImpl _$$ReportDataValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportDataValueModelImpl(
      device: json['device'] as String?,
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ReportDataValueModelImplToJson(
        _$ReportDataValueModelImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
      'value': instance.value,
    };
