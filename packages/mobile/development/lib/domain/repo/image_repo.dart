import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

abstract class ImageRepo {
  Future<Either<Failure, File>> getImageFromSource();
  Future<Either<Failure, File>> getImageFromCamera();
  Future<Either<Failure, File>> downloadImage(DownloadImageParams params);
}
