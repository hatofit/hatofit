part of 'navigation_cubit.dart';

@unfreezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    bool? isScanning,
    BluetoothAdapterState? state,
    List<BleEntity>? fDevices,
    BleEntity? cDevice,
    PolarHrSample? hrSample,
    BluetoothFailure? bleFailure,
    BluetoothConnectionState? conState,
    @Default(false) bool isLoading,
  }) = _NavigationState;
}
