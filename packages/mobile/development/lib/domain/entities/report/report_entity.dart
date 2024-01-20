import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'report_entity.freezed.dart';

@freezed
class ReportEntity with _$ReportEntity {
  @HiveType(typeId: 8, adapterName: 'ReportEntityAdapter')
  const factory ReportEntity({
    @HiveField(0) String? id,
    @HiveField(2) String? sessionId,
    @HiveField(3) String? exerciseId,
    @HiveField(4) int? startTime,
    @HiveField(5) int? endTime,
    @HiveField(6) List<ReportDeviceEntity>? devices,
    @HiveField(7) List<ReportDataEntity>? reports,
  }) = _ReportEntity;
}

@freezed
class ReportDeviceEntity with _$ReportDeviceEntity {
  @HiveType(typeId: 9, adapterName: 'ReportDeviceEntityAdapter')
  const factory ReportDeviceEntity({
    @HiveField(0) String? name,
    @HiveField(1) String? identifier,
  }) = _ReportDeviceEntity;
}

@freezed
class ReportDataEntity with _$ReportDataEntity {
  @HiveType(typeId: 10, adapterName: 'ReportDataEntityAdapter')
  const factory ReportDataEntity({
    @HiveField(0) String? type,
    @HiveField(1) List<DataValueEntity>? data,
  }) = _ReportDataEntity;
}

@freezed
class DataValueEntity with _$DataValueEntity {
  @HiveType(typeId: 11, adapterName: 'DataValueEntityAdapter')
  const factory DataValueEntity({
    @HiveField(0) String? name,
    @HiveField(1) String? value,
  }) = _DataValueEntity;
}
