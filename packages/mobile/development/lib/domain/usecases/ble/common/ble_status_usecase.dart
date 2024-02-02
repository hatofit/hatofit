import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class BleStatusUcecase extends StreamNoParamsUseCase<BleStatus> {
  final BluetoothRepository _repo;

  BleStatusUcecase(this._repo);

  @override
  Stream<Either<Failure, BleStatus>> call() => _repo.bleStatus();
}
