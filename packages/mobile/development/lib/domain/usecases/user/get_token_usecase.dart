import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetTokenUsecase extends NoParamsUseCase<String> {
  final UserRepo _repo;

  GetTokenUsecase(this._repo);

  @override
  Future<Either<Failure, String>> call() async => _repo.getToken();
}
