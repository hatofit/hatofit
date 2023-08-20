import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';

abstract class ImageRepoAbs {
  Future<Either<Failure, Success>> camera(ImageSource source);
  Future<Either<Failure, Success>> gallery(ImageSource source);
}
