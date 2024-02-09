import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadTokenUsecase extends ENPUC<String> {
  final UserRepo _repo;

  ReadTokenUsecase(this._repo);

  @override
  Either<Failure, String> call() => _repo.readToken();
}
