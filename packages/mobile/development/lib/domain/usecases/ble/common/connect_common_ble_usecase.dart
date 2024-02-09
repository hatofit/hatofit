import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ConnectCommonBLEUsecase extends FPUC<void, ConnectCommonParams> {
  final CommonBLERepo _repo;

  ConnectCommonBLEUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(ConnectCommonParams params) =>
      _repo.connectToDevice(params);
}
