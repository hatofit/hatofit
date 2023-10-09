import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:intl/intl.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final inet = Get.find<InternetService>();
    final store = Get.find<PreferencesService>();
    StorageService().initializeDirectory();
    if (store.todayMood != null) {
      if (store.todayMood!['date'] !=
          DateFormat('d MMMM yyyy').format(DateTime.now())) {
        store.todayMood = null;
      }
    }
    Future.delayed(const Duration(seconds: 1), () async {
      final res = await inet.getUser();
      if (res.statusText!.contains('connection timed out')) {
        Get.offAllNamed(AppRoutes.greeting);
        return;
      }
      if (res.body['success'] == true) {
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
