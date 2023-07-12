import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class StorageService extends GetxController {
  Future<void> saveToJSON(String filename, dynamic body) async {
    // var json = _sessionModel.toJson();
    // JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    // var stringJson = prettyPrint.convert(json);
    // debugPrint("=============================\n"
    //     "JSON DATA\n"
    //     "$stringJson"
    //     "\n=============================");

    String jsonString = jsonEncode(body);

    // save to file to local storage
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
}
