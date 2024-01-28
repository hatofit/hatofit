import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ConnectBluetoothUsecase extends WithParamsUseCase<void, BluetoothParams> {
  final BluetoothRepository _repo;

  ConnectBluetoothUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(BluetoothParams params) async =>
      await _repo.connectToDevice(params);
}
