import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ClearGattCacheUsecase extends WithParamsUseCase<void, BluetoothParams> {
  final BluetoothRepository _repo;

  ClearGattCacheUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(BluetoothParams params) {
    return _repo.clearGatt(params);
  }
}
