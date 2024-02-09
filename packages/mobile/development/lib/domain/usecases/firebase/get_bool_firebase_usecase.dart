import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetBoolFirebaseUsecase extends FPUC<bool, String> {
  final FirebaseRemoteConfigRepo _repo;

  GetBoolFirebaseUsecase(this._repo);

  @override
  Future<Either<Failure, bool>> call(String params) => _repo.getBool(params);
}
