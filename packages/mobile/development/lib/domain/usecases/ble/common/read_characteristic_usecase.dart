import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadCharacteristicUsecase
    extends WithParamsUseCase<List<int>, BluetoothParams> {
  final BluetoothRepository _repo;

  ReadCharacteristicUsecase(this._repo);

  @override
  Future<Either<Failure, List<int>>> call(BluetoothParams params) =>
      _repo.commonServiceRead(params);
}
