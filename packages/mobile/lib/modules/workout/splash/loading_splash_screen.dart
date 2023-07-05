import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (storage.read('name') != null) {
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Get.offAllNamed(AppRoutes.inputUserInfo);
      }
    });
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
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
                Image.asset(
                  'assets/images/logo/title.png',
                  width: 166,
                ),
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
