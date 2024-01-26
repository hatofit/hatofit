import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/repositories/image_repository.dart';

class ImageFromCameraUsecase extends NoParamsUseCase<File> {
  final ImageRepository _repo;

  ImageFromCameraUsecase(this._repo);

  @override
  Future<Either<Failure, File>> call() async {
    return await _repo.getImageFromCamera();
  }
}
