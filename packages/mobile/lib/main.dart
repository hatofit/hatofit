import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polar_hr_devices/routes/app_pages.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:polar_hr_devices/services/storage_service.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hato Fit',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: StorageService().storage.read('theme') ?? ThemeMode.system,
    ),
  );
}
