import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class ImageUtils {
  static Future<File> toFile(XFile pickedImage) async {
    final img.Image? image = img.decodeImage(await pickedImage.readAsBytes());
    final img.Image resizedImage = img.copyResize(image!, height: 256);
    final File file = await localPath();
    await file.writeAsBytes(img.encodeJpg(resizedImage));
    return file;
  }

  static Future<File> localPath() async {
    final Directory? dir = await getExternalStorageDirectory();
    return File('${dir!.path}/photo-profile.jpg');
  }

  static Future<String> toBase64(File pickedImage) async {
    final img.Image? image = img.decodeImage(await pickedImage.readAsBytes());
    final img.Image resizedImage = img.copyResize(image!, height: 256);
    return base64Encode(img.encodeJpg(resizedImage));
  }

  static Future<File> fromBase64(String base64) async {
    final img.Image? image = img.decodeImage(base64Decode(base64));
    final img.Image resizedImage = img.copyResize(image!, height: 256);
    final File file = await localPath();
    await file.writeAsBytes(img.encodeJpg(resizedImage));
    return file;
  }
}
