import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class GetPolarServicesUsecase
    extends WithParamsUseCase<Set<PolarDataType>, BluetoothParams> {
  final BluetoothRepository _repo;

  GetPolarServicesUsecase(this._repo);

  @override
  Future<Either<Failure, Set<PolarDataType>>> call(BluetoothParams params) =>
      _repo.getPolarServices(params);
}
