import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ConnectPolarBLEUsecase extends FPUC<void, ConnectPolarParams> {
  final PolarBLERepo _repo;

  ConnectPolarBLEUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(ConnectPolarParams params) =>
      _repo.connectToDevice(params);
}
