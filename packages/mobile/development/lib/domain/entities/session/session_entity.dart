import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'session_entity.freezed.dart';
part 'session_entity.g.dart';

@freezed
class SessionEntity with _$SessionEntity {
  @HiveType(
    typeId: BoxTypeId.sessionEntityIndex,
    adapterName: BoxTypeId.sessionEntityAdapterName,
  )
  const factory SessionEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? userId,
    @HiveField(2) String? mood,
    @HiveField(3) ExerciseEntity? exercise,
    @HiveField(4) int? startTime,
    @HiveField(5) int? endTime,
    @HiveField(6) List<SessionTimelineEntity>? timelines,
    @HiveField(7) List<SessionDataItemEntity>? data,
  }) = _SessionEntity;

}

@freezed
class SessionTimelineEntity with _$SessionTimelineEntity {
  @HiveType(
    typeId: BoxTypeId.sessionTimelineEntityIndex,
    adapterName: BoxTypeId.sessionTimelineEntityAdapterName,
  )
  const factory SessionTimelineEntity({
    @HiveField(0) String? name,
    @HiveField(1) int? startTime,
  }) = _SessionTimelineEntity;
}

@freezed
class SessionDataItemEntity with _$SessionDataItemEntity {
  @HiveType(
    typeId: BoxTypeId.sessionDataItemEntityIndex,
    adapterName: BoxTypeId.sessionDataItemEntityAdapterName,
  )
  const factory SessionDataItemEntity({
    @HiveField(0) int? second,
    @HiveField(1) int? timeStamp,
    @HiveField(2) List<SessionDataItemDeviceEntity>? devices,
  }) = _SessionDataItemEntity;
}

@freezed
class SessionDataItemDeviceEntity with _$SessionDataItemDeviceEntity {
  @HiveType(
    typeId: BoxTypeId.sessionDataItemDeviceEntityIndex,
    adapterName: BoxTypeId.sessionDataItemDeviceEntityAdapterName,
  )
  const factory SessionDataItemDeviceEntity({
    @HiveField(0) String? type,
    @HiveField(1) String? identifier,
    @HiveField(2) List<Map<String, dynamic>>? value,
    @HiveField(3) String? brand,
    @HiveField(4) String? model,
  }) = _SessionDataItemDeviceEntity;
}

void regisSession() {
  if (!Hive.isAdapterRegistered(BoxTypeId.sessionEntityIndex)) {
    Hive.registerAdapter(SessionEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.sessionTimelineEntityIndex)) {
    Hive.registerAdapter(SessionTimelineEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.sessionDataItemEntityIndex)) {
    Hive.registerAdapter(SessionDataItemEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.sessionDataItemDeviceEntityIndex)) {
    Hive.registerAdapter(SessionDataItemDeviceEntityAdapter());
  }
}
