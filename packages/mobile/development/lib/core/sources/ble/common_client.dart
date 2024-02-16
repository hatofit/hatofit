import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/services/firebase/firebase.dart';

class CommonClient with FirebaseCrashLogger {
  Stream<Either<Failure, BluetoothAdapterState>> adapterState() async* {
    try {
      await for (final state in FlutterBluePlus.adapterState) {
        yield Right(state);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> scanDevices(
    List<Guid> serviceIds,
    Duration? timeout,
  ) async {
    try {
      return Right(await FlutterBluePlus.startScan(
        withServices: serviceIds,
        timeout: timeout,
      ));
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      return Left(BluetoothFailure(e.toString()));
    }
  }

  Stream<Either<Failure, List<ScanResult>>> scanResults() async* {
    try {
      await for (final device in FlutterBluePlus.scanResults) {
        yield Right(device);
      }
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
      yield Left(BluetoothFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> stopScan(
    StreamSubscription<dynamic> subscription,
  ) async {
    try {
      FlutterBluePlus.cancelWhenScanComplete(subscription);
      return Right(await FlutterBluePlus.stopScan());
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, bool>> isScanning() async* {
    try {
      await for (final state in FlutterBluePlus.isScanning) {
        yield Right(state);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> connectToDevice(
    BluetoothDevice device, {
    Duration timeout = const Duration(seconds: 35),
    int? mtu = 512,
    bool autoConnect = false,
  }) async {
    try {
      return Right(await device.connect(
          timeout: timeout, mtu: mtu, autoConnect: autoConnect));
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> disconnectDevice(
    BluetoothDevice device,
  ) async {
    try {
      return Right(await device.disconnect());
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, List<BluetoothService>>> discoverServices(
    BluetoothDevice device, {
    bool subscribeToServicesChanged = true,
    int timeout = 15,
  }) async {
    try {
      return Right(await device.discoverServices());
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, List<int>>> readCharacteristic(
    BluetoothCharacteristic characteristic, {
    int timeout = 15,
  }) async {
    try {
      return Right(await characteristic.read(timeout: timeout));
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, List<int>>> subscribeToCharacteristic(
    BluetoothCharacteristic characteristic,
  ) async* {
    try {
      await for (final data in characteristic.lastValueStream) {
        yield Right(data);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> writeCharacteristic(
    BluetoothCharacteristic characteristic,
    List<int> value, {
    bool withoutResponse = false,
    bool allowLongWrite = false,
    int timeout = 15,
  }) async {
    try {
      return Right(await characteristic.write(
        value,
        withoutResponse: withoutResponse,
        timeout: timeout,
        allowLongWrite: allowLongWrite,
      ));
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> clearGattCache(
    BluetoothDevice device,
  ) async {
    try {
      return Right(await device.clearGattCache());
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, int>> requestMtu(
    BluetoothDevice device,
    int desiredMtu, {
    double predelay = 0.35,
    int timeout = 15,
  }) async {
    try {
      final res = await device.requestMtu(desiredMtu,
          predelay: predelay, timeout: timeout);
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }
}
