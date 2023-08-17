import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/services/local_storage.dart';
import '../../../app/themes/app_theme.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BluetoothService());
    final store = Get.put(LocalStorageService());

    Future.delayed(const Duration(seconds: 1), () async {
      if (store.token != null) {
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
