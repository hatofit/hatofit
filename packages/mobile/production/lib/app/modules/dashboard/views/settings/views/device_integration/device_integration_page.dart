import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/polar_device.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/device_integration/device_integration_controller.dart';
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
            margin: const EdgeInsets.only(top: 16),
            height: 5,
            width: Get.height / 3,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(124)),
          ),
          SizedBox(
              height: ThemeManager().screenHeight / 2,
              width: ThemeManager().screenWidth,
              child: FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (bleService.detectedDevices.isEmpty) {
                      return _noDevice(context);
                    } else {
                      return ListView.builder(
                        itemCount: bleService.detectedDevices.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Image.asset(
                                  bleService.detectedDevices[index].imageAsset),
                            ),
                            title: Text(
                              bleService.detectedDevices[index].info.name,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'ID :${bleService.detectedDevices[index].info.deviceId}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Obx(
                                  () => Text(
                                    ' RSSI : ${bleService.detectedDevices[index].info.rssi}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                            trailing: _handleButton(
                                bleService.detectedDevices[index]),
                          );
                        },
                      );
                    }
                  }
                  return SizedBox(
                      height: ThemeManager().screenHeight / 2,
                      width: ThemeManager().screenWidth,
                      child: _noDevice(context));
                },
              ))
        ],
      ),
    );
  }

  Widget _handleButton(PolarDevice device) {
    final bleService = Get.find<BluetoothService>();
    final deviceId = device.info.deviceId;
    final isConnect = device.isConnect;
    if (isConnect.value == false) {
      return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.ceruleanBlue)),
        child: const Text('Connect'),
        onPressed: () {
          bleService.connectDevice(device);
          Get.back();
          Get.dialog(
            connecting(
              deviceName: bleService.detectedDevices
                  .firstWhere((element) => element.info.deviceId == deviceId)
                  .info
                  .name,
              deviceId: bleService.detectedDevices
                  .firstWhere((element) => element.info.deviceId == deviceId)
                  .info
                  .deviceId,
            ), // add context
            transitionCurve: Curves.easeInOutCubic,
          );
        },
      );
    } else {
      return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.crimsonRed)),
        child: const Text('Disconnect'),
        onPressed: () {
          bleService.disconnectDevice(device);
          Get.back();
        },
      );
    }
  }

  Dialog connecting({
    required String deviceName,
    required String deviceId,
  }) {
    final context = Get.context!;
    return Dialog(
        child: SizedBox(
      height: 300,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Connecting to', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 32,
          ),
          const CupertinoActivityIndicator(
            radius: 48,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(deviceName, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(
            height: 4,
          ),
          Text('Device ID : $deviceId',
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    ));
  }

  Widget _noDevice(BuildContext context) {
    final bleService = Get.find<BluetoothService>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't see any device🤔",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Make sure your device is turn on',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 32,
        ),
        TextButton(
          onPressed: () {
            bleService.scanPolarDevices();
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  ColorConstants.ceruleanBlue)),
          child: const Text('Try Again'),
        )
      ],
    );
  }
}
