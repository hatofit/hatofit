import 'dart:async';
import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/services/firebase/firebase.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

class PolarClient with FirebaseCrashLogger {
  late Polar _polar;

  PolarClient() {
    try {
      _polar = _createPolar();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
    }
  }

  Polar get polar {
    try {
      _polar = _createPolar();
    } catch (e, s) {
      nonFatalError(error: e, stackTrace: s);
    }
    return _polar;
  }

  Polar _createPolar() => Polar();

  Stream<Either<Failure, BluetoothConnectionState>> polarInterceptor() async* {
    await for (final _ in polar.deviceConnected) {
      yield const Right(BluetoothConnectionState.connected);
    }
    await for (final _ in polar.deviceConnecting) {
      yield const Right(BluetoothConnectionState.connecting);
    }
    await for (final _ in polar.deviceDisconnected) {
      yield const Right(BluetoothConnectionState.disconnected);
    }
  }

  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions() async {
    try {
      await polar.requestPermissions();
      final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidDeviceInfo.version.sdkInt;
      final Map<Permission, PermissionStatus> permissions = HashMap();
      if (sdkInt >= 23) {
        if (sdkInt < 31) {
          final loc = await Permission.location.request();
          permissions[Permission.location] = loc;
        }
        if (sdkInt >= 31) {
          final bScan = await Permission.bluetoothScan.request();
          final bConn = await Permission.bluetoothConnect.request();
          permissions[Permission.bluetoothScan] = bScan;
          permissions[Permission.bluetoothConnect] = bConn;
        }
      }
      return Right(permissions);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> connectToDevice({
    required String deviceId,
  }) async {
    try {
      await polar.connectToDevice(deviceId);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> disconnectFromDevice({
    required String deviceId,
  }) async {
    try {
      await polar.disconnectFromDevice(deviceId);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  // get all available service
  Future<Either<Failure, Set<PolarDataType>>> getPolarServices(
    String deviceId,
    PolarSdkFeature feature,
  ) async {
    try {
      await polar.sdkFeatureReady.firstWhere(
        (e) => e.identifier == deviceId && e.feature == feature,
      );
      final feat = await polar.getAvailableOnlineStreamDataTypes(deviceId);
      return Right(feat);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> polarHrStream(
    String deviceId,
    Set<PolarDataType> types,
  ) async* {
    try {
      if (types.contains(PolarDataType.hr)) {
        final Stream<PolarStreamingData<PolarHrSample>> res =
            polar.startHrStreaming(deviceId);
        await for (final data in res) {
          yield Right(data);
        }
      } else {
        yield const Left(NoDataFailure("No HR data available"));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, PolarStreamingData<PolarEcgSample>>> polarEcgStream(
    String deviceId,
    Set<PolarDataType> types,
  ) async* {
    try {
      if (types.contains(PolarDataType.ecg)) {
        final res = polar.startEcgStreaming(deviceId);
        await for (final data in res) {
          yield Right(data);
        }
      } else {
        yield const Left(NoDataFailure("No Ecg data available"));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, PolarStreamingData<PolarAccSample>>> polarAccStream(
    String deviceId,
    Set<PolarDataType> types,
  ) async* {
    try {
      if (types.contains(PolarDataType.acc)) {
        final res = polar.startAccStreaming(deviceId);
        await for (final data in res) {
          yield Right(data);
        }
      } else {
        yield const Left(NoDataFailure("No Acc data available"));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, PolarStreamingData<PolarGyroSample>>> polarGyroStream(
    String deviceId,
    Set<PolarDataType> types,
  ) async* {
    try {
      if (types.contains(PolarDataType.gyro)) {
        final res = polar.startGyroStreaming(deviceId);
        await for (final data in res) {
          yield Right(data);
        }
      } else {
        yield const Left(NoDataFailure("No Gyro data available"));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, PolarStreamingData<PolarMagnetometerSample>>>
      polarMagnetometerStream(
    String deviceId,
    Set<PolarDataType> types,
  ) async* {
    try {
      if (types.contains(PolarDataType.magnetometer)) {
        final res = polar.startMagnetometerStreaming(deviceId);
        await for (final data in res) {
          yield Right(data);
        }
      } else {
        yield const Left(NoDataFailure("No Magnetometer data available"));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, PolarStreamingData<PolarPpgSample>>> polarPpgStream(
    String deviceId,
    Set<PolarDataType> types,
  ) async* {
    try {
      if (types.contains(PolarDataType.ppg)) {
        final res = polar.startPpgStreaming(deviceId);
        await for (final data in res) {
          yield Right(data);
        }
      } else {
        yield const Left(NoDataFailure("No Ppg data available"));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }
}
