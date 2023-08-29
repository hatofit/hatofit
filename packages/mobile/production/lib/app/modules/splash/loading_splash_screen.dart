import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/debug_logger.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    StorageService().initializeDirectory();
    final store = Get.find<PreferencesService>();
    logger.i('Token: ${store.token}');
    Future.delayed(const Duration(seconds: 1), () {
      if (store.token != null) {
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Get.offAllNamed(AppRoutes.greeting);
      }
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          Get.isDarkMode
              ? 'assets/images/logo/dark.png'
              : 'assets/images/logo/light.png',
          width: Get.width * 0.6,
        ),
      ),
    );
  }
}
