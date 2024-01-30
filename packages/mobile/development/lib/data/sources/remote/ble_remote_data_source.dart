import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class BleRemoteDataSource {
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions();
  Stream<Either<Failure, DiscoveredDevice>> scanDevices();
  Future<Either<Failure, void>> connectToDevice(BluetoothParams params);
}

class BleRemoteDataSourceImpl implements BleRemoteDataSource {
  final BleClient _client;

  BleRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, void>> connectToDevice(
    BluetoothParams params,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions() async {
    final res = await _client.requestPermissions();
    return res;
  }

  @override
  Stream<Either<Failure, DiscoveredDevice>> scanDevices() async* {
    final res = _client.scanDevices([Uuid.parse("180D")]);
    await for (final device in res) {
      yield device;
    }
  }
}
