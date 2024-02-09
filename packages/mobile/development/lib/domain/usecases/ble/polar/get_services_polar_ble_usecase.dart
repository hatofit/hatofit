import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class GetServicesPolarBLEUsecase
    extends FPUC<Set<PolarDataType>, GetPolarServicesParams> {
  final PolarBLERepo _repo;

  GetServicesPolarBLEUsecase(this._repo);

  @override
  Future<Either<Failure, Set<PolarDataType>>> call(
          GetPolarServicesParams params) =>
      _repo.getPolarServices(params);
}
