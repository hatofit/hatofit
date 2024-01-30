import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final BleClient _client;

  BluetoothRepositoryImpl(this._client);

  @override
  Future<Either<Failure, void>> connectToDevice(BluetoothParams params) {
    // TODO: implement connectToDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions() {
    // TODO: implement requestPermissions
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, PolarDeviceInfo>> scanDevices() {
    // TODO: implement scanDevices
    throw UnimplementedError();
  }
}
