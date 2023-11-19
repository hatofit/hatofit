// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      sessionId: json['sessionId'] as String?,
      userId: json['userId'] as String?,
      exercise: json['exercise'] == null
          ? null
          : ExerciseModel.fromJson(json['exercise'] as Map<String, dynamic>),
      exerciseId: json['exerciseId'] as String?,
      mood: json['mood'] as String,
      startTime: json['startTime'] as int,
      endTime: json['endTime'] as int,
      timelines: (json['timelines'] as List<dynamic>)
          .map((e) => SessionTimeline.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>)
          .map((e) => SessionDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'userId': instance.userId,
      'exercise': instance.exercise?.toJson(),
      'exerciseId': instance.exerciseId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'mood': instance.mood,
      'timelines': instance.timelines.map((e) => e.toJson()).toList(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

SessionTimeline _$SessionTimelineFromJson(Map<String, dynamic> json) =>
    SessionTimeline(
      json['name'] as String,
      json['startTime'] as int,
    );

Map<String, dynamic> _$SessionTimelineToJson(SessionTimeline instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startTime': instance.startTime,
    };

SessionDataItem _$SessionDataItemFromJson(Map<String, dynamic> json) =>
    SessionDataItem(
      second: json['second'] as int,
      timeStamp: json['timeStamp'] as int,
      devices: (json['devices'] as List<dynamic>)
          .map((e) => SessionDataItemDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionDataItemToJson(SessionDataItem instance) =>
    <String, dynamic>{
      'second': instance.second,
      'timeStamp': instance.timeStamp,
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

SessionDataItemDevice _$SessionDataItemDeviceFromJson(
        Map<String, dynamic> json) =>
    SessionDataItemDevice(
      type: json['type'] as String,
      identifier: json['identifier'] as String,
      value: (json['value'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$SessionDataItemDeviceToJson(
        SessionDataItemDevice instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
      'value': instance.value,
    };
