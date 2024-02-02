import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ConnectPolarBleUsecase extends WithParamsUseCase<void, BluetoothParams> {
  final BluetoothRepository _repo;

  ConnectPolarBleUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(BluetoothParams params) =>
      _repo.connectToPolarDevice(params);
}
