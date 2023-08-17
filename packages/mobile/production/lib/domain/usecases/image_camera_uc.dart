import 'package:dartz/dartz.dart';
import 'package:hatofit/domain/repositories/image_repo_abs.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../app/core/usecases/param_uc.dart';

class ImageCameraUC extends ParamUseCase<Either<Failure, Success>, ImageSource> {
  final ImageRepoAbs _imageRepoAbs;
  ImageCameraUC(this._imageRepoAbs);
  @override
  Future<Either<Failure, Success>> execute(ImageSource param) {
    return _imageRepoAbs.camera(param);
  }
}
