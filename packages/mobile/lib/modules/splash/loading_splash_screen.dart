import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}
