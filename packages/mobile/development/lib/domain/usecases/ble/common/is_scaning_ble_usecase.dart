import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class IsScanningBLEUsecase extends SNPC<bool> {
  final CommonBLERepo _repo;

  IsScanningBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, bool>> call() => _repo.isScanning();
}
