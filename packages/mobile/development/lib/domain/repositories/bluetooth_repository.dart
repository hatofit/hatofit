import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class BluetoothRepository {
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions();
  Stream<Either<Failure, DiscoveredDevice>> scanDevices();
  Future<Either<Failure, void>> connectToDevice(BluetoothParams params);
  Stream<Either<Failure, BleStatus>> bleStatus();
}
