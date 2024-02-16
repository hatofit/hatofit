import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
class SessionModel with _$SessionModel {
  const factory SessionModel({
    @JsonKey(name: '_id') String? id,
    String? userId,
    String? mood,
    ExerciseModel? exercise,
    int? startTime,
    int? endTime,
    List<SessionTimelineModel>? timelines,
    List<SessionDataItemModel>? data,
  }) = _SessionModel;

  const SessionModel._();

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  SessionEntity toEntity() => SessionEntity(
        id: id,
        userId: userId,
        mood: mood,
        exercise: exercise?.toEntity(),
        startTime: startTime,
        endTime: endTime,
        timelines: timelines?.map((e) => e.toEntity()).toList(),
        data: data?.map((e) => e.toEntity()).toList(),
      );

  factory SessionModel.fromEntity(SessionEntity entity) => SessionModel(
        id: entity.id,
        userId: entity.userId,
        mood: entity.mood,
        exercise:
            ExerciseModel.fromEntity(entity.exercise ?? const ExerciseEntity()),
        startTime: entity.startTime,
        endTime: entity.endTime,
        timelines: entity.timelines
            ?.map((e) => SessionTimelineModel.fromEntity(e))
            .toList(),
        data: entity.data
            ?.map((e) => SessionDataItemModel.fromEntity(e))
            .toList(),
      );
}

@freezed
class SessionTimelineModel with _$SessionTimelineModel {
  const factory SessionTimelineModel({
    String? name,
    int? startTime,
  }) = _SessionTimelineModel;

  const SessionTimelineModel._();

  factory SessionTimelineModel.fromJson(Map<String, dynamic> json) =>
      _$SessionTimelineModelFromJson(json);

  SessionTimelineEntity toEntity() => SessionTimelineEntity(
        name: name,
        startTime: startTime,
      );

  factory SessionTimelineModel.fromEntity(SessionTimelineEntity entity) =>
      SessionTimelineModel(
        name: entity.name,
        startTime: entity.startTime,
      );
}

@freezed
class SessionDataItemModel with _$SessionDataItemModel {
  const factory SessionDataItemModel({
    int? second,
    int? timeStamp,
    List<SessionDataItemDeviceModel>? devices,
  }) = _SessionDataItemModel;

  const SessionDataItemModel._();

  factory SessionDataItemModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemModelFromJson(json);

  SessionDataItemEntity toEntity() => SessionDataItemEntity(
        second: second,
        timeStamp: timeStamp,
        devices: devices?.map((e) => e.toEntity()).toList(),
      );

  factory SessionDataItemModel.fromEntity(SessionDataItemEntity entity) =>
      SessionDataItemModel(
        second: entity.second,
        timeStamp: entity.timeStamp,
        devices: entity.devices
            ?.map((e) => SessionDataItemDeviceModel.fromEntity(e))
            .toList(),
      );
}

@freezed
class SessionDataItemDeviceModel with _$SessionDataItemDeviceModel {
  const factory SessionDataItemDeviceModel({
    String? type,
    String? identifier,
    String? brand,
    String? model,
    List<Map<String, dynamic>>? value,
  }) = _SessionDataItemDeviceModel;

  const SessionDataItemDeviceModel._();

  factory SessionDataItemDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemDeviceModelFromJson(json);

  SessionDataItemDeviceEntity toEntity() => SessionDataItemDeviceEntity(
        type: type,
        identifier: identifier,
        brand: brand,
        model: model,
        value: value,
      );

  factory SessionDataItemDeviceModel.fromEntity(
          SessionDataItemDeviceEntity entity) =>
      SessionDataItemDeviceModel(
        type: entity.type,
        identifier: entity.identifier,
        brand: entity.brand,
        model: entity.model,
        value: entity.value,
      );
}
