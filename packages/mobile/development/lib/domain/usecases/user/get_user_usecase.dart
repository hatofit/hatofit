import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetUserUsecase extends NoParamsUseCase<UserEntity> {
  final UserRepository _repo;

  GetUserUsecase(this._repo);

  @override
  Future<Either<Failure, UserEntity>> call() => _repo.getUser();
}
