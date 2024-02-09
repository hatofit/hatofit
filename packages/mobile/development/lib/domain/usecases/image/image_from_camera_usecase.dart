import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ImageFromCameraUsecase extends FNPUC<File> {
  final ImageRepo _repo;

  ImageFromCameraUsecase(this._repo);

  @override
  Future<Either<Failure, File>> call() => _repo.getImageFromCamera();
}
