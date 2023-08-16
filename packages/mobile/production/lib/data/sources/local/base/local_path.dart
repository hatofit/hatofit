import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalPath {
   Directory  get base  =>   Directory.current;
  static final _singleton = LocalPath();
  static LocalPath get instance => _singleton;

  static const String session = 'session';
  static const String exercise = 'exercise';
}
