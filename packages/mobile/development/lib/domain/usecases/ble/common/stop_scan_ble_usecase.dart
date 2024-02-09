import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class StopScanBLEUsecase extends FPUC<void, StopScanCommonParams> {
  final CommonBLERepo _repo;

  StopScanBLEUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(StopScanCommonParams params) =>
      _repo.stopScan(params);
}
