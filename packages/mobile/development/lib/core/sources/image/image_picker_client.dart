import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClient with FirebaseCrashLogger {
  late ImagePicker _imagePicker;
  late ImageCropper _imageCropper;

  ImagePickerClient() {
    try {
      _imagePicker = _createImagePicker();
      _imageCropper = _createImageCropper();
    } catch (e) {
      nonFatalError(error: e, stackTrace: StackTrace.current);
    }
  }

  ImagePicker get imagePicker {
    try {
      _imagePicker = _createImagePicker();
      _imageCropper = _createImageCropper();
    } catch (e) {
      nonFatalError(error: e, stackTrace: StackTrace.current);
    }
    return _imagePicker;
  }

  ImagePicker _createImagePicker() => ImagePicker();
  ImageCropper _createImageCropper() => ImageCropper();

  Future<Either<Failure, CroppedFile>> cropImage(XFile image) async {
    try {
      final res = await _imageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.circle,
        compressQuality: 10,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Palette.maroonLatte,
            toolbarWidgetColor: Palette.background,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (res == null) throw Exception('No image selected');
      return Right(res);
    } on Exception catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(NoDataFailure(e.toString()));
    }
  }

  Future<Either<Failure, CroppedFile>> getImageFromGallery() async {
    try {
      final res = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (res == null) throw Exception('No image selected');
      final res2 = await cropImage(res);
      return res2;
    } on Exception catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(NoDataFailure(e.toString()));
    }
  }

  Future<Either<Failure, CroppedFile>> getImageFromCamera() async {
    try {
      final res = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (res == null) throw Exception('No image selected');
      final res2 = await cropImage(res);
      return (res2);
    } on Exception catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(NoDataFailure(e.toString()));
    }
  }
}
