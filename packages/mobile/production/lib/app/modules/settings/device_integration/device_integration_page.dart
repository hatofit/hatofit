import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/settings/device_integration/device_integration_controller.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';

class DeviceIntegrationPage extends GetView<DeviceIntegrationController> {
  const DeviceIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bleService = Get.find<BluetoothService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discoverable Devices',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 5,
            width: Get.height / 3,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(124)),
          ),
          SizedBox(
            height: ThemeManager().screenHeight / 5,
            width: ThemeManager().screenWidth,
            child: FutureBuilder(
              future: bleService.detectedDevices.isEmpty
                  ? Future.delayed(const Duration(seconds: 3))
                  : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                } else if (bleService.detectedDevices.isEmpty) {
                  return const Center(
                    child: Text(
                        "Didn't see any device🫣,\nmake sure your device is turn on"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: bleService.detectedDevices.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                          bleService.detectedDevices[index].imageAsset,
                          height: 50,
                          width: 50,
                        ),
                        title: Text(
                          bleService.detectedDevices[index].name,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              'ID :${bleService.detectedDevices[index].deviceId}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              ' RSSI : ${bleService.detectedDevices[index].rssi} dBm',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        trailing: Obx(
                          () => bleService.isConnectedDevice.value
                              ? TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorConstants.crimsonRed)),
                                  child: const Text('Disconnect'),
                                  onPressed: () {
                                    bleService.disconnectDevice(bleService
                                        .detectedDevices[index].deviceId);
                                    Get.back();
                                  },
                                )
                              : TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorConstants.ceruleanBlue)),
                                  child: const Text('Connect'),
                                  onPressed: () {
                                    bleService.getBluetoothStatus();
                                    bleService.connectDevice(bleService
                                        .detectedDevices[index].deviceId);
                                    Get.back();
                                    Get.dialog(
                                      Obx(
                                        () => Center(
                                            child: bleService.isConnectedDevice
                                                        .value ==
                                                    false
                                                ? Dialog(
                                                    child: SizedBox(
                                                    height: 300,
                                                    width: 150,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text('Connecting to',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge),
                                                        const SizedBox(
                                                          height: 32,
                                                        ),
                                                        const CupertinoActivityIndicator(
                                                          radius: 48,
                                                        ),
                                                        const SizedBox(
                                                          height: 32,
                                                        ),
                                                        Text(
                                                            bleService
                                                                .detectedDevices[
                                                                    index]
                                                                .name,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                            'Device ID : ${bleService.detectedDevices[index].deviceId}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium),
                                                      ],
                                                    ),
                                                  ))
                                                : FutureBuilder(
                                                    future: Future.delayed(
                                                        const Duration(
                                                            seconds: 3), () {
                                                      Get.back();
                                                    }),
                                                    builder: (context,
                                                            snapshot) =>
                                                        const Dialog(
                                                            child: Text(
                                                                'Connected')),
                                                  )),
                                      ),
                                      transitionCurve: Curves.easeInOutCubic,
                                    );
                                  },
                                ),
                        ),
                        onTap: () {},
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
