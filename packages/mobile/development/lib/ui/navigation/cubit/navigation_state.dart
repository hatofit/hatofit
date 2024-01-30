part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;
  const factory NavigationState.bluetoothOff() = _BluetoothOff;
  const factory NavigationState.bluetoothOn() = _BluetoothOn;
  const factory NavigationState.searching() = _Searching;
  const factory NavigationState.found(List<DiscoveredDevice> devices) = _Found;
  const factory NavigationState.failure(String message) = _Failure;
  const factory NavigationState.connecting() = _Connecting;
  const factory NavigationState.connected() = _Connected;
}
