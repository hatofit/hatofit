// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      exerciseId: json['exerciseId'] as String,
      startTime: json['startTime'] as int,
      endTime: json['endTime'] as int,
      timelines: (json['timelines'] as List<dynamic>)
          .map((e) => SessionTimeline.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>)
          .map((e) => SessionDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
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
          .map((e) =>
              SessionDataItemDeviceValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionDataItemDeviceToJson(
        SessionDataItemDevice instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
      'value': instance.value.map((e) => e.toJson()).toList(),
    };

SessionDataItemDeviceValue _$SessionDataItemDeviceValueFromJson(
        Map<String, dynamic> json) =>
    SessionDataItemDeviceValue(
      hr: json['hr'] == null
          ? null
          : HrData.fromJson(json['hr'] as Map<String, dynamic>),
      ecg: json['ecg'] == null
          ? null
          : EcgData.fromJson(json['ecg'] as Map<String, dynamic>),
      acc: json['acc'] == null
          ? null
          : AccData.fromJson(json['acc'] as Map<String, dynamic>),
      gyro: json['gyro'] == null
          ? null
          : GyroData.fromJson(json['gyro'] as Map<String, dynamic>),
      magnetometer: json['magnetometer'] == null
          ? null
          : MagnetometerData.fromJson(
              json['magnetometer'] as Map<String, dynamic>),
      ppg: json['ppg'] == null
          ? null
          : PpgData.fromJson(json['ppg'] as Map<String, dynamic>),
      ppi: json['ppi'] == null
          ? null
          : PpiData.fromJson(json['ppi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionDataItemDeviceValueToJson(
        SessionDataItemDeviceValue instance) =>
    <String, dynamic>{
      'hr': instance.hr?.toJson(),
      'ecg': instance.ecg?.toJson(),
      'acc': instance.acc?.toJson(),
      'gyro': instance.gyro?.toJson(),
      'magnetometer': instance.magnetometer?.toJson(),
      'ppg': instance.ppg?.toJson(),
      'ppi': instance.ppi?.toJson(),
    };

HrData _$HrDataFromJson(Map<String, dynamic> json) => HrData(
      time: json['time'] as int,
      bpm: json['bpm'] as int,
      rrsMs: (json['rrsMs'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$HrDataToJson(HrData instance) => <String, dynamic>{
      'time': instance.time,
      'bpm': instance.bpm,
      'rrsMs': instance.rrsMs,
    };

EcgData _$EcgDataFromJson(Map<String, dynamic> json) => EcgData(
      time: json['time'] as int,
      voltage: json['voltage'] as int,
    );

Map<String, dynamic> _$EcgDataToJson(EcgData instance) => <String, dynamic>{
      'time': instance.time,
      'voltage': instance.voltage,
    };

AccData _$AccDataFromJson(Map<String, dynamic> json) => AccData(
      time: json['time'] as int,
      x: json['x'] as int,
      y: json['y'] as int,
      z: json['z'] as int,
    );

Map<String, dynamic> _$AccDataToJson(AccData instance) => <String, dynamic>{
      'time': instance.time,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

GyroData _$GyroDataFromJson(Map<String, dynamic> json) => GyroData(
      time: json['time'] as int,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$GyroDataToJson(GyroData instance) => <String, dynamic>{
      'time': instance.time,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

MagnetometerData _$MagnetometerDataFromJson(Map<String, dynamic> json) =>
    MagnetometerData(
      time: json['time'] as int,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$MagnetometerDataToJson(MagnetometerData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

PpgData _$PpgDataFromJson(Map<String, dynamic> json) => PpgData(
      time: json['time'] as int,
      samples: (json['samples'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PpgDataToJson(PpgData instance) => <String, dynamic>{
      'time': instance.time,
      'samples': instance.samples,
    };

PpiData _$PpiDataFromJson(Map<String, dynamic> json) => PpiData(
      time: json['time'] as int,
      ppi: json['ppi'] as int,
      errorEstimate: json['errorEstimate'] as int,
      hr: json['hr'] as int,
      blockerBit: json['blockerBit'] as bool,
      skinContactStatus: json['skinContactStatus'] as bool,
      skinContactSupported: json['skinContactSupported'] as bool,
    );

Map<String, dynamic> _$PpiDataToJson(PpiData instance) => <String, dynamic>{
      'time': instance.time,
      'ppi': instance.ppi,
      'errorEstimate': instance.errorEstimate,
      'hr': instance.hr,
      'blockerBit': instance.blockerBit,
      'skinContactStatus': instance.skinContactStatus,
      'skinContactSupported': instance.skinContactSupported,
    };
