import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/repositories/bluetooth_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestBluetoothUsecase
    extends NoParamsUseCase<Map<Permission, PermissionStatus>> {
  final BluetoothRepository _repo;

  RequestBluetoothUsecase(this._repo);

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>> call() =>
      _repo.requestPermissions();
}
