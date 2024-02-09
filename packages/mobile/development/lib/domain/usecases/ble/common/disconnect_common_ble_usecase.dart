import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class DisconnectCommonBleUsecase extends FPUC<void, DisconnectCommonParams> {
  final CommonBLERepo _repo;

  DisconnectCommonBleUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(DisconnectCommonParams params) =>
      _repo.disconnectDevice(params);
}
