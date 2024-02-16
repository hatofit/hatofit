import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hatofit/core/core.dart';

extension ContextExtensions on BuildContext {
  bool isMobile() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;

    return shortestSide < 600;
  }

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  dynamic back([dynamic result]) => Navigator.pop(this, result);

  // Future<dynamic> goTo(String routeName, {Object? args}) =>
  //     Navigator.pushNamed(this, routeName, arguments: args);

  // Future<dynamic> goToReplace(String routeName, {Object? args}) =>
  //     Navigator.pushReplacementNamed(this, routeName, arguments: args);

  // Future<dynamic> goToClearStack(String routeName, {Object? args}) =>
  //     Navigator.pushNamedAndRemoveUntil(
  //       this,
  //       routeName,
  //       (Route<dynamic> route) => false,
  //       arguments: args,
  //     );

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (c) {
          ctx = c;

          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) => false,
            // onWillPop: () async => false,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(this).extension<AppColors>()?.background,
                    borderRadius: BorderRadius.circular(Dimens.radius15),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.width32),
                  padding: EdgeInsets.all(Dimens.width24),
                  child: const Loading(),
                ),
              ),
            ),
          );
        },
      );

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }

  Future pickImage({
    required void Function() camera,
    required void Function() gallery,
  }) {
    return showDialog(
      context: this,
      builder: (context) => Center(
        child: Container(
          height: 170.h,
          padding: EdgeInsets.all(Dimens.width8),
          margin: EdgeInsets.symmetric(
            horizontal: Dimens.width16,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(Dimens.radius8),
          ),
          child: Column(
            children: [
              Text(
                Strings.of(context)!.chooseYourProfilePhoto,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: Dimens.height8),
              Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode ? Palette.cardDark : Palette.card,
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                ),
                child: ListTile(
                  onTap: camera,
                  leading: const Icon(Icons.camera),
                  title: Text(
                    Strings.of(context)!.captureAPhoto,
                  ),
                ),
              ),
              SizedBox(height: Dimens.height8),
              Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode ? Palette.cardDark : Palette.card,
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                ),
                child: ListTile(
                  onTap: gallery,
                  leading: const Icon(Icons.perm_media),
                  title: Text(
                    Strings.of(context)!.selectFromGallery,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
