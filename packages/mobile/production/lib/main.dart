import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hatofit/app/app.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app/utils/di.dart';

Future<void> main() async {
  DI.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.logAppOpen();
  await initServices();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://344878d87b0733252d3ef69819e28efe@o4505710277820416.ingest.sentry.io/4505710280245248';
      options.tracesSampleRate = 1.0;
      options.debug = true;
      options.tracesSampler = (samplingContext) {
        // Always send errors to Sentry.
        if (samplingContext.transactionContext.operation == "http.request") {
          return 1.0;
        }
        return 0.0;
      };
    },
    appRunner: () => runApp(
        DefaultAssetBundle(bundle: SentryAssetBundle(), child: const App())),
  );

  runApp(const App());
}
