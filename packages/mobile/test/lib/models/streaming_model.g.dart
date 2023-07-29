// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingModel _$StreamingModelFromJson(Map<String, dynamic> json) =>
    StreamingModel(
      phoneInfo: PhoneInfo.fromJson(json['phoneInfo'] as Map<String, dynamic>),
      polarDeviceInfo: PolarDeviceInfo.fromJson(
          json['polarDeviceInfo'] as Map<String, dynamic>),
      hrData: (json['hrData'] as List<dynamic>)
          .map((e) => HrData.fromJson(e as Map<String, dynamic>))
          .toList(),
      accData: (json['accData'] as List<dynamic>)
          .map((e) => AccData.fromJson(e as Map<String, dynamic>))
          .toList(),
      ppgData: (json['ppgData'] as List<dynamic>)
          .map((e) => PpgData.fromJson(e as Map<String, dynamic>))
          .toList(),
      ppiData: (json['ppiData'] as List<dynamic>)
          .map((e) => PpiData.fromJson(e as Map<String, dynamic>))
          .toList(),
      gyroData: (json['gyroData'] as List<dynamic>)
          .map((e) => GyroData.fromJson(e as Map<String, dynamic>))
          .toList(),
      magnData: (json['magnData'] as List<dynamic>)
          .map((e) => GyroData.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecgData: (json['ecgData'] as List<dynamic>)
          .map((e) => EcgData.fromJson(e as Map<String, dynamic>))
          .toList(),
      rssiData: (json['rssiData'] as List<dynamic>)
          .map((e) => RssiData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StreamingModelToJson(StreamingModel instance) =>
    <String, dynamic>{
      'phoneInfo': instance.phoneInfo.toJson(),
      'polarDeviceInfo': instance.polarDeviceInfo.toJson(),
      'hrData': instance.hrData.map((e) => e.toJson()).toList(),
      'accData': instance.accData.map((e) => e.toJson()).toList(),
      'ppgData': instance.ppgData.map((e) => e.toJson()).toList(),
      'ppiData': instance.ppiData.map((e) => e.toJson()).toList(),
      'gyroData': instance.gyroData.map((e) => e.toJson()).toList(),
      'rssiData': instance.rssiData.map((e) => e.toJson()).toList(),
      'magnData': instance.magnData.map((e) => e.toJson()).toList(),
      'ecgData': instance.ecgData.map((e) => e.toJson()).toList(),
    };

PhoneInfo _$PhoneInfoFromJson(Map<String, dynamic> json) => PhoneInfo(
      os: json['os'] as String,
      manufacturer: json['manufacturer'] as String,
      type: json['type'] as String,
      deviceId: json['deviceId'] as String,
      totalProcessors: json['totalProcessors'] as int,
    );

Map<String, dynamic> _$PhoneInfoToJson(PhoneInfo instance) => <String, dynamic>{
      'os': instance.os,
      'manufacturer': instance.manufacturer,
      'type': instance.type,
      'deviceId': instance.deviceId,
      'totalProcessors': instance.totalProcessors,
    };

RssiData _$RssiDataFromJson(Map<String, dynamic> json) => RssiData(
      timestamp: json['timestamp'] as int,
      rssi: json['rssi'] as int,
    );

Map<String, dynamic> _$RssiDataToJson(RssiData instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'rssi': instance.rssi,
    };

HrData _$HrDataFromJson(Map<String, dynamic> json) => HrData(
      timestamp: json['timestamp'] as int,
      hr: json['hr'] as int,
      rrsMs: (json['rrsMs'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$HrDataToJson(HrData instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'hr': instance.hr,
      'rrsMs': instance.rrsMs,
    };

AccData _$AccDataFromJson(Map<String, dynamic> json) => AccData(
      timestamp: json['timestamp'] as int,
      x: json['x'] as int,
      y: json['y'] as int,
      z: json['z'] as int,
    );

Map<String, dynamic> _$AccDataToJson(AccData instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

PpgData _$PpgDataFromJson(Map<String, dynamic> json) => PpgData(
      tS: json['tS'] as int,
      cS: (json['cS'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PpgDataToJson(PpgData instance) => <String, dynamic>{
      'tS': instance.tS,
      'cS': instance.cS,
    };

PpiData _$PpiDataFromJson(Map<String, dynamic> json) => PpiData(
      tS: json['tS'] as int,
      ppi: json['ppi'] as int,
      errorEstimate: json['errorEstimate'] as int,
      hr: json['hr'] as int,
      blockerBit: json['blockerBit'] as bool,
      skinContactStatus: json['skinContactStatus'] as bool,
      skinContactSupported: json['skinContactSupported'] as bool,
    );

Map<String, dynamic> _$PpiDataToJson(PpiData instance) => <String, dynamic>{
      'tS': instance.tS,
      'ppi': instance.ppi,
      'errorEstimate': instance.errorEstimate,
      'hr': instance.hr,
      'blockerBit': instance.blockerBit,
      'skinContactStatus': instance.skinContactStatus,
      'skinContactSupported': instance.skinContactSupported,
    };

GyroData _$GyroDataFromJson(Map<String, dynamic> json) => GyroData(
      tS: json['tS'] as int,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$GyroDataToJson(GyroData instance) => <String, dynamic>{
      'tS': instance.tS,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

EcgData _$EcgDataFromJson(Map<String, dynamic> json) => EcgData(
      tS: json['tS'] as int,
      voltage: json['voltage'] as int,
    );

Map<String, dynamic> _$EcgDataToJson(EcgData instance) => <String, dynamic>{
      'tS': instance.tS,
      'voltage': instance.voltage,
    };
