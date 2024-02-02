import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/entities/bluetooth/bluetooth_entity.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

class BleClient with MainBoxMixin, FirebaseCrashLogger {
  static final Uuid _dvcInfSrv =
      Uuid.parse("0000180a-0000-1000-8000-00805f9b34fb");
  static final Uuid _btrySrv =
      Uuid.parse("0000180a-0000-1000-8000-00805f9b34fb");
  late FlutterReactiveBle _common;
  late Polar _polar;

  BleClient() {
    try {
      _common = _createCommon();
      _polar = _createPolar();
      polarInterceptor(_polar);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  FlutterReactiveBle get common {
    try {
      _common = _createCommon();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _common;
  }

  Polar get polar {
    try {
      _polar = _createPolar();
      polarInterceptor(_polar);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _polar;
  }

  polarInterceptor(Polar p) {
    p.deviceConnected.listen((event) {
      log?.i("Polar device connected: ${event.deviceId}");
    });
    p.deviceConnecting.listen((event) {
      log?.i("Polar device connected: ${event.deviceId}");
    });
    p.deviceDisconnected.listen((event) {
      log?.i("Polar device disconnected: ${event.info.deviceId}");
    });
  }

  Polar _createPolar() => Polar();
  FlutterReactiveBle _createCommon() => FlutterReactiveBle();

  ///
  /// [Common] methods
  ///
  Stream<Either<Failure, BluetoothEntity>> scanDevices(
    List<Uuid> serviceIds,
  ) async* {
    try {
      final res = common.scanForDevices(
        withServices: serviceIds,
        requireLocationServicesEnabled: false,
      );
      await for (final device in res) {
        yield Right(BluetoothEntity(common: device, commonId: device.id));
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, ConnectionStateUpdate>> connectToCommonDevice({
    required String deviceId,
  }) async* {
    try {
      final res = common.connectToDevice(id: deviceId);
      await for (final status in res) {
        yield Right(status);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, List<Service>>> getCommonServices(
    String deviceId,
  ) async {
    try {
      await common.discoverAllServices(deviceId);
      final res = await common.getDiscoveredServices(deviceId);
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, List<int>>> commonServiceStream(
    Uuid uuid,
    Service service,
  ) async* {
    try {
      final res = service.characteristics
          .firstWhere(
            (e) => e.id == uuid,
          )
          .subscribe();
      await for (final data in res) {
        yield Right(data);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, List<int>>> commonServiceRead(
    Uuid uuid,
    Service service,
  ) async {
    try {
      final res = await service.characteristics
          .firstWhere(
            (e) => e.id == uuid,
          )
          .read();
      return Right(res);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, List<int>>> commonServiceSubscribe(
    Uuid uuid,
    Service service,
  ) async* {
    try {
      final res = service.characteristics
          .firstWhere(
            (e) => e.id == uuid,
          )
          .subscribe();
      await for (final data in res) {
        yield Right(data);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Stream<Either<Failure, BleStatus>> bleStatus() async* {
    try {
      final res = common.statusStream;
      await for (final data in res) {
        yield Right(data);
      }
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      yield Left(BluetoothFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> clearGatt(String deviceId) async {
    try {
      await common.clearGattCache(deviceId);
      return const Right(null);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return Left(BluetoothFailure(error.toString()));
    }
  }

  ///
  /// [Polar] methods
  ///
  // get app permissions using polar reference
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

  Future<Either<Failure, void>> connectToPolarDevice({
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

  Stream<Either<Failure, PolarStreamingData>> polarEcgStream(
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

  Stream<Either<Failure, PolarStreamingData>> polarAccStream(
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

  Stream<Either<Failure, PolarStreamingData>> polarGyroStream(
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

  Stream<Either<Failure, PolarStreamingData>> polarMagnetometerStream(
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

  Stream<Either<Failure, PolarStreamingData>> polarPpgStream(
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
