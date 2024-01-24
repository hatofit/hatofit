import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatofit/dependecy_injection.dart';
import 'package:hatofit/my_app.dart';
import 'package:hatofit/utils/utils.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dependencyInjection();
    await FirebaseServices.init();

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
