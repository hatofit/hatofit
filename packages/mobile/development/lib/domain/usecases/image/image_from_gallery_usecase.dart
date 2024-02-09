import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ImageFromGalleryUsecase extends FNPUC<File> {
  final ImageRepo _repo;

  ImageFromGalleryUsecase(this._repo);

  @override
  Future<Either<Failure, File>> call() => _repo.getImageFromSource();
}
