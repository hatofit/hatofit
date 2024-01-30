import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final BleRemoteDataSource _client;

  BluetoothRepositoryImpl(this._client);

  @override
  Future<Either<Failure, void>> connectToDevice(
    BluetoothParams params,
  ) async {
    final res = await _client.connectToDevice(params);
    return res;
  }

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions() async {
    final res = await _client.requestPermissions();
    return res;
  }

  @override
  Stream<Either<Failure, DiscoveredDevice>> scanDevices() async* {
    final res = _client.scanDevices();
    await for (final device in res) {
      yield device;
    }
  }
}
