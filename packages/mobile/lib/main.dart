import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polar_hr_devices/modules/splash/firstTime/input_user_info_binding.dart';
import 'package:polar_hr_devices/modules/splash/loading_splash_screen.dart';

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
    // return GetMaterialApp(
    //   title: 'HatoFit',
    //   initialRoute: AppRoutes.dashboard,
    //   getPages: AppPages.list,
    //   debugShowCheckedModeBanner: false,
    //   routingCallback: (value) {},
    // );
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingSplashScreen();
        } else {
          if (storage.read('name') != null) {
            return GetMaterialApp(
              title: 'Hato Fit',
              initialRoute: AppRoutes.dashboard,
              getPages: AppPages.list,
              debugShowCheckedModeBanner: false,
            );
          } else {
            return GetMaterialApp(
              title: 'Hato Fit',
              initialRoute: AppRoutes.inputUserInfo,
              initialBinding: InputUserInfoBinding(),
              getPages: AppPages.list,
              debugShowCheckedModeBanner: false,
            );
          }
        }
      },
    );
  }
}
