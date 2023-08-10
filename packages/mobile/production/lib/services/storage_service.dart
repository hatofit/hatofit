import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class StorageService extends GetxController {
  void initializeDirectory() async {
    final List<String> requiredDiretories = [
      'exercise',
      'session',
      'session/raw',
      'session/processed',
    ];
    for (String directory in requiredDiretories) {
      final Directory? dir = await getExternalStorageDirectory();
      if (dir != null) {
        final Directory newDirectory = Directory('${dir.path}/$directory');

        if (!await newDirectory.exists()) {
          await newDirectory.create(recursive: true);
        }
      }
    }
  }

  Future<void> saveToJSON(String filename, dynamic body) async {
    // var json = _sessionModel.toJson();
    // JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    // var stringJson = prettyPrint.convert(json);
    // debugPrint("=============================\n"
    //     "JSON DATA\n"
    //     "$stringJson"
    //     "\n=============================");

    String jsonString = jsonEncode(body);
    final Directory? directory = await getExternalStorageDirectory();

    if (directory != null) {
      String path = '${directory.path}/$filename.json';
      await File(path).writeAsString(jsonString);
    }
  }

  Future<dynamic> readFromJSON(String filename) async {
    final Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      final File file = File('${directory.path}/$filename.json');
      if (await file.exists()) {
        String contents = await file.readAsString();
        return jsonDecode(contents);
      }
    }
  }

  Future<List<String>> readFolder(String folderPath) async {
    final Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      final List<FileSystemEntity> files =
          Directory('${directory.path}/$folderPath').listSync(recursive: true);
      List<String> filenames = [];
      for (FileSystemEntity file in files) {
        filenames.add(file.path);
      }
      return filenames;
    }
    return [];
  }

  Future<void> deleteFile(String filePath) async {
    final Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      final File file = File('${directory.path}/$filePath');
      if (await file.exists()) {
        await file.delete();
      }
    }
  }
}
