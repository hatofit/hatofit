import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ImageRemoteDataSource {
  Future<Either<Failure, File>> downloadImage(DownloadImageParams params);
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final DioClient _client;

  ImageRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, File>> downloadImage(
    DownloadImageParams params,
  ) async {
    final res = await _client.downloadRequest(
      params.url,
      params.fileName,
    );

    return res;
  }
}
