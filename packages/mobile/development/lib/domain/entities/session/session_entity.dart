import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'session_entity.freezed.dart';

@freezed
class SessionEntity with _$SessionEntity {
  @HiveType(typeId: 5, adapterName: 'SessionEntityAdapter')
  const factory SessionEntity({
    @HiveField(0) String? sessionId,
    @HiveField(1) String? userId,
    @HiveField(2) ExerciseEntity? exercise,
    @HiveField(3) String? exerciseId,
    @HiveField(4) String? mood,
    @HiveField(5) int? startTime,
    @HiveField(6) int? endTime,
    @HiveField(7) List<SessionTimelineEntity>? timelines,
    @HiveField(8) List<SessionDataItemEntity>? data,
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
    @HiveField(0) String? name,
    @HiveField(1) String? value,
  }) = _SessionDataItemEntity;
}
