import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class UpdateUserUsecase
    extends WithParamsUseCase<UserEntity, UpdateUserParams> {
  final UserRepo _repo;

  UpdateUserUsecase(this._repo);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateUserParams params) async =>
      await _repo.updateUser(params);
}
