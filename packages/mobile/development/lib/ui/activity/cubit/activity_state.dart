part of 'activity_cubit.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.loading() = _Loading;
  const factory ActivityState.success(List<SessionEntity> session) = _Success;
  const factory ActivityState.failure(Failure message) = _Failure;
}
