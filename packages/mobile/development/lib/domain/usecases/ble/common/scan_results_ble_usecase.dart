import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ScanResultsBLEUsecase extends SNPC<List<BleEntity>> {
  final CommonBLERepo _repo;

  ScanResultsBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, List<BleEntity>>> call() => _repo.scanResults();
}
