import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final PolarClient _client;

  BluetoothRepositoryImpl(this._client);

  @override
  Future<Either<Failure, void>> connectToDevice(BluetoothParams params) {
    return _client.connectToDevice(params.deviceId);
  }

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions() {
    return _client.requestPermissions();
  }

  @override
  Stream<Either<Failure, PolarDeviceInfo>> scanDevices() {
    return _client.scanDevices();
  }
}
