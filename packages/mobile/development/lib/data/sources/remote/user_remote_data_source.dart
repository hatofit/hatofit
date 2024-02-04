import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, UserModel>> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _client;

  UserRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    final res = await _client.getRequest(
      APIConstant.get.authMe,
      converter: (res) {
        final auth =
            AuthResponseModel.fromJson(res["auth"] as Map<String, dynamic>);
        return UserModel.fromJson(auth.user!.toJson());
      },
    );

    return res;
  }
}
