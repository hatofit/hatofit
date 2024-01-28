part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.scanning() = _Scanning;
  const factory HomeState.scanned() = _Scanned;
}
