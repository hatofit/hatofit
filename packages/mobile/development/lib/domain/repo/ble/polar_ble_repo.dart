import 'package:dartz/dartz.dart';
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
  Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> streamHr(
    StreamPolarParams params,
  );
  Stream<Either<Failure, PolarStreamingData<PolarEcgSample>>> streamEcg(
    StreamPolarParams params,
  );
}
