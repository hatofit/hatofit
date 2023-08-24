import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hatofit/routes/app_pages.dart';
import 'package:hatofit/routes/app_routes.dart';
import 'package:hatofit/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hato Fit',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    ),
  );
}
