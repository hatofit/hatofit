import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpdateTokenUsecase extends FPUC<String, String> {
  final UserRepo _repo;

  UpdateTokenUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call(String params) async =>
      await _repo.upsertToken(params);
}
