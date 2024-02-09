import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetServicesCommonBLEUsecase
    extends FPUC<List<BluetoothService>, GetCommonServicesParams> {
  final CommonBLERepo _repo;

  GetServicesCommonBLEUsecase(this._repo);

  @override
  Future<Either<Failure, List<BluetoothService>>> call(
          GetCommonServicesParams params) =>
      _repo.discoverServices(params);
}
