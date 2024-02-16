import 'package:flutter/material.dart';
import 'package:hatofit/utils/utils.dart';

class AvataPicker extends StatelessWidget {
  final void Function()? onTap;
  final Widget? firstChild;
  const AvataPicker({super.key, this.onTap, this.firstChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            firstChild ?? Container(),
            Positioned(
              right: -8,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).iconTheme.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      side: BorderSide(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                        width: 2,
                      ),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  onPressed: onTap,
                  child: const Icon(
                    Icons.photo_camera,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
