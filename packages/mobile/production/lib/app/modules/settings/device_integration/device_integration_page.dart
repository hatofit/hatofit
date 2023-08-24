import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/settings/device_integration/device_integration_controller.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/polar_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';

class DeviceIntegrationPage extends GetView<DeviceIntegrationController> {
  const DeviceIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bluetoothService = Get.find<BluetoothService>();
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
          GetBuilder<PolarService>(
            builder: (polarService) => SizedBox(
              height: ThemeManager().screenHeight / 5,
              width: ThemeManager().screenWidth,
              child: FutureBuilder(
                future: polarService.detectedDevices.isEmpty
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
                  } else if (polarService.detectedDevices.isEmpty) {
                    return const Center(
                      child: Text(
                          "Didn't see any device🫣,\nmake sure your device is turn on"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: polarService.detectedDevices.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            polarService.detectedDevices[index].imageAsset,
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            polarService.detectedDevices[index].name,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                'ID :${polarService.detectedDevices[index].deviceId}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                ' RSSI : ${polarService.detectedDevices[index].rssi} dBm',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          trailing: Obx(
                            () => bluetoothService.isConnectedDevice.value
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
                                      polarService.disconnectDevice(polarService
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
                                      bluetoothService.getBluetoothStatus();
                                      polarService.connectDevice(polarService
                                          .detectedDevices[index].deviceId);
                                      Get.back();
                                      Get.dialog(
                                        Obx(
                                          () => Center(
                                              child: bluetoothService
                                                          .isConnectedDevice
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
                                                              polarService
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
                                                              'Device ID : ${polarService.detectedDevices[index].deviceId}',
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
          ),
        ],
      ),
    );
  }
}
