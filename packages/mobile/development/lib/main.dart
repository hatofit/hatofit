import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatofit/utils/utils.dart';

import 'dependecy_injector.dart';
import 'my_app.dart';

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
    ).then((_) => runApp(MyApp()));
  }, (error, stack) async {
    await FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
