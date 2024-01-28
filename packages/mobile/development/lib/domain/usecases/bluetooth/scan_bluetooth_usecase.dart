import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class ScanBluetoothUsecase extends StreamNoParamsUseCase<void> {
  final BluetoothRepository _repo;

  ScanBluetoothUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarDeviceInfo>> call() => _repo.scanDevices();
}
