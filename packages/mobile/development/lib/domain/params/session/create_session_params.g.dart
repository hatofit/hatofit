// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSessionParamsImpl _$$CreateSessionParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSessionParamsImpl(
      exerciseId: json['exerciseId'] as String? ?? "",
      startTime: json['startTime'] as int? ?? 0,
      endTime: json['endTime'] as int? ?? 0,
      mood: json['mood'] as String? ?? "",
      timeline: (json['timeline'] as List<dynamic>?)
              ?.map((e) =>
                  SessionTimelineParams.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  SessionDataItemParams.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CreateSessionParamsImplToJson(
        _$CreateSessionParamsImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'mood': instance.mood,
      'timeline': instance.timeline.map((e) => e.toJson()).toList(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$SessionTimelineParamsImpl _$$SessionTimelineParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionTimelineParamsImpl(
      name: json['name'] as String? ?? "",
      startTime: json['startTime'] as int? ?? 0,
    );

Map<String, dynamic> _$$SessionTimelineParamsImplToJson(
        _$SessionTimelineParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startTime': instance.startTime,
    };

_$SessionDataItemParamsImpl _$$SessionDataItemParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionDataItemParamsImpl(
      second: json['second'] as int? ?? 0,
      timeStamp: json['timeStamp'] as int? ?? 0,
      devices: (json['devices'] as List<dynamic>?)
              ?.map((e) => SessionDataItemDeviceParams.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SessionDataItemParamsImplToJson(
        _$SessionDataItemParamsImpl instance) =>
    <String, dynamic>{
      'second': instance.second,
      'timeStamp': instance.timeStamp,
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };

_$SessionDataItemDeviceParamsImpl _$$SessionDataItemDeviceParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionDataItemDeviceParamsImpl(
      type: json['type'] as String? ?? "",
      identifier: json['identifier'] as String? ?? "",
      value: (json['value'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SessionDataItemDeviceParamsImplToJson(
        _$SessionDataItemDeviceParamsImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
      'value': instance.value,
    };
