import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/pages/setting/setting_controller.dart';
import 'package:polar_hr_devices/widget/custom_app_bar.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.black00,
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                controller.streamingService.searchForDevices((deviceId) {});
              },
              child: const Text('Scan Devices', style: TextStyle(fontSize: 20))),
          ListTile(
            title: Text('Device ID: ${controller.streamingService.deviceId}'),
            trailing: IconButton(
              onPressed: () async {
                controller.streamingService
                    .connectingToDevice(controller.streamingService.deviceId);
                await controller.streamingService
                    .streamWhenReady(controller.streamingService.deviceId);
              },
              icon: const Icon(Icons.bluetooth_connected),
            ),
          ),
        ],
      )),
    );
  }
}
