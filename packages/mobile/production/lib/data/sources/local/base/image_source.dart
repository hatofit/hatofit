import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import '../local_image_picker.dart';

class LocalImageSource {
  final ImagePicker _picker = ImagePicker();
  static final _singleton = LocalImageSource();
  static LocalImageSource get instance => _singleton;

  Future<Either<Failure, Success>> request(ImagePickerBase source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source.sourceType);
      if (pickedFile != null) {
        return Right(
            Success(code: 'OK', message: 'Image picked', data: pickedFile));
      } else {
        return Left(Failure(
            code: 'ERROR',
            message: 'No image picked',
            details: 'Fail to pick image'));
      }
    } catch (e) {
      return Left(Failure(
          code: 'ERROR',
          message: 'Fail to pick image',
          details: 'Cause: ${e.toString()}'));
    }
  }
}
