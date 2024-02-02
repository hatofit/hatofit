import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ScanBluetoothUsecase extends StreamNoParamsUseCase<void> {
  final BluetoothRepository _repo;

  ScanBluetoothUsecase(this._repo);

  @override
  Stream<Either<Failure, BluetoothEntity>> call() => _repo.scanDevices();
}
