import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ImageRepoImpl implements ImageRepo {
  final ImageLocalDataSource _local;
  final ImageRemoteDataSource _remote;
  final NetworkInfo _info;
  ImageRepoImpl(
    this._local,
    this._remote,
    this._info,
  );

  @override
  Future<Either<Failure, File>> getImageFromCamera() async {
    final res = await _local.getImageFromCamera();
    return res.fold((l) => Left(l), (r) => Right(File(r.path)));
  }

  @override
  Future<Either<Failure, File>> getImageFromSource() async {
    final res = await _local.getImageFromSource();
    return res.fold((l) => Left(l), (r) => Right(File(r.path)));
  }

  @override
  Future<Either<Failure, File>> downloadImage(
    DownloadImageParams params,
  ) async {
    if (await _info.isGlobalConnected) {
      final res = await _remote.downloadImage(params);
      return res.fold((l) => Left(l), (r) {
        CachedNetworkImage(
          imageUrl: params.url,
        );
        return Right(r);
      });
    } else {
      return const Left(NoInternetFailure());
    }
  }
}
