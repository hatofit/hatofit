import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/pages/setting/setting_controller.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.black00,
      ),
      body:   Center(
        child: TextButton(
          onPressed: (){},
          child: const Text('Scan for devices'),
        ),
      ),
    );
  }
}
