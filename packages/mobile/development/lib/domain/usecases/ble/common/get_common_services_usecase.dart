import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetCommonServicesUsecase
    extends WithParamsUseCase<List<Service>, BluetoothParams> {
  final BluetoothRepository _repo;

  GetCommonServicesUsecase(this._repo);

  @override
  Future<Either<Failure, List<Service>>> call(BluetoothParams params) =>
      _repo.getCommonServices(params);
}
