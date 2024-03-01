import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/dependecy_injection.dart';
import 'package:hatofit/my_app.dart';
import 'package:hatofit/utils/utils.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseServices.init();
    await mainInjection();
    FlutterBluePlus.setLogLevel(LogLevel.none, color: false);
    return SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((_) => runApp(const MyApp()));
  }, (error, stack) async {
    await FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
