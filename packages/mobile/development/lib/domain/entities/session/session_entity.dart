import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'session_entity.freezed.dart';

@freezed
class SessionEntity with _$SessionEntity {
  @HiveType(typeId: 5, adapterName: 'SessionEntityAdapter')
  const factory SessionEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? userId,
    @HiveField(2) String? mood,
    @HiveField(3) ExerciseEntity? exercise,
    @HiveField(4) int? startTime,
    @HiveField(5) int? endTime,
    @HiveField(6) List<SessionTimelineEntity>? timeline,
    @HiveField(7) List<SessionDataItemEntity>? data,
  }) = _SessionEntity;
}

@freezed
class SessionTimelineEntity with _$SessionTimelineEntity {
  @HiveType(typeId: 6, adapterName: 'SessionTimelineEntityAdapter')
  const factory SessionTimelineEntity({
    @HiveField(0) String? name,
    @HiveField(1) int? startTime,
  }) = _SessionTimelineEntity;
}

@freezed
class SessionDataItemEntity with _$SessionDataItemEntity {
  @HiveType(typeId: 7, adapterName: 'SessionDataItemEntityAdapter')
  const factory SessionDataItemEntity({
    @HiveField(0) int? second,
    @HiveField(1) int? timeStamp,
    @HiveField(2) List<SessionDataItemDeviceEntity>? devices,
  }) = _SessionDataItemEntity;
}

@freezed
class SessionDataItemDeviceEntity with _$SessionDataItemDeviceEntity {
  @HiveType(typeId: 8, adapterName: 'SessionDataItemDeviceEntityAdapter')
  const factory SessionDataItemDeviceEntity({
    @HiveField(0) String? type,
    @HiveField(1) String? identifier,
    @HiveField(2) List<Map<String, dynamic>>? value,
  }) = _SessionDataItemDeviceEntity;
}
