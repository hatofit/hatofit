import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/routes/app_routes.dart';
import 'package:hatofit/services/storage_service.dart';
import 'package:hatofit/themes/app_theme.dart';
import 'package:hatofit/utils/preferences_provider.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    StorageService().initializeDirectory();
    final prefs = PreferencesProvider();

    Future.delayed(const Duration(seconds: 1), () async {
      final userToken = await prefs.getUserToken();
      if (userToken != null) {
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Get.offAllNamed(AppRoutes.greeting);
      }
    });
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo/image.png',
              width: 84,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo/title.png',
                    width: 166,
                    color: ThemeManager().isDarkMode ? Colors.grey[300] : null),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/logo/subtitle.png',
                  width: 166,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
