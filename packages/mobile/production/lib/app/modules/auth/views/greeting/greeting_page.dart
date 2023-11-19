import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/images/mesh-up.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/mesh-down.png'),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 84),
              child: Image.asset(
                Get.isDarkMode
                    ? 'assets/images/logo/dark.png'
                    : 'assets/images/logo/light.png',
                width: Get.width * 0.75,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 84),
              child: SvgPicture.asset(
                'assets/images/hero.svg',
                width: Get.width * 0.75,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 223, left: 32),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Healthy life,',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 38),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 175, left: 32),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'happy heart.',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 38),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 145, left: 32),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'A fitness app that listens to your heart.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: OutlinedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.login);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
