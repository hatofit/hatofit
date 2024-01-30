import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class MeUseCase extends NoParamsUseCase<AuthResponseEntity> {
  final AuthRepository repository;

  MeUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponseEntity>> call() => repository.me();
}
