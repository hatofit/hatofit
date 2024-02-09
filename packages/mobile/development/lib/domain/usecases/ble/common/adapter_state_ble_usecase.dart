import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class AdapterStateBLEUsecase extends SNPC<BluetoothAdapterState> {
  final CommonBLERepo _repo;

  AdapterStateBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, BluetoothAdapterState>> call() => _repo.adapterState();
}
