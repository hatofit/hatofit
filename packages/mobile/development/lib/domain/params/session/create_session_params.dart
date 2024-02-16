import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_session_params.freezed.dart';
part 'create_session_params.g.dart';

@freezed
class CreateSessionParams with _$CreateSessionParams {
  const factory CreateSessionParams({
    @Default("") String userId,
    @Default("") String exerciseId,
    @Default(0) int startTime,
    @Default(0) int endTime,
    @Default("") String mood,
    @Default([]) List<SessionTimelineParams> timelines,
    @Default([]) List<SessionDataItemParams> data,
  }) = _CreateSessionParams;

  factory CreateSessionParams.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionParamsFromJson(json);
}

@freezed
class SessionTimelineParams with _$SessionTimelineParams {
  const factory SessionTimelineParams({
    @Default("") String name,
    @Default(0) int startTime,
  }) = _SessionTimelineParams;

  factory SessionTimelineParams.fromJson(Map<String, dynamic> json) =>
      _$SessionTimelineParamsFromJson(json);
}

@freezed
class SessionDataItemParams with _$SessionDataItemParams {
  const factory SessionDataItemParams({
    @Default(0) int second,
    @Default(0) int timeStamp,
    @Default([]) List<SessionDataItemDeviceParams> devices,
  }) = _SessionDataItemParams;

  factory SessionDataItemParams.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemParamsFromJson(json);
}

@freezed
class SessionDataItemDeviceParams with _$SessionDataItemDeviceParams {
  const factory SessionDataItemDeviceParams({
    @Default("") String type,
    @Default("") String identifier,
    @Default("") String brand,
    @Default("") String model,
    @Default([]) List<Map<String, dynamic>> value,
  }) = _SessionDataItemDeviceParams;

  factory SessionDataItemDeviceParams.fromJson(Map<String, dynamic> json) =>
      _$SessionDataItemDeviceParamsFromJson(json);
}
