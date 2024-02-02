import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ConnectCommonBleUsecase
    extends StreamUseCase<ConnectionStateUpdate, BluetoothParams> {
  final BluetoothRepository _repo;

  ConnectCommonBleUsecase(this._repo);

  @override
  Stream<Either<Failure, ConnectionStateUpdate>> call(BluetoothParams params) =>
      _repo.connectToCommonDevice(params);
}
