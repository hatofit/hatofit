import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PhotoPofile extends StatelessWidget {
  const PhotoPofile({super.key, this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.pickImage();
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            controller.pickedImage.value.path.isEmpty
                ? const Icon(
                    FontAwesomeIcons.user,
                    size: 75,
                    color: Colors.grey,
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(
                      controller.pickedImage.value,
                    ),
                  ),
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
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: 2,
                      ),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  onPressed: () {
                    controller.pickImage();
                  },
                  child: const Icon(
                    CupertinoIcons.photo_camera,
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
