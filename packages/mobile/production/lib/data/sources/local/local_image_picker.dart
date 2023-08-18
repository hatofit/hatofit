import 'package:image_picker/image_picker.dart';

import 'base/image_source.dart';

abstract class ImagePickerBase {
  ImageSource get sourceType;
  Future call();
}

class LocalImagePicker implements ImagePickerBase {
  @override
  final ImageSource sourceType;
  LocalImagePicker._({required this.sourceType});

  factory LocalImagePicker.camera({
    required sourceType,
  }) =>
      LocalImagePicker._(sourceType: sourceType);

  factory LocalImagePicker.gallery({
    required sourceType,
  }) =>
      LocalImagePicker._(sourceType: sourceType);

  @override
  Future call() {
    return LocalImageSource.instance.request(this);
  }
}
