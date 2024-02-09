import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

abstract class PolarBLERepo {
  Future<Either<Failure, Map<Permission, PermissionStatus>>>
      requestPermissions();
  Future<Either<Failure, void>> connectToDevice(
    ConnectPolarParams params,
  );
  Future<Either<Failure, void>> disconnectFromDevice(
    DisconnectPolarParams params,
  );
  Future<Either<Failure, Set<PolarDataType>>> getPolarServices(
    GetPolarServicesParams params,
  );
  Stream<Either<Failure, BluetoothConnectionState>> polarState();
  Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> streamHr(
    StreamPolarParams params,
  );
  Stream<Either<Failure, PolarStreamingData<PolarEcgSample>>> streamEcg(
    StreamPolarParams params,
  );
  Stream<Either<Failure, PolarStreamingData<PolarAccSample>>> streamAcc(
    StreamPolarParams params,
  );
  Stream<Either<Failure, PolarStreamingData<PolarGyroSample>>> streamGyro(
    StreamPolarParams params,
  );
  Stream<Either<Failure, PolarStreamingData<PolarMagnetometerSample>>>
      streamMagnetometer(
    StreamPolarParams params,
  );
  Stream<Either<Failure, PolarStreamingData<PolarPpgSample>>> streamPpg(
    StreamPolarParams params,
  );
}
