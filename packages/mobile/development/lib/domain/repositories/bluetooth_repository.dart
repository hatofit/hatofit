import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

abstract class BluetoothRepository {
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions();
  Stream<Either<Failure, PolarDeviceInfo>> scanDevices();
  Future<Either<Failure, void>> connectToDevice(BluetoothParams params);
}
