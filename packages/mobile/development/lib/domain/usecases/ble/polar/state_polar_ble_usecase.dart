import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class StatePolarBleUsecase extends SNPC<BluetoothConnectionState> {
  final PolarBLERepo _repo;

  StatePolarBleUsecase(this._repo);

  @override
  Stream<Either<Failure, BluetoothConnectionState>> call() =>
      _repo.polarState();
}
