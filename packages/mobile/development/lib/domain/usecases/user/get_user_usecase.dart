import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetUserUsecase extends NoParamsUseCase<UserEntity> {
  final UserRepo _repo;

  GetUserUsecase(this._repo);

  @override
  Future<Either<Failure, UserEntity>> call() async => await _repo.getUser();
}
