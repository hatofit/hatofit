part of 'navigation_cubit.dart';

@unfreezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    bool? isScanning,
    BluetoothAdapterState? state,
    List<BleEntity>? fDevices,
    BleEntity? cDevice,
    int? hr,
    BluetoothFailure? bleFailure,
    @Default(false) bool isLoading,
  }) = _NavigationState;
}
