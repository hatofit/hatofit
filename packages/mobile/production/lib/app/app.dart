import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_pages.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/presentation/controller/auth/auth_bind.dart';
import 'package:logger/logger.dart';

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
    );
  }
}

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 55,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
