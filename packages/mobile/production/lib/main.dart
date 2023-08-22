import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hatofit/presentation/controller/auth/auth_bind.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/services/local_storage.dart';
import 'app/services/storage_service.dart';
import 'app/themes/app_theme.dart';
import 'app/utils/di.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';

Future<void> main() async {
  DI.init();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.logAppOpen();
  await initServices();
  runApp(const App());
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn =
  
  //         'https://344878d87b0733252d3ef69819e28efe@o4505710277820416.ingest.sentry.io/4505710280245248';
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     options.tracesSampleRate = 1.0;
  //     options.debug = true;
  //     options.tracesSampler = (samplingContext) {
  //       // Always send errors to Sentry.
  //       if (samplingContext.transactionContext.operation == "http.request") {
  //         return 1.0;
  //       }
  //       return 0.0;
  //     };
  //   },
  //   appRunner: () => runApp(
  //       DefaultAssetBundle(bundle: SentryAssetBundle(), child: const App())),
  // );
  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hato Fit',
      initialRoute: AppRoutes.splash,
      initialBinding: AuthBind(),
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // navigatorObservers: [
      //   SentryNavigatorObserver(),
      // ],
    );
  }
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => StorageService().init());
}
