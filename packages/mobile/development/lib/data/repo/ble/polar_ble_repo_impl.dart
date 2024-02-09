import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

class PolarBLERepoImpl implements PolarBLERepo {
  final PolarClient _client;

  PolarBLERepoImpl(this._client);

  @override
  Future<Either<Failure, void>> connectToDevice(
    ConnectPolarParams params,
  ) async =>
      await _client.connectToDevice(deviceId: params.deviceId);

  @override
  Future<Either<Failure, void>> disconnectFromDevice(
    DisconnectPolarParams params,
  ) async =>
      await _client.disconnectFromDevice(deviceId: params.deviceId);

  @override
  Future<Either<Failure, Set<PolarDataType>>> getPolarServices(
    GetPolarServicesParams params,
  ) async =>
      await _client.getPolarServices(params.deviceId, params.feature);

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions() async => await _client.requestPermissions();

  @override
  Stream<Either<Failure, BluetoothConnectionState>> polarState() async* {
    await for (final data in _client.polarInterceptor()) {
      yield data;
    }
  }

  @override
  Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> streamHr(
    StreamPolarParams params,
  ) async* {
    await for (final data
        in _client.polarHrStream(params.deviceId, params.types)) {
      yield data;
    }
  }

  @override
  Stream<Either<Failure, PolarStreamingData<PolarEcgSample>>> streamEcg(
    StreamPolarParams params,
  ) async* {
    await for (final data
        in _client.polarEcgStream(params.deviceId, params.types)) {
      yield data;
    }
  }

  @override
  Stream<Either<Failure, PolarStreamingData<PolarAccSample>>> streamAcc(
    StreamPolarParams params,
  ) async* {
    await for (final data
        in _client.polarAccStream(params.deviceId, params.types)) {
      yield data;
    }
  }

  @override
  Stream<Either<Failure, PolarStreamingData<PolarGyroSample>>> streamGyro(
    StreamPolarParams params,
  ) async* {
    await for (final data
        in _client.polarGyroStream(params.deviceId, params.types)) {
      yield data;
    }
  }

  @override
  Stream<Either<Failure, PolarStreamingData<PolarMagnetometerSample>>>
      streamMagnetometer(
    StreamPolarParams params,
  ) async* {
    await for (final data
        in _client.polarMagnetometerStream(params.deviceId, params.types)) {
      yield data;
    }
  }

  @override
  Stream<Either<Failure, PolarStreamingData<PolarPpgSample>>> streamPpg(
    StreamPolarParams params,
  ) async* {
    await for (final data
        in _client.polarPpgStream(params.deviceId, params.types)) {
      yield data;
    }
  }
}
