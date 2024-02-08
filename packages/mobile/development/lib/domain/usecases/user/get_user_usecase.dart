import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetUserUsecase extends WithParamsUseCase<UserEntity,GetUserParams> {
  final UserRepo _repo;

  GetUserUsecase(this._repo);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async => await _repo.getUser(params);
}
