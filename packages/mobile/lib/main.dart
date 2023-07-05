import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polar_hr_devices/routes/app_pages.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const MyApp());
}

final storage = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hato Fit',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
