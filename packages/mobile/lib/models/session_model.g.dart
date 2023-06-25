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
          .map((e) => ValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
      'value': instance.value.map((e) => e.toJson()).toList(),
    };

ValueModel _$ValueModelFromJson(Map<String, dynamic> json) => ValueModel(
      voltage: (json['voltage'] as num?)?.toDouble(),
      x: json['x'] as int?,
      y: json['y'] as int?,
      z: json['z'] as int?,
      channelSamples: (json['channelSamples'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      gyroX: (json['gyroX'] as num?)?.toDouble(),
      gyroY: (json['gyroY'] as num?)?.toDouble(),
      gyroZ: (json['gyroZ'] as num?)?.toDouble(),
      magnetometerX: (json['magnetometerX'] as num?)?.toDouble(),
      magnetometerY: (json['magnetometerY'] as num?)?.toDouble(),
      magnetometerZ: (json['magnetometerZ'] as num?)?.toDouble(),
      hr: json['hr'] as int?,
      rrsMs: (json['rrsMs'] as List<dynamic>?)?.map((e) => e as int).toList(),
      timeStamp: json['timeStamp'] as String,
    );

Map<String, dynamic> _$ValueModelToJson(ValueModel instance) =>
    <String, dynamic>{
      'voltage': instance.voltage,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'channelSamples': instance.channelSamples,
      'gyroX': instance.gyroX,
      'gyroY': instance.gyroY,
      'gyroZ': instance.gyroZ,
      'magnetometerX': instance.magnetometerX,
      'magnetometerY': instance.magnetometerY,
      'magnetometerZ': instance.magnetometerZ,
      'hr': instance.hr,
      'rrsMs': instance.rrsMs,
      'timeStamp': instance.timeStamp,
    };
