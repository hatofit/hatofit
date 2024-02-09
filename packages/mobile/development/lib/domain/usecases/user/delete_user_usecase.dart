import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class DeleteUserUsecase extends FNPUC<void> {
  final UserRepo _userRepo;

  DeleteUserUsecase(this._userRepo);

  @override
  Future<Either<Failure, void>> call() => _userRepo.deleteUser();
}
