import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/ext/context.dart';

class GreetingView extends StatelessWidget {
  const GreetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Stack(
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
              padding: EdgeInsets.only(top: Dimens.height48),
              child: Image.asset(
                context.isDarkMode
                    ? 'assets/images/logo/dark.png'
                    : 'assets/images/logo/light.png',
                width: Dimens.menuContainer,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: Dimens.height128),
              child: SvgPicture.asset(
                'assets/images/hero.svg',
                width: Dimens.menuContainer,
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
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
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
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
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
                  style: Theme.of(context).textTheme.bodySmall,
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
                  onPressed: () => context.goNamed(Routes.preference.name),
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
                    Strings.of(context)!.getStarted,
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
