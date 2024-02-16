// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionModelImpl _$$SessionModelImplFromJson(Map<String, dynamic> json) =>
    _$SessionModelImpl(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      mood: json['mood'] as String?,
      exercise: json['exercise'] == null
          ? null
          : ExerciseModel.fromJson(json['exercise'] as Map<String, dynamic>),
      startTime: json['startTime'] as int?,
      endTime: json['endTime'] as int?,
      timelines: (json['timelines'] as List<dynamic>?)
          ?.map((e) => SessionTimelineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SessionDataItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionModelImplToJson(_$SessionModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'mood': instance.mood,
      'exercise': instance.exercise?.toJson(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'timelines': instance.timelines?.map((e) => e.toJson()).toList(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_$SessionTimelineModelImpl _$$SessionTimelineModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionTimelineModelImpl(
      name: json['name'] as String?,
      startTime: json['startTime'] as int?,
    );

Map<String, dynamic> _$$SessionTimelineModelImplToJson(
        _$SessionTimelineModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startTime': instance.startTime,
    };

_$SessionDataItemModelImpl _$$SessionDataItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionDataItemModelImpl(
      second: json['second'] as int?,
      timeStamp: json['timeStamp'] as int?,
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) =>
              SessionDataItemDeviceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionDataItemModelImplToJson(
        _$SessionDataItemModelImpl instance) =>
    <String, dynamic>{
      'second': instance.second,
      'timeStamp': instance.timeStamp,
      'devices': instance.devices?.map((e) => e.toJson()).toList(),
    };

_$SessionDataItemDeviceModelImpl _$$SessionDataItemDeviceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionDataItemDeviceModelImpl(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$SessionDataItemDeviceModelImplToJson(
        _$SessionDataItemDeviceModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
      'brand': instance.brand,
      'model': instance.model,
      'value': instance.value,
    };
