import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackbar {
  static success(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      colorText: Get.isDarkMode ? Colors.black : Colors.white,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 28,
      ),
    );
  }

  static error(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      colorText: Get.isDarkMode ? Colors.black : Colors.white,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 28,
      ),
    );
  }

  static warning(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      colorText: Get.isDarkMode ? Colors.black : Colors.white,
      icon: const Icon(
        Icons.warning_amber_outlined,
        color: Colors.yellow,
        size: 28,
      ),
    );
  }

  static info(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      colorText: Get.isDarkMode ? Colors.black : Colors.white,
      icon: const Icon(
        Icons.info_outline,
        color: Colors.blue,
        size: 28,
      ),
    );
  }
}
