part of 'navigation_cubit.dart';

@unfreezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    bool? isBleOn,
    bool? isScanning,
    ConnectionStateUpdate? state,
    List<BluetoothEntity>? devices,
    Set<PolarDataType>? polarTypes,
    List<Service>? commonServices,
    int? hr,
  }) = _NavigationState;
}
