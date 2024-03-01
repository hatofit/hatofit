part of 'navigation_cubit.dart';

@unfreezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    @Default(CubitStatus.initial) CubitStatus status,
    bool? isScanning,
    BluetoothAdapterState? state,
    @Default([]) List<BleEntity> fDevices,
    BleEntity? cDevice,
    BluetoothFailure? bleFailure,
    BluetoothConnectionState? conState,
    @Default(false) bool isLoading,
    PolarHrSample? hrSample,
    List<PolarEcgSample>? ecgSample,
    PolarAccSample? accSample,
    PolarGyroSample? gyroSample,
    PolarMagnetometerSample? magnetometerSample,
    PolarPpgSample? ppgSample,
  }) = _NavigationState;
}
