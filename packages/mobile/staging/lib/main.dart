import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_pages.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initServices();
  KeepScreenOn.turnOn();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = Get.find<PreferencesService>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HatoFit',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: store.isDarkMode != null
          ? store.isDarkMode!
              ? ThemeMode.dark
              : ThemeMode.light
          : ThemeMode.system,
      enableLog: true,
    );
  }
}

initServices() async {
  await Get.putAsync(() => PreferencesService().init());
  await Get.putAsync(() => InternetService().init());
  await Get.putAsync(() => BluetoothService().init());
}
