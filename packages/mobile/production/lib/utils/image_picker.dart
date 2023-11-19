import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  static Future pickImage() async {
    return await Get.bottomSheet(
      Container(
        height: 150,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                _pickImageFromCamera().then((value) {
                  Get.back(result: value);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () {
                _pickImageFromGallery().then((value) {
                  Get.back(result: value);
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  static Future<File> _pickImageFromCamera() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (xFile != null) {
      return File(xFile.path);
    } else {
      return Future.error('No image selected');
    }
  }

  static Future<File> _pickImageFromGallery() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (xFile != null) {
      return File(xFile.path);
    } else {
      return Future.error('No image selected');
    }
  }
}
