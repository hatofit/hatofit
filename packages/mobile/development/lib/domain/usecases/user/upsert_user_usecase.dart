import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpsertUserUsecase extends FPUC<UserEntity, RegisterParams> {
  final UserRepo _repo;

  UpsertUserUsecase(this._repo);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) =>
      _repo.upsertUser(params);
}
