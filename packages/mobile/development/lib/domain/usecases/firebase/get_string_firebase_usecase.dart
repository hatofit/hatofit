import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetStringFirebaseUsecase extends FPUC<String, String> {
  final FirebaseRemoteConfigRepo _repo;

  GetStringFirebaseUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call(String params) =>
      _repo.getString(params);
}
