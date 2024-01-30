import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remote;
  final UserLocalDataSource _local;

  const UserRepositoryImpl(
    this._remote,
    this._local,
  );

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    final res = await _remote.getUser();
    return res.fold(
      (failure) {
        final localRes = _local.getUser();
        return localRes;
      },
      (userModel) {
        _local.saveUser(userModel.toEntity());
        return Right(userModel.toEntity());
      },
    );
  }
}
