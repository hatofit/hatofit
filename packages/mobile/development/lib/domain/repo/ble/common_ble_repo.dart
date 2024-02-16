import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';

abstract class CommonBLERepo {
  Stream<Either<Failure, BluetoothAdapterState>> adapterState();
  Future<Either<Failure, void>> scanDevices(
    StartScanCommonParams params,
  );
  Stream<Either<Failure, List<BleEntity>>> scanResults();
  Future<Either<Failure, void>> stopScan(
    StopScanCommonParams params,
  );
  Stream<Either<Failure, bool>> isScanning();
  Future<Either<Failure, void>> connectToDevice(
    ConnectCommonParams params,
  );
  Future<Either<Failure, void>> disconnectDevice(
    DisconnectCommonParams params,
  );
  Future<Either<Failure, List<BluetoothService>>> discoverServices(
    GetCommonServicesParams params,
  );
  Future<Either<Failure, List<int>>> readCharacteristic(
    ReadCommonParams params,
  );
  Stream<Either<Failure, List<int>>> subscribeToCharacteristic(
    StreamCommonParams params,
  );
  Future<Either<Failure, void>> writeCharacteristic(
    WriteCommonParams params,
  );
  Future<Either<Failure, void>> requestMtu(
    RequestMtuCommonParams params,
  );
  Future<Either<Failure, void>> clearGattCache(
    ClearGattCommonParams params,
  );
}
