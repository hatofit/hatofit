import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ScanCommonBLEUsecase extends FPUC<void, StartScanCommonParams> {
  final CommonBLERepo _repo;

  ScanCommonBLEUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(StartScanCommonParams params) =>
      _repo.scanDevices(params);
}
