import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class CommonBLERepoImpl implements CommonBLERepo {
  final CommonClient _client;

  CommonBLERepoImpl(this._client);

  @override
  Stream<Either<Failure, BluetoothAdapterState>> adapterState() async* {
    await for (final state in _client.adapterState()) {
      yield state;
    }
  }

  @override
  Future<Either<Failure, void>> clearGattCache(
    ClearGattCommonParams params,
  ) async =>
      await _client.clearGattCache(params.device);

  @override
  Future<Either<Failure, void>> connectToDevice(
    ConnectCommonParams params,
  ) async =>
      await _client.connectToDevice(
        params.device,
        timeout: params.timeout,
        mtu: params.mtu,
        autoConnect: params.autoConnect,
      );

  @override
  Future<Either<Failure, void>> disconnectDevice(
    DisconnectCommonParams params,
  ) async =>
      await _client.disconnectDevice(params.device);

  @override
  Future<Either<Failure, List<BluetoothService>>> discoverServices(
    GetCommonServicesParams params,
  ) async =>
      await _client.discoverServices(params.device);

  @override
  Stream<Either<Failure, bool>> isScanning() async* {
    await for (final state in _client.isScanning()) {
      yield state;
    }
  }

  @override
  Future<Either<Failure, List<int>>> readCharacteristic(
    ReadCommonParams params,
  ) async =>
      await _client.readCharacteristic(
        params.characteristic,
        timeout: params.timeout,
      );

  @override
  Future<Either<Failure, void>> requestMtu(
    RequestMtuCommonParams params,
  ) async =>
      await _client.requestMtu(
        params.device,
        params.mtu,
        predelay: params.predelay,
        timeout: params.timeout,
      );

  @override
  Future<Either<Failure, void>> scanDevices(
    StartScanCommonParams params,
  ) async =>
      await _client.scanDevices(params.serviceIds, params.timeout);

  static String? getPolarId(String name) {
    if (name.contains("Polar")) {
      return name.split(' ').last;
    }
    return null;
  }

  @override
  Stream<Either<Failure, List<BleEntity>>> scanResults() async* {
    await for (final res in _client.scanResults()) {
      yield res.fold((l) {
        return Left(l);
      }, (r) {
        final List<BleEntity> dvcs = [];
        for (final d in r) {
          dvcs.add(BleEntity(
            name: d.advertisementData.advName,
            rssi: d.rssi,
            device: d.device,
            address: d.device.remoteId.str,
            isConnectable: d.advertisementData.connectable,
            timeStamp: d.timeStamp,
            polarId: getPolarId(d.advertisementData.advName),
          ));
        }
        return Right(dvcs);
      });
    }
  }

  @override
  Future<Either<Failure, void>> stopScan(
    StopScanCommonParams params,
  ) async =>
      await _client.stopScan(params.subscription);

  @override
  Stream<Either<Failure, List<int>>> subscribeToCharacteristic(
    StreamCommonParams params,
  ) async* {
    await for (final value in _client.subscribeToCharacteristic(
      params.characteristic,
    )) {
      yield value;
    }
  }

  @override
  Future<Either<Failure, void>> writeCharacteristic(
    WriteCommonParams params,
  ) async =>
      await _client.writeCharacteristic(
        params.characteristic,
        params.value,
        withoutResponse: params.withoutResponse,
        allowLongWrite: params.allowLongWrite,
        timeout: params.timeout,
      );
}
