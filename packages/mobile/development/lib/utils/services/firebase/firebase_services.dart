import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'firebase_options.dart';

mixin FirebaseServices {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    Isolate.current.addErrorListener(
      RawReceivePort((List<dynamic> pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last as StackTrace,
        );
      }).sendPort,
    );
  }
}
