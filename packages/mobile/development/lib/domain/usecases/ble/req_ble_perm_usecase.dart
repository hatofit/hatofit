import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';

class ReqBLEPermUsecase extends FNPUC<Map<Permission, PermissionStatus>> {
  final PolarBLERepo _repo;

  ReqBLEPermUsecase(this._repo);

  @override
  Future<Either<Failure, Map<Permission, PermissionStatus>>> call() async =>
      await _repo.requestPermissions();
}
