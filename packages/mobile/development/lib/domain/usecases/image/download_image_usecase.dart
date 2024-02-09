import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class DownloadImageUsecase extends FPUC<File, DownloadImageParams> {
  final ImageRepo _repo;

  DownloadImageUsecase(this._repo);

  @override
  Future<Either<Failure, File>> call(DownloadImageParams params) =>
      _repo.downloadImage(params);
}
