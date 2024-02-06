import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart'; 

class ClearTokenUsecase extends NoParamsUseCase<void> {
  final UserRepo _userRepo;

  ClearTokenUsecase(this._userRepo);

  @override
  Future<Either<Failure, void>> call() async => await _userRepo.clearToken();
}
