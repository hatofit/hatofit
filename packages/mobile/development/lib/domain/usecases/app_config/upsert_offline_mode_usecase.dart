import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpdateOfflineModeUsecase extends FPUC<bool, bool> {
  final AppConfigRepo _appConfigRepo;

  UpdateOfflineModeUsecase(this._appConfigRepo);

  @override
  Future<Either<Failure, bool>> call(bool params) {
    return _appConfigRepo.upsertOfflineMode(params);
  }
}
