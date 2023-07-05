// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      json['exerciseId'] as String,
      json['startTime'] as int,
      json['endTime'] as int,
      (json['timelines'] as List<dynamic>)
          .map((e) => TimelineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['data'] as List<dynamic>)
          .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'timelines': instance.timelines.map((e) => e.toJson()).toList(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

TimelineModel _$TimelineModelFromJson(Map<String, dynamic> json) =>
    TimelineModel(
      json['name'] as String,
      json['startTime'] as int,
    );

Map<String, dynamic> _$TimelineModelToJson(TimelineModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startTime': instance.startTime,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['second'] as int,
      json['timeStamp'] as int,
      (json['devices'] as List<dynamic>)
          .map((e) => DeviceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'second': instance.second,
      'timeStamp': instance.timeStamp,
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      json['type'] as String,
      json['identifier'] as String,
      (json['value'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
      'value': instance.value,
    };
