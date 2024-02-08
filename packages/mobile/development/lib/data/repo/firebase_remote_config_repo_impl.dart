import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class FirebaseRemoteConfigRepoImpl implements FirebaseRemoteConfigRepo {
  final RemoteConfig _remote;
  final BoxClient _local;
  final NetworkInfo _info;
  FirebaseRemoteConfigRepoImpl(
    this._remote,
    this._local,
    this._info,
  );

  @override
  Future<Either<Failure, String>> getString(String key) async {
    if (await _info.isGlobalConnected) {
      final res = await _remote.getString(key);
      return res.fold((l) {
        return Left(l);
      }, (r) async {
        await _local.appConfigBox.put(key, r);
        return Right(r);
      });
    } else {
      final String? res = await _local.appConfigBox.get(key);
      if (res != null) {
        return Right(res);
      } else {
        return const Left(NoInternetFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> getBool(String key) async {
    if (await _info.isGlobalConnected) {
      final res = await _remote.getBool(key);
      return res.fold((l) {
        return Left(l);
      }, (r) async {
        await _local.appConfigBox.put(key, r);
        return Right(r);
      });
    } else {
      final bool? res = await _local.appConfigBox.get(key);
      if (res != null) {
        return Right(res);
      } else {
        return const Left(NoInternetFailure());
      }
    }
  }
}
