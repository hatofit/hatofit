import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorPalette.backgroundColor,
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: SvgPicture.asset('assets/images/hero.svg'),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Healthy life,\nhappy life.\nGo Healthy!',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text:
                              'Elevate your workout experience with HatoFit today.',
                          fontSize: 14,
                          color: ColorPalette.black50,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.inputUserInfo);
                        },
                        child: CustomText(
                          text: 'Get Started',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.black,
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          side: const BorderSide(
                            color: ColorPalette.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
