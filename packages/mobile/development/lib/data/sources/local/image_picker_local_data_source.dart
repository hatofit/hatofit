import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/core/sources/image/image_picker_client.dart';
import 'package:image_cropper/image_cropper.dart';

abstract class ImageLocalDataSource {
  Future<Either<Failure, CroppedFile>> getImageFromSource();
  Future<Either<Failure, CroppedFile>> getImageFromCamera();
}

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  final ImagePickerClient _client;

  ImageLocalDataSourceImpl(
    this._client,
  );

  @override
  Future<Either<Failure, CroppedFile>> getImageFromCamera() async {
    final res = await _client.getImageFromCamera();
    return res;
  }

  @override
  Future<Either<Failure, CroppedFile>> getImageFromSource() async {
    final res = await _client.getImageFromGallery();
    return res;
  }
}
