import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'report_entity.freezed.dart';
part 'report_entity.g.dart';

@freezed
class ReportEntity with _$ReportEntity {
  @HiveType(
    typeId: BoxTypeId.reportEntityIndex,
    adapterName: BoxTypeId.reportEntityAdapterName,
  )
  const factory ReportEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? sessionId,
    @HiveField(2) String? exerciseId,
    @HiveField(3) int? startTime,
    @HiveField(4) int? endTime,
    @HiveField(5) List<ReportDeviceEntity>? devices,
    @HiveField(6) List<ReportDataEntity>? reports,
  }) = _ReportEntity;
}

@freezed
class ReportDeviceEntity with _$ReportDeviceEntity {
  @HiveType(
    typeId: BoxTypeId.reportDeviceEntityIndex,
    adapterName: BoxTypeId.reportDeviceEntityAdapterName,
  )
  const factory ReportDeviceEntity({
    @HiveField(0) String? name,
    @HiveField(1) String? identifier,
  }) = _ReportDeviceEntity;
}

@freezed
class ReportDataEntity with _$ReportDataEntity {
  @HiveType(
    typeId: BoxTypeId.reportDataEntityIndex,
    adapterName: BoxTypeId.reportDataEntityAdapterName,
  )
  const factory ReportDataEntity({
    @HiveField(0) String? type,
    @HiveField(1) List<ReportDataValueEntity>? data,
  }) = _ReportDataEntity;
}

@freezed
class ReportDataValueEntity with _$ReportDataValueEntity {
  @HiveType(
    typeId: BoxTypeId.reportDataValueEntityIndex,
    adapterName: BoxTypeId.reportDataValueEntityAdapterName,
  )
  const factory ReportDataValueEntity({
    @HiveField(0) String? device,
    @HiveField(1) List<List<dynamic>>? value,
  }) = _ReportDataValueEntity;
}

void regisReport(){
  if (!Hive.isAdapterRegistered(BoxTypeId.reportEntityIndex)) {
    Hive.registerAdapter(ReportEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.reportDeviceEntityIndex)) {
    Hive.registerAdapter(ReportDeviceEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.reportDataEntityIndex)) {
    Hive.registerAdapter(ReportDataEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.reportDataValueEntityIndex)) {
    Hive.registerAdapter(ReportDataValueEntityAdapter());
  }
}