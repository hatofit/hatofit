import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetOfflineModeUsecase extends FNPUC<bool> {
  final AppConfigRepo _repo;

  GetOfflineModeUsecase(this._repo);

  @override
  Future<Either<Failure, bool>> call() async => _repo.readOfflineMode();
}
