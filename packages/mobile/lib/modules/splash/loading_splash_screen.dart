import 'package:flutter/material.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
