import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadUserUsecase extends FPUC<UserEntity, ByLimitParams> {
  final UserRepo _repo;

  ReadUserUsecase(this._repo);

  @override
  Future<Either<Failure, UserEntity>> call(ByLimitParams params) =>
      _repo.readUser(params);
}
