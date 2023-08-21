import 'package:dartz/dartz.dart';
import 'package:hatofit/data/sources/local/local_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';
import '../../domain/repos/image_repo_abs.dart';

class ImageRepoIml implements ImageRepoAbs {
  @override
  Future<Either<Failure, Success>> camera(ImageSource source) async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }
    return await LocalImagePicker.camera(sourceType: source).call();
  }

  @override
  Future<Either<Failure, Success>> gallery(ImageSource source) async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    final res = await LocalImagePicker.gallery(sourceType: source).call();
    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
