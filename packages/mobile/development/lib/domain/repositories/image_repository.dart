import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';

abstract class ImageRepository {
  Future<Either<Failure, File>> getImageFromSource();
  Future<Either<Failure, File>> getImageFromCamera();
}
