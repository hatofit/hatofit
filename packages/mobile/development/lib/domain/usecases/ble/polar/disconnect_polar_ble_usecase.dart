import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class DisconnectPolarBLEUsecase extends FPUC<void, DisconnectPolarParams> {
  final PolarBLERepo _repo;

  DisconnectPolarBLEUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(DisconnectPolarParams params) =>
      _repo.disconnectFromDevice(params);
}
