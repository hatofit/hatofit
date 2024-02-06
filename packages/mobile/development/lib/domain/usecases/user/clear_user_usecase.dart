import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart'; 

class ClearUserUsecase extends NoParamsUseCase<void> {
  final UserRepo _userRepo;

  ClearUserUsecase(this._userRepo);

  @override
  Future<Either<Failure, void>> call() async => await _userRepo.clearUser();
}
